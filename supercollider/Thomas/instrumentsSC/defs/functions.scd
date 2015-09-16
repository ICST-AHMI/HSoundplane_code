

~fmPlayer = {|msg, voice|
	var mul, index, ratio, note, ffreq;
	note = msg[4]-24;
	mul = msg[3].lincurve(0, 1, 0, 0.1, -4);
	index = msg[3].lincurve(0, 1, 0.0234, 4, 6);
	ratio  = msg[2].lincurve(0, 1, 1, 5, 5);
	if (msg[3] == 0 and: ~snd[voice].notNil, {~snd[voice].release; ~snd[voice] = nil},
		{if (~snd[voice] == nil, {~snd[voice] = Synth(\fm2, [\note, note, \index, index, \ratio, ratio, \mul, mul], ~group)},
			{~snd[voice].set(\note, note, \index, index, \ratio, ratio, \mul, mul)})
	});
};


~wvtPlayer = {|msg, voice|
	var mul, detune, table, note, ffreq;
	note = msg[4]-24;
	mul = msg[3].lincurve(0, 1, 0, 0.1, -4);
	ffreq = msg[3].linlin(0, 1, note, note+36).midicps;
	table = msg[2].linlin(0, 1, 0, 11);
	if (msg[3] == 0 and: ~snd[voice].notNil, {~snd[voice].release; ~snd[voice] = nil},
		{if (~snd[voice] == nil, {~snd[voice] = Synth(\voscSynth, [\bufnum, ~voscBufs[0].bufnum, \freq, note.midicps, \table, 0, \ffreq, ffreq, \mul, mul], ~group)},
			{~snd[voice].set(\freq, note.midicps, \ffreq, ffreq, \mul, mul, \table, table)})
	});
};

~sawfbPlayer = {|msg, voice|
	var mul, delay, note, ffreq, fb;
	note = msg[4]-24;
	mul = msg[3].lincurve(0, 1, 0, 0.1, -4);
	ffreq = msg[2].linlin(0, 1, note, note+36).midicps;
	delay = msg[2].lincurve(0, 1, 0.00001, 0.499, 3);
	fb = msg[2].lincurve(0, 1, 0.99, 0.999999999, 1);
	if (msg[3] == 0 and: ~snd[voice].notNil, {~snd[voice].release; ~snd[voice] = nil},
		{if (~snd[voice] == nil, {~snd[voice] = Synth(\sawFB_2, [\note, note, \ffreq, ffreq, \filterGain, -12, \fb, fb, \delay, delay, \mul, mul], ~group)},
			{~snd[voice].set(\note, note, \ffreq, ffreq, \mul, mul)})
	});
};


~node = {
	arg nodeNr = 0, del = #[[0.0025, 0.013, 0.401], [-6, -12, -6]];
	var fbBus;
	~busIn[nodeNr] = Bus.audio(s, 1);
	~fbBus[nodeNr] = Bus.audio(s, 1);
	del[0].do{|delay, i| ~delays.add(Synth(\del, [\in, ~busIn[nodeNr], \out, ~fbBus[nodeNr], \delay, delay, \att, del[1][i]], ~group[nodeNr][0]))};
	Synth(\fb_gate, [\in, ~fbBus[nodeNr], \out, ~busIn[nodeNr]], ~group[nodeNr][1]);
};

~node_ = {
	arg nodeNr = 0, del = #[[1.0025, 2.013, 3.401], [-6, -12, -6]];
	del[0].do{|delay, i| ~delays.add(Synth(\del2, [\in, ~busIn[nodeNr], \out, ~fbBus[nodeNr], \delay, ~freq[i].reciprocal, \rate, delay, \att, del[1][i]], ~group[nodeNr][0]))};
	Synth(\fb_gate, [\in, ~fbBus[nodeNr], \out, ~busIn[nodeNr]], ~group[nodeNr][1]);
};

~volumes = {|node = 0, coeff=0.6|
	var mul = 0, oldMul = 0, newMul;
	fork({
		loop{
			newMul = ~level[node];
			if (newMul == oldMul, {mul = (mul*coeff).trunc(0.00001)}, {mul = ~level[node]});
			~outputs[node].set(\mul, mul.sqrt.postln);
			// mul.postln;
			oldMul = newMul;
			0.02.wait;
		}
	})
};

~map = {|msg|
	var node, mul;
	node = ((n/2)*msg[1]).trunc + ((msg[2]*2).trunc * (n/2));
	~level[node] = msg[3];
};


~voice = { // mit network
	arg msg, voice = 0;
	msg.postln;
	~group[voice][0].set(\delay, (msg[4]-24).midicps.reciprocal);
	~outputs[voice].set(\mul, msg[3].sqrt);
	if (msg[3] > 0.0, {~flags[voice] = 1;
		~flags.do({|flag, i| if (i!= voice,
			{if (flag == 1, {if (~net[voice][i].isNil,
				{~net[voice][i] = Synth(\routerFB2, [\in, ~fbBus[voice], \out, ~fbBus[i], \mul, msg[3].sqrt], ~inGroup)}, {~net[voice][i].set(\mul, msg[3].sqrt/3)})},
				{~net[voice][i].release(1); ~net[voice][i] = nil})
			})
		})
	});
};

~voice2 = { // mit network
	arg msg, voice = 0;
	msg.postln;
	~group[voice][0].set(\delay, (msg[4]-24).midicps.reciprocal);
	~outputs[voice].set(\mul, msg[3].sqrt);
	~group[voice][0].set(\lag, msg[3].linlin(0, 1, 0.001, 1));
	// ~group[voice][0].set(\lag, msg[3].linlin(0, 1, 0.01, 1));
};


~network = {
	arg nodeIn, nodeOut;
	var reg;
	reg = nodeIn.asSymbol++nodeOut.asSymbol;
	if (~net[reg].isNil, {Synth(\routerFB, [\in, ~busIn[nodeIn], \out, ~busIn[nodeOut], \mul, 1], ~inGroup)});
};