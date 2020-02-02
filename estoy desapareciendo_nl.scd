/// estoy desapareciendo

//////
/////
/////

/// tempo
t.tempo_(86/60);

g = Group.new(s, 'addToHead');
Ndef(\rev, {GVerb.ar(In.ar(60,2), 119, 2)*1}).play(6,2).fadeTime_(4);

///

(
~dm9 = ["f3".namecps,"a3".namecps, "c4".namecps,"e4".namecps];
~dm7 = ["f3".namecps,"a3".namecps, "d3".namecps,"c4".namecps];
~d7 = ["f#3".namecps,"a3".namecps, "d4".namecps,"c4".namecps];
~gm = ["g3".namecps,"b3".namecps, "d4".namecps];
~gm7 = ["g3".namecps,"b3".namecps, "d4".namecps,"f3".namecps];
~g7 = ["d3".namecps,"f3".namecps, "B3".namecps];
~g3 = ["g3".namecps,"b3".namecps];
~am7 = ["e3".namecps,"g3".namecps, "a3".namecps,"c4".namecps];
~a7 = ["e3".namecps,"g3".namecps,"c#4".namecps];
~f = ["c3".namecps,"e3".namecps,"a3".namecps];
~c9 = ["g3".namecps,"b3".namecps, "d4".namecps, "c4".namecps];
~cMaj9 = ["g3".namecps,"B3".namecps, "d4".namecps, "c4".namecps];
~c7 = ["g3".namecps,"b3".namecps, "d4".namecps, "e3".namecps];
~em9 = ["g3".namecps,"e3".namecps, "f#3".namecps, "d4".namecps];
~e9 = ["e3".namecps,"f#3".namecps, "g#3".namecps, "d4".namecps];
~bm7 = ["d3".namecps,"f#3".namecps, "a3".namecps, "B3".namecps];
~a4 = ["d3".namecps,"e3".namecps, "a3".namecps, "B3".namecps];
~a9 = ["e3".namecps,"g3".namecps, "B3".namecps,"c#4".namecps];
~fer = ["g2".namecps,"g3".namecps, "d3".namecps,"b3".namecps];

~desA = ["a1".namecps,"d3".namecps, "d3".namecps,"f3".namecps];
~desG = ["g1".namecps,"c3".namecps, "e3".namecps,"g3".namecps];
~desC = ["c1".namecps,"c3".namecps, "e3".namecps,"g3".namecps];
~desB = ["b1".namecps,"e3".namecps, "e3".namecps,"g3".namecps];
~desF = ["a1".namecps,"f3".namecps, "e3".namecps,"f3".namecps];
~desNunca = ["a1".namecps,"f3".namecps, "e3".namecps,"f3".namecps];
~desLo = ["f1".namecps,"f3".namecps, "a3".namecps,"c3".namecps];
~desAqui = ["f1".namecps,"f3".namecps, "a3".namecps,"b3".namecps];
~desD = ["d3".namecps,"f3".namecps];
~desC2 = ["c3".namecps,"g3".namecps];
~desFin = ["c3".namecps,"f3".namecps];
);
// play:
(
h = {arg chord=nil, bass=nil, rel=2.5;
	if (chord.isNil.not && chord.isString.not) {
		Ndef(\h, {SinOsc.ar([chord, chord*LFNoise1.kr(1/8).range(1,2)], 0, [1, 1/30])*0.1*EnvGen.kr(Env.perc(1*t.tempo, 1*t.tempo), doneAction:2);}).play(60,2, g);};
	if (bass.isNil.not || chord.isString) {
		if (bass.isNil) {
			Ndef(\hb, {SinOsc.ar((chord).namecps, mul:0.8)*EnvGen.kr(Env.perc(0.1, rel*t.tempo), doneAction:2)}).play(11);
		} {
	Ndef(\hb, {SinOsc.ar((bass).namecps, mul:0.8)*EnvGen.kr(Env.perc(0.1, rel*t.tempo), doneAction:2)}).play(11);
		};
	};
};
);

Ndef(\am1, {GVerb.ar(SinOsc.ar(["d2".namecps, "d1".namecps])*EnvGen.kr(Env.perc(1, 1)), 78, 99)*0.1}).play(6,2);

