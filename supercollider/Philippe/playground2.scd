ServerOptions.devices
SerialPort.devices

(
{
	o = Server.local.options;
	o.device = "MADIface USB (23602333)";
	o.numOutputBusChannels = 32;

	s.bootSync;




	SynthDef(\piezoPerc, { |out=0, amp=0, freq=0|
		var gate = Schmidt.kr(amp, 0.05, 0.2);
		var env = EnvGen.ar(Env.perc(0.001,0.01,1,-4),gate);
		Out.ar(out, SinOsc.ar(freq)*env)
	}).add;

	SynthDef(\bing, { |out=0, amp=0, freq=0|
		var gate = Schmidt.kr(amp, 0.05, 0.2);
		var env = EnvGen.ar(Env.adsr(0.001,0.1,0.02,0.001,0.8,-8), gate);
		var sig = Blip.ar(freq.lag(0.02),100)*amp.lag(0.1)*env;
		Out.ar(0,sig);
		Out.ar(31,sig);
	}).add;

	s.sync;



	~port = SerialPort("/dev/tty.usbmodem1d11411", baudrate: 230400, crtscts:true);
	~piezoCoord = Array.fill(20, 0);
	~piezoSound = Array.fill(10, nil);

	~realSound = Array.fill(10, nil);

	s.sync;




	10.do{|i|
		~piezoSound[i] = Synth(\piezoPerc);
		~realSound[i] = Synth(\bing);
		OSCdef('soundplane'++i.asSymbol,
			{ |msg|
				var x = (msg[1]*30).round.clip(1,30);
				var y = (msg[2]*5).floor.clip(0,4);
				var amp = msg[3];
				msg[4].postln;
				~piezoSound[i].set(\out,x,\amp,amp,\freq,~piezofreq);
				~piezoCoord[i*2] = x-1;
				~piezoCoord[i*2+1] = 4-y;
				~port.putAll(Int8Array[253,10]++~piezoCoord++[255]);

				~realSound[i].set(\amp,amp,\freq, (msg[4]-12).midicps);

			},
			'/t3d/tch'++i.asSymbol,
			recvPort: 3123)
	}
}.fork
)

~realSound[0].set(\amp,0.6,\freq,400);
~piezoSound[0].set(\out,1,\amp,0.1,\freq,100);


~piezofreq = 100;

(
OSCdef.freeAll;
SerialPort.closeAll;
)