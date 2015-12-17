
// SETTINGS

/*
to do
- Berechnung 'Gewichtung der Preset' stimmt nicht (~partialBalanceFunc). --> Gewichtungsfaktor anders Umsetzen.
- Hit - Resonanz Verhalten definieren: Hit löst Resonance aus, die (sofern kein weterer Druck da ist) langsam aus-faded.
- Schiebgeräusch - wenn laut auch resoniert
- Umsetzung Gewichtung Partials überdenken.. stimmt so nicht

*/

(
s.waitForBoot({
	/*	o = Server.local.options;
	o.device = "MADIface USB (23602333)";
	o.numOutputBusChannels = 32;

	s.bootSync;*/

	~dir = PathName(thisProcess.nowExecutingPath).pathOnly;
	~buffers = (~dir ++ "samples_snare/*").pathMatch.collect({|path| Buffer.read(s, path)});
	// ~port = SerialPort("/dev/tty.usbmodem1d11411", baudrate: 230400, crtscts:true); // output soundplane

	s.sync;

	~group = Array.fill(10, {Group.new}); // 10 Stimmen
	~kbus = Array.fill(10, {Bus.control(s, 1)});
	~snd = nil!10;
	~trigFunc = nil!10;

	"defs/*".loadRelative;

	~partialData = ~snareResData; // set partial data
	~partialData = ~random1; // set partial data
	~partianNum = ~partialData.size;

	// PARTIALS GEWICHTUNG
	~dim = [5, 30];
	// ~mtrx = Array.fill(7, {0.0!~dim[0]!~dim[1]}); // Matrix;
	~spots = [[0.1, 0.5], [0.3, 0.15], [0.3, 0.75], [0.6, 0.15], [0.6, 0.75], [0.9, 0.5], [0.5, 0.5]]; // Koordinaten presets
	// Amp variierung der einzelnen Partials, mit Gewichtung auf den oberen Teiltönen - ausgenommen: mittleres preset (05, 0.5)
	~weigthArray = (~spots.size-1).collect({|i|
		Array.fill((~partianNum), {8.0.rand}) * Array.fill((~partianNum), {|i| ((i+1)/(~partianNum-1))**2})
	});
	// mittleres Preset hinzufügen mit gewichtung tiefster Teiltöne
	~weigthArray = ~weigthArray ++ [(Array.fill((~partianNum), {8.0.rand}) * Array.fill((~partianNum), {|i| (1-((i+1)/~partianNum))**2}))];


	// OSC CONNECTIONS  --> datenfluss minimieren: wenn druck == 0 oder keine Bewegung
	10.do({|i|
		OSCFunc( { | msg, time, addr, recvPort|
			~kbus[i].set(msg[3]); // amp bus zur onset detection
			~partialBalanceFunc.(msg, i); //partial Gewichtung
			~fell.(msg, i); // set partial sounds
			~group[i].set(\mul, msg[3]**2); // pressure --> amp global
			if (msg[3] > 0.4, {var scale = msg[3] - 0.4; ~group[i].set(\scale, scale.lincurve(0, 1, 0, 1, 3))}); // druck --> pitch bend
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

	}
)

)

s.meter

//// CLEANUP

~hitDetections.do(_.free);
~getOnsetOSC.free;
~fromHS_OSC.do(_.free);
~group.do(_.free);
~kbus.do(_.free);
~tap.free;





/// TESTING

~testFunc = {
	var mx, my, amp, msg;
	fork{
		inf.do{
			mx = rrand(0.0, 0.99);
			my = rrand(0.0, 0.99);
			amp = rrand(0.001, 1);
			msg = [0, 0, my, amp, mx].postln; // simulation input Koordinaten
			~kbus[0].set(amp);
			~partialBalanceFunc.(msg, 0);
			~fell.(msg, 0);
			~group[0].set(\mul, amp);
			if (amp > 0.3, {var val = amp - 0.3; ~group[0].set(\scale, val.lincurve(0, 1, 1, 1.15, 3))}); // druck --> pitch bend
			1.wait;
		}
	}
}.value;

~trigFunc[0].play;

x = Synth(\t_sfplay, [\buf, ~buffers.choose, \mul, 0.7]);
x.set(\t_trig, 1, \buf, ~buffers.choose)
(
~testFunc.stop;
~group[0].release;
~snd[0] = nil;
)