// manual
h.(~dm9, "d1");
h.("d1");
h.(~dm9);
h.("d1");
h.(~gm, "g1");//es-toy
h.("g1");
h.(~gm7);
h.(~am7, "a1");//9
h.(~dm9, "d1");
h.("d1");
h.(~dm9);
h.(~c9, "c1");
h.(~c7, "c2");
h.("b1");
h.(~a7, "a1");
h.(~a7, "a1");
h.(~dm9, "d1");//17
h.("d1");
h.(~dm9);
h.("d1");
h.(~gm, "g1");
h.("g1");
h.(~gm7, "g1");
h.(~am7, "a1");
h.(~dm9, "d1");//25
h.("d1");
h.(~dm9);
h.(~c9, "c1");
h.(~c7, "c2");
h.("b1");
h.(~a7, "a1");
h.(~g7, "g1");
h.(~f, "f1");//33
h.(~dm7, "a1");
h.(~gm7, "g1");
h.(~gm7, "g1");
h.(~dm7, "a1");
h.(~em9, "g1");
h.(~dm7, "a1");
h.(~am7, "a1"); // 40
h.(~dm7, "a1");
h.(~em9, "g1");
h.(~dm7, "a1");
h.(~am7, "a1");
h.(~dm7, "a1");
h.(~em9, "g1");//46
h.(~bm7, "a1");
h.(~em9, "B1"); //bm7
h.(~a4, "a1");
h.(~f, "f1"); // todos
h.(~dm7, "a1");
h.(~gm7, "g1");
h.(~dm7, "a1");//53
h.(~em9, "g1");
h.("g1");
h.(~a9, "a1");
h.(~dm9, "d1"); // 58 (nos..)
h.("d1");
h.(~dm9, "d1");
h.("d1");
h.(~gm, "g1");// 61
h.("a1");
h.("g1");
h.(~am7, "a1");
h.(~dm9, "d1");
h.("d1");
h.(~dm9);
h.("d1");
h.(~am7, "c2");
h.("b1");
h.("a1");//71
h.("g1");
h.(~gm, "g1");
h.(~am7, "a1");
h.(~dm7, "a1");
h.(~dm7, "a1");
h.(~cMaj9, "c2");
h.("d1");
h.(~d7, "a1");
h.(~g3, "g1", 8);


///// REZO PARA TU CUERPO
SynthDef(\rezo_bass, {arg gate=1, out=60, amp=1, freq=100;
	var snd1 = SinOsc.ar([freq, freq*2], 0, [1, 0.8])*0.1;
	var snd2 = BrownNoise.ar(LFNoise0.kr(7).range(0.01, 1))*1*LFNoise0.kr(1/3).range(0, 0.1)*EnvGen.kr(Env.perc(0.01, 3));
	var env = EnvGen.kr(Env.adsr(4*t.tempo, 0.3, 0.9, 1*t.tempo), gate, doneAction:2);
	Out.ar(out, amp*(snd1+snd2)*env);
}).store;

(
z = {arg bass=nil;
	~rezo_gate=1;
	if (~rezob.isNil.not) {
	~rezob.get(\gate, {|a| ~rezo_gate = a});
	};
	if (bass.isNil.not) {
(
			// Ndef(\rezo_bass).fadeTime=0.2;
			if (~rezob.isPlaying.not && (~rezo_gate > 0)) {
			~rezob = Synth(\rezo_bass, [\freq, bass.namecps]).register;
			} {
				~rezob.set(\gate, 0);
			}
);
};
};
);


g = Group.new(s, 'addToHead');
Ndef(\rev, {GVerb.ar(In.ar(60,2), 119, 6)*1}).play(11,2).fadeTime_(4);

//
// b.("f#1");
// b.("e2");
// b.("a1");
// b.("d2");

(
Ndef(\rzo, {
	((SinOsc.ar(["a1".namecps, "a1".namecps*2], 0, [1, 0.8])*0.1) + (BrownNoise.ar(LFNoise0.kr(7).range(0.01, 1))*1*LFNoise0.kr(1/3).range(0, 0.1)*EnvGen.kr(Env.perc(0.01, 3))) );
}).play(60, group: g);
);

Ndef(\rzo).fadeTime_(3);Ndef(\rzo2).fadeTime_(1);
Ndef(\rzo).stop(0.2);

(
Ndef(\rzo2, {
	((SinOsc.ar(["f#1".namecps, "f#1".namecps*2], 0, [1, 0.8])*0.1) + (BrownNoise.ar(LFNoise0.kr(7).range(0.01, 1))*1*LFNoise0.kr(1/3).range(0, 0.1)*EnvGen.kr(Env.perc(0.01, 3))) );
}).play(60, group: g);
);
Ndef(\rzo2).stop(3);

