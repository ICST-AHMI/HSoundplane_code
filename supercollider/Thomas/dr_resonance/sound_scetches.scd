
SynthDef(\partial,  {
	arg out = 0, freq = 100, scale = 1.0, deviation = 10, parMul = 1, mul = 1, mulMod = 0, modFreq = 3, pan = 0, gate = 1;
	var snd, env, mod;
	env = EnvGen.kr(Env.asr(0.1, 1, 2, [-2, -4]), gate, doneAction: 2);
	mod = LFDNoise3.kr(modFreq) * deviation;
	snd = SinOsc.ar(freq * scale + mod, 0, (parMul.ampdb + mulMod).dbamp.clip(0, 1));
	Out.ar(out, Pan2.ar(snd, pan) * mul * env)
}, [nil, 0.1, 0.3, 0.1, 0.5, 0.5, 0.5]).add;


~drumResData = [
	[90, 0.097, 5], // freq, mul, freq-deviation
	[141, 0.06, 3],
	[190, 0.044, 5],
	[200, 0.04, 4],
	[251, 0.29, 4]
];

(
~drumResData = [
	[90, 0.097, 1], // freq, mul, freq-deviation
	[91, 0.097, 1],
	[93.456, 0.097, 1],
	[141, 0.06, 1],
	[142.6, 0.06, 1],
	[144.89745, 0.06, 1],
	[190, 0.044, 1],
	[192.345, 0.044, 1],
	[195.345, 0.044, 1],
	[200, 0.04, 1],
	[251, 0.029, 1],
	[301, 0.05, 1],
	[302.345, 0.05, 1],
	[304.98345, 0.05, 1],
	[360, 0.024, 1],
	[405, 0.01, 1],
	[455, 0.036, 1],
	[470, 0.036, 1],
	[473, 0.036, 1],
	[475.87, 0.006, 1],
	[503, 0.004, 1],
	[522, 0.002, 1],
	[578, 0.008, 1],
	[675, 0.0016, 1],
	[770, 0.005, 1],
	[785, 0.0003, 1],
	[863, 0.00033, 1],
	[926, 0.017, 1],
	[927.3, 0.017, 1],
	[1426, 0.017, 1],
	[1427.3, 0.017, 1],
];
)

(
~drumResData = [
	[110, 0.097, 1], // freq, mul, freq-deviation
	[111, 0.097, 1],
	[113.456, 0.097, 1],
	[926, 0.017, 1],
	[927.3, 0.017, 1],
	[925.3, 0.017, 1],
	[1426, 0.007, 1],
	[1427.3, 0.007, 1],
	[1425.3, 0.007, 1],
];
)

// collecting freq data:
// 3 close freqs, in 3 different ranges; like the example ~drumResData. For all presets different freqs
//
~lowFreqs = (~spots.size).collect({|i| a = rrand(90, 119); 3.collect({3.5.rand + a})});
~midFreqs = (~spots.size).collect({|i| a = rrand(870, 999); 3.collect({3.5.rand + a})});
~highFreqs = (~spots.size).collect({|i| a = rrand(1270, 1499); 3.collect({3.5.rand + a})});
~lowFreqs =  ((~spots.size).collect({|i| ~lowFreqs[i].do({|q, index| ~lowFreqs[i][index] = [q, 0, 1]})})!(~spots.size)).flat.clump(3);
(~spots.size).do({|i| a = 3.do({|q| ~lowFreqs[q + (i*((~spots.size)*3 + 3))][1] = 0.1})});
~midFreqs =  ((~spots.size).collect({|i| ~midFreqs[i].do({|q, index| ~midFreqs[i][index] = [q, 0, 1]})})!(~spots.size)).flat.clump(3);
(~spots.size).do({|i| a = 3.do({|q| ~midFreqs[q + (i*((~spots.size)*3 + 3))][1] = 0.1})});
~highFreqs =  ((~spots.size).collect({|i| ~highFreqs[i].do({|q, index| ~highFreqs[i][index] = [q, 0, 1]})})!(~spots.size)).flat.clump(3);
(~spots.size).do({|i| a = 3.do({|q| ~highFreqs[q + (i*((~spots.size)*3 + 3))][1] = 0.1})});

~freqs = ~lowFreqs++~midFreqs++~highFreqs;

~drumResData.do({|i| Synth(\partial, [\freq, i[0], \deviation, 0, \mul, i[1]])});