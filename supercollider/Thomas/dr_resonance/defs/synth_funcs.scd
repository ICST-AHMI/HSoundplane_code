
SynthDef(\partial,  {
	arg out = 0, freq = 100, scale = 0, deviation = 10, parMul = 1, mul = 1, mulMod = 1, modFreq = 3, pan = 0, gate = 1;
	var snd, env, mod;
	env = EnvGen.kr(Env.asr(0.1, 1, 2, [-2, -4]), gate, doneAction: 2);
	mod = LFDNoise3.kr(modFreq) * deviation;
	snd = SinOsc.ar(freq + (scale*30) + mod, 0, (parMul * mulMod).clip(0, 1.0));
	Out.ar(out, Pan2.ar(snd, pan) * mul * env)
}, [nil, 0.1, 0.3, 0.1, 0.5, 3, 0.5]).add;

SynthDef(\partial2,  {
	arg out = 0, freq = 100, scale = 0, deviation = 10, sFaktor = 30, parMul = 1, mul = 1, mulMod = 1, modFreq = 3, pan = 0, gate = 1;
	var snd, env, mod, amp;
	amp = Lag2UD.kr(mul, 0.7, 2.3);
	env = EnvGen.kr(Env.asr(0.6, 1, 2, [-2, -4]), gate, doneAction: 2);
	mod = LFDNoise3.kr(modFreq) * deviation;
	snd = SinOsc.ar(freq + (scale*sFaktor) + mod, 0, (parMul).clip(0, 1.0));
	Out.ar(out, Pan2.ar(snd, pan) * amp * env)
}, [nil, 0.1, 0.3, 0.1, 0.5, 0.5, nil]).add;

SynthDef(\sfplayer3, {
	arg out = 0, buf1, buf2, buf3, mul = 0, pressure = 0, gate = 1;
	var snd, env;
	env = EnvGen.kr(Env.asr(0.1, 1, 2, [-2, -4]), gate, doneAction: 2);
	snd = SelectX.ar(pressure, [
		PlayBuf.ar(2, buf1, loop:1),
		PlayBuf.ar(2, buf2, loop:1),
		PlayBuf.ar(2, buf3, loop:1)]
	);
	Out.ar(out, snd * mul * env)
}, [nil, nil, nil, nil, 0.3]).add;

SynthDef(\t_sfplay, {
	arg out = 0, buf, mul = 1, t_trig = 0;
	var snd = PlayBuf.ar(1, buf, 1, t_trig);
	snd = GVerb.ar(snd);
	Out.ar(out, snd!2 * mul)
}).add;


~fell = {|msg, voice |
	var amp;
	amp = msg[3]**2;
	if (msg[3] < 0.001, {~group[voice].release(5); ~snd[voice] = nil},
		{if (~snd[voice].isNil, {~snd[voice] = ~partialData.collect({|array|
			Synth(\partial, [\freq, array[0], \mul, amp, \parMul, array[1], \deviation, array[2]/3], ~group[voice])});
			})
	})
};

~partialBalanceFunc = {|msg, voice = 0|
	var cx, cy, values, partialBalance;
	cx = msg[1];
	cy = msg[2];

	if (msg[3] > 0, {
		values = ~spots.collect({|array, index|
			var distance;
			distance = ((([cx, cy]-array).abs**2).sum).sqrt; // phytagoras
			(1-distance).clip(0.0, 1.0)**8;
		});
		// values.postln;
		partialBalance = (values * ~weigthArray).sum.clip(0, 100); // Lautheit verhältnis partials
		// partialBalance.postln;
		if (~snd[voice].notNil, {
			~snd[voice].do({|synth, index| synth.set(\mulMod, partialBalance[index])})
		}, {});
	});
};

~setPartialVol = {|msg, voice = 0|
	var cx, cy, values, partialBalance;
	cx = msg[1];
	cy = msg[2];

	if (msg[3] > 0, {
		values = ~spots.collect({|array, index|
			var distance;
			distance = ((([cx, cy]-array).abs**2).sum).sqrt; // phytagoras
			(1-distance).clip(0.0, 1.0)**12;
		});
		// values.postln;
		values.do({|mul, preset| ~setVol.(preset, mul, voice)}); // set volumes
	});
};

~setPartialVol2 = {|msg, voice = 0|
	var cx, cy, values, partialBalance;
	cx = msg[1];
	cy = msg[2];

	if (msg[3] > 0, {
		values = ~spots.collect({|array, index|
			var distance;
			distance = ((([cx, cy]-array).abs**2).sum).sqrt; // phytagoras
			(1-distance).clip(0.0, 1.0)**12;
		});
		values.do({|mul, preset| ~setVol2.(preset, mul, voice)}); // set volumes
	});
};

