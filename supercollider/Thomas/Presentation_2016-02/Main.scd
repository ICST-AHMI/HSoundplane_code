
var menu, mainWin, oscToMax;

o = Server.local.options;
// o.device_("Soundflower (2ch)");  // use a specific soundcard
o.sampleRate = 44100;
// o.blockSize = 16;

oscToMax = NetAddr.new("127.0.0.1", 7771);    // create the NetAddr
oscToMax.sendMsg("/hello", "there");    // send the application the message "hello" with the parameter "there"

~mdir = PathName(thisProcess.nowExecutingPath).pathOnly;

mainWin = Window.new("CHOOSE INSTRUMENT", Rect(100, 800, 300, 100));
menu = PopUpMenu(mainWin, Rect(20, 20, 250, 30)).font_(Font("Helvetica", 18, true));
menu.items_(["Synthesizers", "Resonance"]);
menu.action_({arg m;
	case
	{m.value == 0} {~win.close;
		~oscFunc.do(_.clear);
		oscToMax.sendMsg("/ampFB", 0.7); //
		oscToMax.sendMsg("/routeFB", 0);
		oscToMax.sendMsg("/mainVol", 0);
		(~mdir ++ "SP_synth_setup.scd").load
	}
	{m.value == 1} {~win.close;
		~oscFunc.do(_.clear);
		oscToMax.sendMsg("/ampFB", 32);
		oscToMax.sendMsg("/routeFB", 3);
		oscToMax.sendMsg("/mainVol", -12);
		(~mdir ++ "drum_resonance6.scd").load
	}
});

mainWin.front;

(~mdir ++ "SP_synth_setup.scd").load;

s.meter;
s.makeGui;




