
// SETTINGS

/*
DRUM RESONANCE
3 akustische (Re-)Aktionen:
- kurzes Anschlagen: lösz ein Trommelschlag aus
- Druck an verschiedenen Positionen: 3 verschieden gestimmte Resonanzfrequenzen hörbar. Nachdruck moduliert leicht die Frequenzen.
- Mit Druck über die Oberflache gleiten: neben den Resonanzfrequenzen ist auch ein Kontaktgeräusch hörbar
- NEU: Audiofeedback auf HSoundplane spielt die Differenztöne

to do:
Druck in der Mitte sollte die Frequenzen stärker als am Rand modulieren
noch flascher Ausgangskanal für das HSoundplane Audio-Feedback...
*/



(
s.waitForBoot({
	var win, menu;

	~dir = PathName(thisProcess.nowExecutingPath).pathOnly;
	~buffers = (~dir ++ "samples_snare/*").pathMatch.collect({|path| Buffer.read(s, path)});
	// ~port = SerialPort("/dev/tty.usbmodem1d11411", baudrate: 230400, crtscts:true); // output soundplane
	~surfacebufs = (~dir ++ "sf_surface/*").pathMatch.collect({|file| Buffer.read(s, file)});


	s.sync;

	~group = Array.fill(10, {Group.new}); // 10 Stimmen
	~kbus = Array.fill(10, {Bus.control(s, 1)});
	~snd = nil!10;
	~sndHS = nil!10;
	~trigFunc = nil!10;

	"defs_res/*".loadRelative;

	s.sync;

	~partialData = ~snareResData; // set partial data
	~partialData = ~random1; // set partial data
	~partianNum = ~partialData.size;

	// PARTIALS GEWICHTUNG
	~dim = [5, 30];
	// ~mtrx = Array.fill(7, {0.0!~dim[0]!~dim[1]}); // Matrix;
	~spots = [[0.1, 0.5], [0.3, 0.15], [0.3, 0.75], [0.6, 0.15], [0.6, 0.75], [0.9, 0.5], [0.5, 0.5]]; // Koordinaten presets

	5.do({|v| ~snd[v] = ~freqs3[0].collect({|i| Synth(\partial2, [\freq, i, \mul, 0, \deviation, 0, \sFaktor, i.reciprocal * 300], ~group[v])})}); // 5 voices
	// 5.do({|v| ~sndHS[v] = ~freqs3beatings.collect({|i| Synth(\partial2, [\freq, i, \mul, 0, \deviation, 0, \sFaktor, rrand(5, 20)], ~group[v])})}); // 5 voices
	~sfplayer = 5.collect({|v| Synth(\sfplayer3, [\buf1, ~surfacebufs[0], \buf2, ~surfacebufs[1],  \buf3, ~surfacebufs[2]])});

	s.sync;

	// OSC CONNECTIONS  --> datenfluss minimieren: wenn druck == 0 oder keine Bewegung
	~oscFunc = 5.collect({|i|
		OSCFunc( { | msg, time, addr, recvPort|
			~kbus[i].set(msg[3]); // amp bus zur onset detection
			~setPartialVol2.(msg, i);
			~group[i].set(\mul, (msg[3]**2)*0.2); // pressure --> amp global
			~moveSnd.(msg, i);
			if (msg[3] > 0.1, {var scale = msg[3] - 0.1; ~group[i].set(\scale, scale.lincurve(0, 0.9, 0, 1, 3))}); // druck --> pitch bend
			// msg.postln
		}, '/t3d/tch'++i.asSymbol, recvPort: 3190)
	});

	// Trigger impuls
	~tap = Synth(\t_sfplay, [\buf, ~buffers.choose, \mul, 0]); // hit sound

	~hitDetections = 10.collect({|i| ~trigFunc[i].play(args: [\threshold, 0.15])}); // onset detection

	~getOnsetOSC = OSCFunc({|msg| // hit sound wird bei onset gespielt
		var rand;
		rand = [rrand(48, 65), rrand(100, 165), rrand(180, 190), rrand(380, 565), rrand(880, 950), rrand(1248, 2865)];
		~tap.set(\t_trig, 1, \buf, ~buffers.choose, \mul, msg[3]);
		~partialData = ~randFunc.();
	},'/tr', s.addr);


	// GUI
	~win = Window.new(bounds: Rect(400, 800, 300, 100));
	menu = PopUpMenu(~win, Rect(20, 20, 250, 30))
	.items_(["sound 1", "sound 2"]);
	menu.action = {arg m;
		var freqs;
		freqs = ~freqs3[m.value];
		~group.do(_.release);
		5.do({|v| ~snd[v] = freqs.collect({|i| Synth(\partial2, [\freq, i, \mul, 0, \deviation, 0, \sFaktor, rrand(5, 20)], ~group[v])})}); // 5 voices
	};

	~win.front;

	~win.onClose_({
		~hitDetections.do(_.free);
		~getOnsetOSC.free;
		~fromHS_OSC.do(_.free);
		~group.do(_.free);
		~kbus.do(_.free);
		~tap.free;
		~buffers.do(_.free);
		~surfacebufs.do(_.free);
		~sfplayer.do(_.free);
		// ~oscFunc.do(_.clear)
	});

	}
)
)


