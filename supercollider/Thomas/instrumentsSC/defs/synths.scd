SynthDef(\limiter, {
	arg in = 0, out = 0, mul = 1, gate = 1;
	var input, snd, env;
	env = EnvGen.kr(Env.asr(0.1, 1, 0.1), gate, doneAction: 2);
	input = In.ar(in, 2);
	snd = Limiter.ar(input, 0.9, 0.01);
	XOut.ar(out, env,  snd * env * mul)
}, [nil, nil, 0.1]).add;

SynthDef(\fm2, {
	arg out, mul = 0.1, note = 48, index = 0.12345, ratio = 2.5, attack = 1, release = 5, rCurve = -3, bend = 0, lag = 1, gate = 1;
	var modulator, carrier, env, freq, snd, amp;
	freq = (note+bend).midicps;
	amp = AmpComp.kr(freq, 35);
	env = EnvGen.kr(Env.asr(attack, 1, release, curve: [-2, 0, rCurve]), gate, doneAction: 2);
	modulator = SinOsc.ar(freq * ratio, 0, (freq * ratio) * index);
	carrier = SinOsc.ar(freq + modulator, 0, 0.5) * env;
	snd = (7.do{carrier=AllpassL.ar(carrier, 0.2, {0.01.rand+0.01}!2, 5)} * 0.01) + carrier;
	Out.ar(out, snd * mul.lag2ud(0.001, lag) * env * amp);
}, [nil, nil, 0.1, 0.1, 0.1]).add;

SynthDef(\sawFB_2, {
	arg out = 0, note = 36, ffreq = 6500, filterGain = -6, gate = 1, attack = 0.001, bend = 0, fb = 0.99, delay = 0.01, mul = 0.1, lag = 1;
	var snd, env, filter, freq;
	freq = (note+bend).midicps;
	env = EnvGen.kr(Env.asr(attack, 1, 5, 'sine'), gate, doneAction:2);
	snd = SawFB.ar(freq, LFNoise1.kr(1.2!2).range(1, 12), fb, [delay, delay * Rand(0.001, 1.11)], 1, 2);
	filter = LPF.ar(snd, ffreq, filterGain)*0.3;
	Out.ar(out, filter * env * mul.lag2ud(0.001, lag));
}, [nil, 0.1, 5, 1, 0, 0, 10, 0.2, nil]).add;

SynthDef(\voscSynth, { // wavetable synth mit 12 tables
	arg out = 0, bufnum = 0, freq = 200, ffreq = 980, mul = 1, gate = 1, attack = 2, release = 1, table = 0, detune = 0.01, lag = 1;
	var snd, env;
	env = EnvGen.kr(Env.asr(attack, 1, release), gate, doneAction: 2);
	snd = BLowPass.ar(
		VOsc.ar(bufnum + table.clip(0, 11), [freq, freq+detune]),
		ffreq, 1, 1);
	snd = (7.do{snd=AllpassL.ar(snd, 0.2, {0.05.rand+0.01}!2, 5)} * 0.03) + snd;
	Out.ar(out, snd * env * mul.lag2ud(0.001, 1))
}, [nil, nil, 0.1, 0.5, 0.05]).add;


SynthDef(\del, {
	arg in = 0, out = 0, delay = 0.1, att = -6, lag = 0.1, gate = 1;
	var input, snd, env;
	env = EnvGen.kr(Env.asr(), gate, doneAction: 2);
	input = In.ar(in, 1);
	snd = DelayN.ar(input, 0.5, delay.lag(lag), att.dbamp);
	Out.ar(out, snd * env)
}).add;

SynthDef(\del2, {
	arg in = 0, out = 0, delay = 0.1, rate = 1, att = -6, lag = 0.1, gate = 1;
	var input, snd, env;
	delay = delay * rate.lag(lag);
	env = EnvGen.kr(Env.asr(), gate, doneAction: 2);
	input = In.ar(in, 1);
	snd = DelayN.ar(input, 0.5, delay.lag(lag), att.dbamp);
	Out.ar(out, snd * env)
}).add;

SynthDef(\fb_gate, {
	arg in = 0, out = 0, mul = 1, gate = 1;
	var input, snd, env, rms, factor;
	env = EnvGen.kr(Env.asr(), gate, doneAction: 2);
	input = InFeedback.ar(in, 1);
	rms = RunningSum.rms(input,4410);
	factor = exp(-20 * rms);
	input = BLowPass.ar(input, 2500);
	snd = LeakDC.ar(input)*factor.lag(0.1);
	Out.ar(out, snd * env * mul)
}).add;

SynthDef(\router, {
	arg in = 0, out = 0, mul = 1, gate = 1;
	var input, env;
	mul = mul.lag2ud(0.001, 0.7);
	env = EnvGen.kr(Env.asr(), gate, doneAction: 2);
	input = In.ar(in, 1);
	Out.ar(out, LeakDC.ar(input) * mul * env)
}).add;

SynthDef(\routerPan, {
	arg in = 0, out = 0, mul = 1, pan = 0, gate = 1;
	var input, env;
	mul = mul.lag2ud(0.001, 0.7);
	env = EnvGen.kr(Env.asr(), gate, doneAction: 2);
	input = In.ar(in, 1);
	Out.ar(out, Pan2.ar(LeakDC.ar(input) * mul * env, pan))
}).add;

