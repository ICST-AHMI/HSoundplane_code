
///// INSTRUMENT  /////////
(
s.waitForBoot({
	~dir = PathName(thisProcess.nowExecutingPath).pathOnly;
	"defs/*".loadRelative;

	s.sync;

	v = 10; // 10 voices
	~pitch = 45!v;
	~ampMod = 0.05!v;
	~fade = 0!v;
	~dur = 1!v;
	~dist = 0!v;
	~stream = nil!v;
	~inGroup = v.collect({Group.new});
	~outGroup = Group.tail;
	~bus = v.collect({Bus.audio(s, 2)});
	~outputs = v.collect({|i| Synth(\router2, [\in, ~bus[i], \out, 0, \mul, 0], ~outGroup)});


	~transp = [[0, 1, 4], [0, 2, 5], [0, 2, 5, 8], [0, 2, 5, 8], [0, 1, 4], [0, 2], [0, 2, 5, 8], [0, 2, 5, 8], [0, 1, 4], [0, 2], [0, 2, 5, 8], [0, 2, 5, 8]]/9.34587;


	~toneA = {
		arg voice = 0, out = 0, ovRand = 0;
		~stream[voice] = Pmono(
			\tone2,
			\out, out,
			\note, Pfunc({~pitch[voice]-12}),
			\transp, Pfunc({(~transp[voice].choose + ((ovRand.rand2) * 12) + 0.25.rand2)}),
			\ffreq, Pfunc({~pitch[voice] + (~pitch[voice]*0.5).rand}).midicps,
			\numHarm, Pwhite(2, 6),
			\ampMod, Pfunc({~ampMod[voice]}),
			\modFreq, Pwhite(0.5, 2.9),
			\fade, Pfunc({~fade[voice]}),
			\mul, Pwrand([0, -6, -18].dbamp, [1, 0.5, 0.1],inf) * Pfunc({(32 / (Pkey(\transp) + ~pitch[voice]).midicps)**0.45}),
			\dur, Pwhite(1.55, 6.0) * Pfunc({~dur[voice]}), // 0.55, 6.00
			\pan, Pwhite(-0.4, 0.4),
			\group, ~inGroup[voice],
		).play;
	};

	~toneB = {
		arg voice = 0, out = 0, ovRand = 0;
		var stream;
		Pmono(
			\pulse,
			\out, out,
			\note, Pfunc({~pitch[voice]-24}),
			\transp, Pfunc({(~transp[voice].choose + ((ovRand.rand2) * 12) + 0.25.rand2)}),
			\ffreq, Pfunc({~pitch[voice] + (~pitch[voice]*1.5).rand}).midicps,
			\numHarm, Pwhite(2, 6),
			// \mul, Pwrand([0, -6, -18].dbamp, [1, 0.5, 0.1],inf) * Pfunc({(32 / (Pkey(\transp) + ~pitch[voice]).midicps)**0.45}),
			\dur, Pwhite(1.55, 6.0) * Pfunc({~dur[voice]}), // 0.55, 6.00
			\group, ~inGroup[voice],
		).play;
	};

	~voiceSetting = { // für toneA + toneB patterns
		arg msg, voice = 0;
		~inGroup[voice].set(\note, msg[4]);
		~pitch[voice] = msg[4];
		~outputs[voice].set(\mul, msg[3].sqrt);
		~fade[voice] = msg[2].linlin(0, 1, -1, 1);
		~dur[voice] = msg[2].linlin(0, 1, 3, 0.5);
		~inGroup[voice].set(\dist, msg[2].lincurve(0, 1, 1.01, 0, 4));
	};

	s.sync;

	~patterns = v.collect({|i| 2.do{~toneA.(i, ~bus[i]); ~toneB.(i, ~bus[i])}}); //
	// ~patterns = v.collect({|i| 2.do{~toneB.(i, ~bus[i])}}); //

	//// OSC
	10.do({|i| OSCFunc( { | msg, time, addr, recvPort| ~voiceSetting.(msg, i); msg.postln}, '/t3d/tch'++i.asSymbol, recvPort: 3123)});


})
)




