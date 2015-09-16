ServerOptions.devices
SerialPort.devices

(
{
	o = Server.local.options;
	o.device = "MADIface USB (23602333)";
	o.numOutputBusChannels = 32;

	s.bootSync;




	SynthDef(\piezoSine, { |out=0, amp=0, freq=0|
		Out.ar(out, SinOsc.ar(freq)*amp)
	}).add;

	SynthDef(\simple, { |out=0, amp=0, freq=0, timbre=0|
		Out.ar(out, Blip.ar(freq.lag(0.02),timbre+1)*amp.lag(0.1))
	}).add;

	s.sync;



	~port = SerialPort("/dev/tty.usbmodem1d11411", baudrate: 230400, crtscts:true);
	~piezoCoord = Array.fill(20, 0);
	~piezoSound = Array.fill(10, nil);

	~realSound = Array.fill(10, nil);

	s.sync;




	10.do{|i|
		~piezoSound[i] = Synth(\piezoSine);
		~realSound[i] = Synth(\simple);
		OSCdef('soundplane'++i.asSymbol,
			{ |msg|
				var x = (msg[1]*30).round.clip(1,30);
				var y = (msg[2]*5).floor.clip(0,4);
				var amp = msg[3]*0.1;
				~piezoSound[i].set(\out,x,\amp,amp,\freq,100);
				~piezoCoord[i*2] = x-1;
				~piezoCoord[i*2+1] = 4-y;
				~port.putAll(Int8Array[253,10]++~piezoCoord++[255]);

				~realSound[i].set(\amp,amp,\freq, msg[4].midicps,\timbre, 50**msg[2]);

			},
			'/t3d/tch'++i.asSymbol,
			recvPort: 3123)
	}
}.fork
)