
SynthDef(\partial,  {
	arg out = 0, freq = 100, scale = 1.0, deviation = 10, parMul = 1, mul = 1, mulMod = 0, modFreq = 3, pan = 0, gate = 1;
	var snd, env, mod;
	env = EnvGen.kr(Env.asr(0.1, 1, 2, [-2, -4]), gate, doneAction: 2);
	mod = LFDNoise3.kr(modFreq) * deviation;
	snd = SinOsc.ar(freq * scale + mod, 0, (parMul.ampdb + mulMod).dbamp.clip(0, 1));
	Out.ar(out, Pan2.ar(snd, pan) * mul * env)
}, [nil, 0.1, 0.01, 0.1, 0.1, 0.1, 0.1]).add;


~partialData = [
	[90, 0.097, 5],
	[141, 0.06, 3],
	[190, 0.044, 5],
	[200, 0.04, 4],
	[251, 0.29, 4],
	[301, 0.05, 3],
	[360, 0.024, 6],
	[405, 0.01, 5],
	[455, 0, 8],
	[470, 0, 10],
	[503, 0, 10],
	[522, 0, 12],
];


~group = Array.fill(10, {Group.new});
~kbus = Array.fill(10, {Bus.control(s, 1)});
~snd = nil!10;
~partialData.do({|array| Synth(\partial, [\freq, array[0], \mul, array[1], \deviation, array[2]/4], ~group)});


~weigth = [-33, -30, -27, -24, -21, -18, -15, -12, -9, -6, -3, 0].mirror1;
~weigthArray = 6.collect({|i| ~weigth.rotate(i.neg)});
~weigthArray = ~weigthArray ++ [24!12];


~spots = [[10, 50], [30, 15], [30, 75], [60, 15], [60, 75], [90, 50], [50, 50]];

~coord = Array.fill(7, {0.0!100!100}); // Matrix;

~spots.do({|coord, spot|
	var cx, cy, umkreis;
	// [coord, spot].postln;
	cx = coord[0];
	cy = coord[1];
	~coord[spot][cx][cy] = 1; // Mittelpunkt (Koordinaten)
	umkreis = 25; // Umkreis in Koordinatenpunkte
	umkreis.do({|n|
		var val;
		n = n+1;
		val = (1-(n/umkreis)).sqrt;
		((n*2)+1).do({|i| i= i-n;
			~coord[spot][(cx-n).clip(0, 99)][(cy+i).clip(0, 99)] = val;
			~coord[spot][(cx+n).clip(0, 99)][(cy+i).clip(0, 99)] = val;
			~coord[spot][(cx+i).clip(0, 99)][(cy-n).clip(0, 99)] = val;
			~coord[spot][(cx+i).clip(0, 99)][(cy+n).clip(0, 99)] = val;
		});
	});
});




o = [80, 70]; // Koordinaten Finger
h = ~coord.size.collect({|spot| ~coord[spot][o[0]][o[1]]}).normalizeSum;
(h*~weigthArray).sum.clip(-33, 0);


// function

~fell = {|msg, voice |
	var amp;
	amp = msg[3];
	if (amp < 0.001, {~group[voice].release},
		{if (~snd[voice].isNil, {~snd[voice] = ~partialData.collect({|array|
			Synth(\partial, [\freq, array[0], \mul, amp, \parMul, array[1], \deviation, array[2]/4], ~group[voice])});
			})
	})
};


~dir = PathName(thisProcess.nowExecutingPath).pathOnly;
~buffers = (~dir ++ "samples_drum/*").pathMatch.collect({|path| Buffer.read(s, path)});

SynthDef(\t_sfplay, {
	arg out = 0, buf, mul = 1, t_trig = 0;
	var snd = PlayBuf.ar(1, buf, 1, t_trig);
	Out.ar(out, snd!2 * mul)
}).add;

~trigFunc = nil!10;

10.do({|i|
	~trigFunc[i] = {|threshold = 0.01|
		var amp, onset;
		amp = ~kbus[i].kr;
		onset = HPZ1.kr(amp).abs.poll > threshold; // onset detection
		onset = Trig1.kr(onset, 0.01); // lockout
		SendTrig.kr(onset, 0, 1)
	};
}):


~partialBalanceFunc = {|msg|
	var cx, cy, values;
	cx = msg[4]; cy = msg[2];
	values = ~coord.size.collect({|spot| ~coord[spot][cx][cx]}).normalizeSum;
	~partialBalance = (values * ~weigthArray).sum.clip(-33, 0); // Lautheit verhältnis partials
	~snd[voice].do({|synth, i| synth.set(\mulMod, ~partialBalance[i])});
};


/// OSC Connection
10.do({|i| OSCFunc( { | msg, time, addr, recvPort|
	~kbus[i].set(msg[3]);
	~partialBalanceFunc.(msg);
	~fell.(msg, i);
	~group[i].set(\mul, msg[3]);
	; msg.postln}, '/t3d/tch'++i.asSymbol, recvPort: 3123)
});


// Trigger impuls
OSCFunc({|msg|
	msg.postln;
	Synth(\t_sfplay, [\buf, ~buffers.choose])
},'/tr', s.addr);

~trigFunc.play(args: [voice: 0])
~kbus[0].set(1)
~kbus[0].get({arg val; val.postln})




////

~fmPlayer = {|msg, voice|
	var mul, detune, grade, note, ffreq, modFreq;
	note = msg[4]-24;
	mul = msg[3].lincurve(0, 1, 0, 0.1, -4);
	index = msg[3].lincurve(0, 1, 0.0234, 4, 6);
	ratio  = msg[2].lincurve(0, 1, 1, 5, 5);
	if (msg[3] == 0 and: ~snd[voice].notNil, {~snd[voice].release; ~snd[voice] = nil},
		{if (~snd[voice] == nil, {~snd[voice] = Synth(\fm2, [\note, note, \index, index, \ratio, ratio, \mul, mul], ~group)},
			{~snd[voice].set(\note, note, \index, index, \ratio, ratio, \mul, mul)})
	});
};









