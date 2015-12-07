
// SETTINGS

/*
to do
- Berechnung 'Gewichtung der Preset' stimmt nicht (~partialBalanceFunc). --> Gewichtungsfaktor anders Umsetzen.
- Hit - Resonanz Verhalten definieren: Hit löst Resonance aus, die (sofern kein weterer Druck da ist) langsam aus-faded.
- Schiebgeräusch - wenn laut auch resoniert
- Umsetzung Gewichtung Partials überdenken.. stimmt so nicht

*/

~dir = PathName(thisProcess.nowExecutingPath).pathOnly;
~buffers = (~dir ++ "samples_snare/*").pathMatch.collect({|path| Buffer.read(s, path)});

s.sync;

~group = Array.fill(10, {Group.new}); // 10 Stimmen
~kbus = Array.fill(10, {Bus.control(s, 1)});
~snd = nil!10;
~trigFunc = nil!10;

"defs/*".loadRelative;

~partialData = ~snareResData; // set partial data
~partianNum = ~partialData.size;

// PARTIALS GEWICHTUNG
~dim = [100, 100];
~mtrx = Array.fill(7, {0.0!~dim[0]!~dim[1]}); // Matrix;
~spots = [[0.1, 0.5], [0.3, 0.15], [0.3, 0.75], [0.6, 0.15], [0.6, 0.75], [0.9, 0.5], [0.5, 0.5]]*~dim; // Koordinaten presets
// ~weigth = [-33, -30, -27, -24, -21, -18, -15, -12, -9, -6, -3, 0].mirror1;
// Amp variierung der einzelnen Partials, mit Gewichtung auf den oberen Teiltönen - ausgenommen: mittleres preset (05, 0.5)
~weigthArray = (~spots.size-1).collect({|i| Array.fill((~partianNum), {8.0.rand}) * Array.fill((~partianNum), {|i| ((i+1)/(~partianNum-1))**2})});
// mittleres Preset hinzufügen mit gewichtung tiefster Teiltöne
~weigthArray = ~weigthArray ++ [(Array.fill((~partianNum), {8.0.rand}) * Array.fill((~partianNum), {|i| (1-((i+1)/~partianNum))**2}))];


~spots.do({|coord, spot| // Anteil des jeweiligen Presets (0 - 1), abnebend vom Mittelpunkt aus.
	var cx, cy, umkreis;
	// [coord, spot].postln;
	cx = coord[0];
	cy = coord[1];
	~mtrx[spot][cx][cy] = 1; // Mittelpunkt preset
	umkreis = 35; // Umkreis in Koordinatenpunkte
	umkreis.do({|n|
		var val;
		n = n+1;
		val = (1-(n/umkreis)).sqrt;
		((n*2)+1).do({|i| i= i-n;
			~mtrx[spot][(cx-n).clip(0, 99)][(cy+i).clip(0, 99)] = val;
			~mtrx[spot][(cx+n).clip(0, 99)][(cy+i).clip(0, 99)] = val;
			~mtrx[spot][(cx+i).clip(0, 99)][(cy-n).clip(0, 99)] = val;
			~mtrx[spot][(cx+i).clip(0, 99)][(cy+n).clip(0, 99)] = val;
		});
	});
});



// OSC CONNECTIONS  --> datenfluss minimieren: wenn druck == 0 oder keine Bewegung
~fromHS_OSC = 10.collect({|i| OSCFunc( { | msg, time, addr, recvPort|
	~kbus[i].set(msg[3]); // amp bus zur onset detection
	~partialBalanceFunc.(msg, i); //partial Gewichtung
	~fell.(msg, i); // set partial sounds
	~group[i].set(\mul, msg[3]); // pressure --> amp global
	if (msg[3] > 0.3, {var scale = msg[3] - 0.3; ~group[i].set(\scale, val.lincurve(0, 1, 1, 1.35))}); // druck --> pitch bend
	msg.postln}, '/t3d/tch'++i.asSymbol, recvPort: 3123)
});

// Trigger impuls
~tap = Synth(\t_sfplay, [\buf, ~buffers.choose, \mul, 0]); // hit sound

~hitDetections = 10.collect({|i| ~trigFunc[i].play}); // onset detection

~getOnsetOSC = OSCFunc({|msg| // hit sound wird bei onset gespielt
	~tap.set.(\t_trig, 1, \buf, ~buffers.choose, \mul, 0.7)
},'/tr', s.addr);



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
			if (amp > 0.3, {var val = amp - 0.3; ~group[0].set(\scale, val.lincurve(0, 1, 1, 1.35, 3))}); // druck --> pitch bend
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




