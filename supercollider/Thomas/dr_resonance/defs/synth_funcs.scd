SynthDef(\partial,  {
	arg out = 0, freq = 100, scale = 0, deviation = 10, parMul = 1, mul = 1, mulMod = 1, modFreq = 3, pan = 0, gate = 1;
	var snd, env, mod;
	env = EnvGen.kr(Env.asr(0.1, 1, 2, [-2, -4]), gate, doneAction: 2);
	mod = LFDNoise3.kr(modFreq) * deviation;
	snd = SinOsc.ar(freq + (scale*30) + mod, 0, (parMul * mulMod).clip(0, 1.0));
	Out.ar(out, Pan2.ar(snd, pan) * mul * env)
}, [nil, 0.1, 0.3, 0.1, 0.5, 3, 0.5]).add;

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
/*~randFunc = {|main = #[50, 160, 900, 1600, 1800, 2800]|
	var array;
	array = main.collect({|i| Array.fill(5, {7.0.rand}) + i}).flat;
	array.collect({|i| [i, rrand(0.01, 0.15), rrand(2, 25)]})
};*/

/*
~snareResData.do({|i| {SinOsc.ar(i[0], 0, i[1])}.play})
Synth(\partial, [\mul, 0.1, \freq, 1405, \parMul, 0.11, \mulMod, 12.1])
*/