///// SAMPLES
Pdef(\rab, Pbind(\instrument, \act, \cut, Pseq([1100,900, 580, 880], inf), \buf, Prand([~buffers['rabinal'][17], ~buffers['rabinal'][25]], inf), \delta, Pseq([1/2], inf), \out, 6, \rate, 1.2, \rt, 3, \amp, Prand([2, 1, 0.2]+0.3, inf))).play(quant: Quant(8));

Pdef(\rab1, Pbind(\instrument, \act, \cut, 10000, \buf, Prand([~buffers['rabinal'][26], ~buffers['rabinal'][17]], inf), \delta, Pseq([2], inf), \out, 6, \rate, 1, \rt, 9, \amp, Prand([2, 1, 0.2]+2, inf))).play(quant: Quant(8));

Pdef(\rab).stop;

Ndef(\rzoch, {GVerb.ar(PlayBuf.ar(2, ~buffers['rabinal'][17], 2.0)*0.7, 119, 18)}).play(6,1); /// 17,25,26, 27

Ndef(\rzoch, {GVerb.ar(PlayBuf.ar(1, ~buffers['rabinal'][26], 1.0, 0, 1, 1)*0.2, 19, 0.2)}).play(6,1); /// 17,25,26, 27
Ndef(\rzoch, {GVerb.ar(PlayBuf.ar(1, ~buffers['rabinal'][26], 1.0, 0, 0, 1)*0.2, 19, 0.2)}).play(6,1); /// 17,25,26, 27

Ndef(\h, {SinOsc.ar([~g, ~g*LFNoise1.kr(1/8).range(1,2)], 0, [1, 1/8])*0.1*EnvGen.kr(Env.perc(3, 3), doneAction:2);}).play(6,2);

Ndef(\h, {SinOsc.ar([~g7, ~g7*LFNoise1.kr(1/8).range(1,2)], 0, [1, 1/8])*0.1*EnvGen.kr(Env.perc(3, 3), doneAction:2);}).play(6,2);

Ndef(\h, {SinOsc.ar([~a7, ~a7*LFNoise1.kr(1/8).range(1,2)], 0, [1, 1/8])*0.1*EnvGen.kr(Env.perc(3, 3), doneAction:2);}).play(6,2);

( // estoy desapareciendo
b = { Ndef(\h, {SinOsc.ar([~f7, ~f7*LFNoise1.kr(1/8).range(1,2)], 0, [1, 1/8])*0.1*EnvGen.kr(Env.perc(1, 1), doneAction:2);}).play(6,2); };
h = { Ndef(\h, {SinOsc.ar([~g, ~g*LFNoise1.kr(1/8).range(1,2)], 0, [1, 1/8])*0.1*EnvGen.kr(Env.perc(1, 1), doneAction:2);}).play(6,2); };
d = { Ndef(\h, {SinOsc.ar([~g7, ~g7*LFNoise1.kr(1/8).range(1,2)], 0, [1, 1/8])*0.1*EnvGen.kr(Env.perc(1, 1), doneAction:2);}).play(6,2); };
)


(
m = {arg item, itemarg, debug, one=0, two=0, three=0, four=0;
	Routine{
		if (debug) {[one,two,three,four].asString.postln;};

		[one, two, three, four].do{arg beat, index;
			if (beat.isArray.not) { // single:
				if (beat > 0) {
					if (debug) {(index.asString ++ " = " ++ beat.asString).postln;};
					(beat.reciprocal.clip(1, ~maxsubdiv)).do{
						item.(itemarg);
						(beat.clip(~maxsubdiv.reciprocal, 1)).wait;
					};
				} {1.wait};
			} { // array:
				{
					beat.do{arg sub;
						if (sub > 0) {
							if (debug) {(beat.asString ++ " = " ++ beat.asString ++ sub.asString).postln;};
							((sub).clip(1, ~maxsubdiv)).do{
								item.(itemarg);
								if (sub == 1) {
									(sub/beat.size).wait;
								} {(beat.size.reciprocal/sub).wait;}
						}} {(beat.size.reciprocal).wait;}
					};

						(beat.size.reciprocal).wait;

				}.fork;
				1.wait;
			};
		};
};
});


~maxsubdiv = 12;
~minsubdiv = 12 // TODO: implement this one
~funcs = ();
~funcs['a'] = { m.(b, nil, true, 2, 0).play };
~funcs['b'] = { m.(h, nil, true, 0).play };
~funcs['c'] = { m.(d, nil, true, 0).play };

(
r = Routine{
	inf.do{
		s.bind{
			// audio
			~funcs.do{|f| f.(); };
		};
		3.wait; // must be dynamic
	}
}.play;
);

r.stop;
s.latency=0.2;
s.meter;