SynthDef(\routerFB, {
	arg in = 0, out = 0, mul = 1, gate = 1;
	var input, env;
	mul = mul.lag2ud(0.001, 0.7);
	env = EnvGen.kr(Env.asr(), gate, doneAction: 2);
	input = InFeedback.ar(in, 1);
	Out.ar(out, LeakDC.ar(input) * mul * env)
}).add;

SynthDef(\routerFB2, {
	arg in = 0, out = 0, mul = 1, gate = 1;
	var input, env;
	mul = mul.lag2ud(0.001, 0.7);
	env = EnvGen.kr(Env.asr(), gate, doneAction: 2);
	input = InFeedback.ar(in, 1).tanh;
	Out.ar(out, LeakDC.ar(input) * mul * env)
}).add;

SynthDef(\router2, {
	arg in = 0, out = 0, mul = 1, gate = 1;
	var input, env;
	env = EnvGen.kr(Env.asr(), gate, doneAction: 2);
	input = In.ar(in, 2);
	Out.ar(out, LeakDC.ar(input) * mul.lag2(0.001, 3) * env)
}).add;


SynthDef(\tone2, {
	arg out = 0, note = 67, ffreq = 1800, modFreq = 1, ampMod = 0.1, numHarm = 2, attack = 0.1, fade = 0, pan = 0, gate = 1, transp = 0, fold = 0.87, mul = 1;
	var env, snd, gendy, blip, amp, freq;
	freq = (note+transp).midicps;
	amp = 1 - (LFNoise1.kr(modFreq*3.0934).range(0, 1) * ampMod);
	env = EnvGen.kr(Env.asr(attack, 1, 5), gate, doneAction: 2);
	gendy = Gendy1.ar(0, 0, 0, 0, freq, freq + (freq*0.001), 0.01, 0.3, 12, LFNoise1.kr(modFreq).range(5, 9), 0.3);
	blip = Blip.ar(freq, numHarm, LFNoise1.kr(1).range(0.9, 1)).fold2(fold)*0.4;
	snd = XFade2.ar(gendy, blip, fade, amp);
	snd = BLowPass4.ar(snd, ffreq.clip(35, 10000), 0.7);
	snd = Pan2.ar(snd, pan);
	Out.ar(out, snd * env * mul)
}, [nil, 0.1, 0.1, 0.1]).add;

SynthDef(\pulse, {
	arg out = 0, mul = 1, note = 38, ffreq = 150, gate = 1, transp = 0, attack = 0.1, numHarm = 7, dist = 0;
	var synth, filter, blip, env, amCoef;
	note = (note+transp);
	env = EnvGen.kr(Env.asr(attack), gate, doneAction: 2);
	synth = (Pulse.ar([note, note-12.1].midicps, LFNoise1.ar(0.345!2, 0.5, 0.49), LFNoise2.ar(0.345!2).range(1.8, 2.2)).distort) *0.7;
	blip = Blip.ar(note.midicps, numHarm, LFNoise1.kr(1).range(0.9, 1));
	filter = MoogFF.ar(synth+blip, ffreq.clip(35, 8000));
	amCoef= 2*dist/(1-dist);
	filter = MidEQ.ar(LPF.ar((1+amCoef)*filter/(1+(amCoef*filter.abs)), [3800, 3900])*0.5, 120, 0.7, 8);
	Out.ar(out, filter * mul * env);
}, [nil, 0.1, 0.1, 0.1]).add;

SynthDef(\gend2, {
	|out = 0, note = 56, amp = 0.5, mod = -1, attack = 0.2, ffreq = 800, gate = 1, bend = 0, lag = 0.02|
	var env, snd;
	note = Lag.kr(note, lag);
	env = EnvGen.kr(Env.asr(attack, curve: [0, -4]), gate, doneAction: 2);
	snd = Gendy1.ar(1,4.48,LFNoise1.kr(0.5!2).range(-0.01, 0.1) + mod, -0.7, note.midicps, note.midicps, 0.03, 0.1, 12);
	snd = Pan2.ar(MoogFF.ar(snd, ffreq), 0.3.rand2);
	Out.ar(out, snd * env * (amp**2))
}).add;

SynthDef(\gendGliss, {
	|out = 0, note = 56, amp = 0.5, mod = -1, attack = 0.2, ffreq = 800, gate = 1, bend = 0, time = 5|
	var env, snd;
	note = Line.kr(note, note+0.7.rand2, time);
	env = EnvGen.kr(Env.asr(attack, curve: [0, \sin]), gate, doneAction: 2);
	snd = Gendy1.ar(1,4.48,LFNoise1.kr(0.5!2).range(-0.01, 0.1) + mod, -0.7, note.midicps, note.midicps, 0.03, 0.1, 12);
	snd = Pan2.ar(MoogFF.ar(snd, ffreq), 0.3.rand2);
	Out.ar(out, snd * env * (amp**2))
}).add;






SynthDef(\fbSing, {
	arg in = 0, out = 0, fb = 0.11, mul = 1;
	var input, snd;
	input = In.ar(in, 2) * 0.7;
	snd = ({var x; CombC.ar(input, 0.2, LFNoise1.kr(0.24).range(x = Rand(0.001, 0.1), x+0.002), fb)}!12).sum;
	snd = BLowPass.ar(snd, 1800);
	Out.ar(out, LeakDC.ar(Limiter.ar(snd!2, 0.707) * mul));
}).add;



/*
~check = {
var arrayOld, arrayIn;
arrayIn = ~flags;
if (arrayIn != arrayOld and: arrayIn.sum > 1, {indexOf
*/









