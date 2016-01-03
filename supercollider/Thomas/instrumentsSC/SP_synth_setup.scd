
o = Server.local.options;
// o.device_("Soundflower (2ch)");  // use a specific soundcard
o.sampleRate = 44100;

s.waitForBoot({

	var groups, bus, win, rButton, text, text2, menu;



	~snd = nil!10; // 10 Stimmen
	~dir = PathName(thisProcess.nowExecutingPath).pathOnly;
	"defs/*".loadRelative;
	~transp = [[0, 1, 4], [0, 2], [0, 2, 5, 8], [0, 2, 5, 8]];

	s.sync;

	~synthList = [
		[\wvtPlayer, ~wvtPlayer, \voscSynth],
		[\sawfbPlayer, ~sawfbPlayer, \sawFB_2],
		[\fmPlayer, ~fmPlayer, \fm2]
	];



	groups = [
		~group = Group.new, // synth group
		~fxGroup = Group.after(~group),
		~outBus = Group.after(~group),
	];


	s.sync;

	~voscBuffer = Buffer.readChannel(s, ~dir++"Samples/dman5", channels: 0);
	// ~voscBuffer = Buffer.readChannel(s, ~dir++"Samples/gendNoise2.aif", channels: 0);
	~voscBufs = Buffer.allocConsecutive(12, s, 512, 1); // Buffers f�r den Wavetable Oscillator
	~vwBufs = Buffer.allocConsecutive(12, s, 1024, 1); // Buffers f�r den waveshaper Oscillator

	s.sync;

	// set wavetables soundfiles
	12.do({|i|
		var rand = (~voscBuffer.numFrames - 512).rand;
		~voscBuffer.copyData(~voscBufs[i], srcStartAt: rand, numSamples: 512);
		~voscBufs[i].loadToFloatArray(action: {|array|
			array = array * Signal.welchWindow(512);
			~voscBufs[i].free;
			~voscBufs[i] = Buffer.sendCollection(s, array, 1).normalize});
	});

	// set wavetables - 12 harmonics
	12.do{|i| ~vwBufs[i].cheby(Array.fill(i+1, {rrand(-6.dbamp, 1)}))};
	s.sync;

	~master = Synth(\limiter, [\in, 0], ~outBus);


	///// GUI
	win = Window.new("Synth", Rect(50, 800, 700, 300));
	menu = PopUpMenu(win, Rect(30, 30, 240, 40)).font_(Font("Helvetica", 18, true));
	menu.items = ~synthList.collect{|i| i[0]};
	menu.action_({arg menu;
		~group.release(0.05);
		~snd = nil!10;
		~snd = 10.collect({|i|Synth(~synthList[menu.value][2].asSymbol, [\mul, 0], ~group)}); // evaluate Synths
		~synth = ~synthList[menu.value][1];
	});

	rButton = Button(win, Rect(30, 170, 80, 60)).action_({~group.release(1)});

	// text1 = StaticText(win, Rect(210, 140, 50, 20)).font_(Font("Helvetica", 18));
	text2 = StaticText(win, Rect(115, 150, 200, 150)).font_(Font("Helvetica", 12));

	text2.string = "release all notes";

	win.front;

	win.onClose({
		~group.release(0.1);
		~snd = nil!10;
	});



	//// OSC

	10.do({|i| OSCFunc( { | msg, time, addr, recvPort|
		var check;
		~synth.(msg, i);
		msg.postln;
		}, '/t3d/tch'++i.asSymbol, recvPort: 3190)
	});

	/*	10.do({|i| OSCFunc( { | msg, time, addr, recvPort|
	~synth.(msg, i); msg.postln})
	}, '/t3d/tch'++i.asSymbol, recvPort: 3124)});*/

	s.meter;
	s.makeGui;

})





