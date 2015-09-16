
// Feedback Nodes   thomas peter - 15-05-11


(
"defs/*".loadRelative;

v = 10; // number of voices

~inGroup = Group.new;
~group = v.collect{2.collect{Group.after(~inGroup)}}; // groups innerhalb nodes
~outGroup = Group.tail;

~delays = List.new;
~busIn = nil!v;
~fbBus = nil!v;
v.do{|i| ~busIn[i] = Bus.audio()};
v.do{|i| ~fbBus[i] = Bus.audio()};
~outBus = Bus.audio(s, 2);
~level = Array.fill(v, {0.0});
~freq = 440!v;
~flags = 0!v;
~net = nil!v!v;

v.collect{|i| ~node_.(i, [[1, rrand(2, 4), rrand(10, 20), rrand(20, 50), rrand(50, 150)], [-3, -6, -6, -6, -6]])};
~outputs = v.collect{|i| Synth(\routerPan, [\in, ~busIn[i], \out, ~outBus, \pan, 0.4.rand2, \mul, 0], ~outGroup)};
~master = Synth(\router2, [\in, ~outBus, \out, 0, \mul, 0.7], ~outGroup, \addToTail);

v.do{|i| {PinkNoise.ar(0.1) * EnvGen.kr(Env.new([0, 1, 0], [0.01, 0.02], [-4, 4]), doneAction: 2)}.play(~inGroup, ~busIn[i])}; // init
v.do({|i| OSCFunc( { | msg, time, addr, recvPort| ~voice2.(msg, i)}, '/t3d/tch'++i.asSymbol, recvPort: 3123)}); // 10 voices
)

/*
~busIn.do(_.free); ~fbBus.do(_.free); ~group.do(_.free); ~outBus.free; // RESET
*/






