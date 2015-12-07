SynthDef(\partial,  {
	arg out = 0, freq = 100, scale = 1.0, deviation = 10, parMul = 1, mul = 1, mulMod = 0, modFreq = 3, pan = 0, gate = 1;
	var snd, env, mod;
	env = EnvGen.kr(Env.asr(0.1, 1, 2, [-2, -4]), gate, doneAction: 2);
	mod = LFDNoise3.kr(modFreq) * deviation;
	snd = SinOsc.ar(freq * scale + mod, 0, (parMul.ampdb + mulMod).dbamp.clip(0, 1));
	Out.ar(out, Pan2.ar(snd, pan) * mul * env)
}, [nil, 0.1, 0.3, 0.1, 0.5, 0.5, 0.5]).add;

SynthDef(\t_sfplay, {
	arg out = 0, buf, mul = 1, t_trig = 0;
	var snd = PlayBuf.ar(1, buf, 1, t_trig);
	Out.ar(out, snd!2 * mul)
}).add;


~fell = {|msg, voice |
	var amp;
	amp = msg[3];
	if (amp < 0.001, {~group[voice].release; ~snd[voice] = nil},
		{if (~snd[voice].isNil, {~snd[voice] = ~partialData.collect({|array|
			Synth(\partial, [\freq, array[0], \mul, amp, \parMul, array[1], \deviation, array[2]/4], ~group[voice])});
			})
	})
};

~partialBalanceFunc = {|msg, voice = 0, dim = #[100, 100]|
	var cx, cy, values, partialBalance;
	cx = msg[4]*dim[0];
	cy = msg[2]*dim[1];
	values = ~mtrx.size.collect({|spot| ~mtrx[spot][cx.trunc][cx.trunc]}); // auslesen der Gewichtung
	values.postln;
	partialBalance = (values * ~weigthArray).sum.clip(-33, 0); // Lautheit verhältnis partials
	if (~snd[voice].notNil, {
		~snd[voice].do({|synth, i| synth.set(\mulMod, partialBalance[i])})
	}, {});
};


10.do({|i|
	~trigFunc[i] = {|threshold = 0.01|
		var amp, onset;
		amp = ~kbus[i].kr;
		onset = HPZ1.kr(amp).abs > threshold; // onset detection
		onset = Trig1.kr(onset, 0.01); // lockout
		SendTrig.kr(onset, 0, 1)
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




