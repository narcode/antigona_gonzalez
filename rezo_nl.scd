///// REZO PARA TU CUERPO
g = Group.new(s, 'addToHead');
Ndef(\rev, {GVerb.ar(In.ar(60,2), 119, 6)*1}).play(11,2).fadeTime_(4);

(
Ndef(\rzo, {
	((SinOsc.ar(["B1".namecps, "B1".namecps*2], 0, [1, 0.8])*0.1) + (BrownNoise.ar(LFNoise0.kr(7).range(0.01, 1))*1*LFNoise0.kr(1/3).range(0, 0.1)*EnvGen.kr(Env.perc(0.01, 3))) );
}).play(60, group: g);
);

Ndef(\rzo).fadeTime_(3);Ndef(\rzo2).fadeTime_(1);
Ndef(\rzo).stop(0.2);

(
Ndef(\rzo2, {
	((SinOsc.ar(["g#1".namecps, "g#1".namecps*2], 0, [1, 0.8])*0.1) + (BrownNoise.ar(LFNoise0.kr(7).range(0.01, 1))*1*LFNoise0.kr(1/3).range(0, 0.1)*EnvGen.kr(Env.perc(0.01, 3))) );
}).play(60, group: g);
);
Ndef(\rzo2).stop(3);

///// SAMPLES
Pdef(\rab, Pbind(\instrument, \act, \cut, Pseq([1100,900, 580, 880], inf), \buf, Prand([~buffers['rabinal'][17], ~buffers['rabinal'][17]], inf), \delta, Pseq([1/2], inf), \out, 6, \rate, 1.4, \rt, 3, \amp, Prand([2, 1, 0.2]+0.3, inf))).play(quant: Quant(8));

Pdef(\rab).stop;

Ndef(\rzoch, {GVerb.ar(PlayBuf.ar(2, ~buffers['rabinal'][17], 3)*0.5, 119, 68)}).play(6,1); /// 17,25,26, 27


/// backup
(
r = Routine{
	inf.do{
		s.bind{
			// audio
			~funcs.do{|f| f.(); };
		};
		4.wait; // must be dynamic
	}
}.play;
);