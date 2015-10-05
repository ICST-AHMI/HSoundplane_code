
// Saw feedback delayline
// nach dem max-video (http://www.youtube.com/watch?v=AJwO8AJTyB8&)


SawFB : UGen {

	*ar {
		arg freq = 100, gain = 5, fb = 0.98, delay = 0.20, mul = 1, numChannel = 1;
		var snd;
		snd = Saw.ar(freq, gain).clip2(1) + LocalIn.ar(numChannel);
		LocalOut.ar(DelayC.ar(snd, 0.5, delay.min(0.5)) * fb);
		^Limiter.ar(snd, 0.998) * mul;
	}
}


/*
{SawFB.ar(MouseY.kr(10, 500),LFNoise1.kr(1.2).range(1, 12), 0.99, MouseX.kr(0.001, 0.1))!2}.play

// funktioniert nicht...:
{SawFB.ar([45, 48],LFNoise1.kr(0.2).range(1, 5)!2, 0.98, LFNoise2.kr(0.1).range(0.001, 0.1)!2)}.play

// Ok:
{SawFB.ar(48,LFNoise1.kr(0.2).range(1, 5), 0.98, LFNoise0.kr(3.3).range(0.001, 0.01))!2}.play

{Splay.ar(SawFB.ar(XLine.kr(10, 380, 20),LFNoise1.kr(0.2).range(1, 5), 0.78, LFNoise0.kr(LFNoise1.kr(2).range(12, 25)).range(0.01, 0.012))!3)}.play
*/