~coordx = 0!10;
~coordy = 0!10;

~moveSnd = {|msg, voice = 0, thresh = 0.001|
	var xDelta, yDelta, delta;
	xDelta = ~coordx[voice] - msg[1];
	yDelta = ~coordy[voice] - msg[2];
	~coordx[voice] = msg[1]; ~coordy[voice] = msg[2];
	delta = xDelta + yDelta;
	// [delta, msg[3]].postln;
	if (delta.abs > thresh, {
		~sfplayer[voice].set(\mul, msg[3]*0.1, \pressure, (delta-thresh).linlin(0, (1-thresh), 0, 2))},
		{~sfplayer[voice].set(\mul, 0)}
	);
};




10.do({|i|
	~trigFunc[i] = {|threshold = 0.01|
		var amp, onset;
		amp = ~kbus[i].kr;
		onset = HPZ1.kr(amp) > threshold; // onset detection
		onset = Trig1.kr(onset, 0.05); // lockout
		SendTrig.kr(onset, 0, amp)
	};
});

~snareResData = [
	[153, 0.12, 4],
	[235, 0.4, 2],
	[320, 0.024, 5],
	[404, 0.017, 4],
	[467, 0.11, 5],
	[578, 0.08, 5],
	[675, 0.016, 5],
	[770, 0.05, 15],
	[785, 0.03, 10],
	[863, 0.033, 10],
	[926, 0.017, 10],
	[1201, 0.015, 15],
	[1405, 0.01, 20],
];

~drumResData = [
	[90, 0.097, 5], // freq, mul, freq-deviation
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

~random1 = Array.fill(30, {[rrand(90, 2000), rrand(0.01, 0.15), rrand(2, 25)]});
~random2 = Array.fill(40, {[rrand(90, 4000), rrand(0.01, 0.15), rrand(2, 25)]});
~random3 = Array.fill(50, {[rrand(90, 5000), rrand(0.01, 0.15), rrand(2, 25)]});

~randFunc = {|num = 30| Array.fill(30, {[rrand(90, 2000), rrand(0.01, 0.15), rrand(2, 25)]})};

// collecting freq data:
// 3 close freqs, in 3 different ranges; like the example ~drumResData. For all presets different freqs
//
// set basic freqs
~lowFreqs = (~spots.size).collect({|i| a = rrand(90, 159); 3.collect({3.5.rand + a})});
~midFreqs = (~spots.size).collect({|i| a = rrand(760, 1299); 3.collect({3.5.rand + a})});
~highFreqs = (~spots.size).collect({|i| a = rrand(1870, 2999); 3.collect({3.5.rand + a})});
~freqs = (~lowFreqs++~midFreqs++~highFreqs).flat;

// set basic freqs2 (file: drum_resonance4)
~freqs2 = 3.collect({|f|(~spots.size).collect({|i| a = rrand(60, 299); 3.collect({|v| (a*(f+1)) + (v*0.52)})})}).flat;

// set basic freqs3 (file: drum_resonance5)
~freqs3 = 3.collect({|f|(~spots.size).collect({|i| a = rrand(60.0, 360.0)})}).flat;
~freqs3beatings = ~freqs3.collect({|freq, index| if (index > 0, {(~freqs3[index] - ~freqs3[index-1]).abs}, {5})});
// ~freqs3 = ~freqs3 ++ 3.collect({|f|(~spots.size).collect({|i| a = rrand(4860.0, 5820.0)})}).flat;



~setVol = {|preset = 0, mul = 0, voice = 0| // (file: drum_resonance4)
	3.do({|i| ~snd[voice][(preset*3)+i].set(\parMul, mul)}); // lowfreqs
	3.do({|i| ~snd[voice][(~spots.size*3)+(preset*3)+i].set(\parMul, mul/2)}); // midfreqs
	3.do({|i| ~snd[voice][(2*(~spots.size*3))+(preset*3)+i].set(\parMul, mul/4)}); // highfreqs
};

~setVol2 = {|preset = 0, mul = 0, voice = 0| // (file: drum_resonance5)
	3.do({|i| ~snd[voice][(preset*3)+i].set(\parMul, mul)}); // set speaker freqs
	3.do({|i| ~snd[voice][(~spots.size*3)+(preset*3)+i].set(\parMul, mul/20)}); // midfreqs
	3.do({|i| ~sndHS[voice][(preset*3)+i].set(\parMul, mul)}); // set hsoundplane freqs
};