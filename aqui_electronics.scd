// aqui
g = Group.new(s, 'addToHead');
Ndef(\rev, {GVerb.ar(In.ar(60,2), 119, 2)*0.4}).play(6,2).fadeTime_(4);

(
h = {arg chord=nil, bass=nil, rel=1;
	if (chord.isNil.not && chord.isString.not) {
		Ndef(\h, {SinOsc.ar([chord, chord*LFNoise1.kr(1/8).range(1,2)], 0, [1, 1/30])*0.1*EnvGen.kr(Env.perc(rel*t.tempo, rel*t.tempo), doneAction:2);}).play(60,2, g);};
	if (bass.isNil.not || chord.isString) {
		if (bass.isNil) {
			Ndef(\hb, {SinOsc.ar((chord).namecps, mul:0.8)*EnvGen.kr(Env.perc(0.1, rel*t.tempo), doneAction:2)}).play(11);
		} {
	Ndef(\hb, {SinOsc.ar((bass).namecps, mul:0.8)*EnvGen.kr(Env.perc(0.1, rel*t.tempo), doneAction:2)}).play(11);
		};
	};
};
);

(
d = {arg chord=nil, rep=3, rel=0.1, rit=0.5;
	if (chord.isNil.not && chord.isString.not) {
		{
		rep.do{|i|

				Ndef("d"++i.asSymbol, {SinOsc.ar([chord[i], chord[i]*LFNoise1.kr(1/8).range(1,2)], 0, [1, 1/10])*0.1*EnvGen.kr(Env.perc(0.1, rel*t.tempo), doneAction:2);}).play(60,2, g);

				(rit*t.tempo).wait;
		};
		}.fork;
};

};
);


(
~desA = ["a2".namecps,"d2".namecps, "d3".namecps,"f3".namecps];
~desG = ["g2".namecps,"c3".namecps, "e3".namecps,"g3".namecps];
~desC_ = [
	["e3".namecps, "e3".namecps, "c3".namecps],  ["f3".namecps,"d3".namecps, "d3".namecps],
	["g3".namecps, "c3".namecps, "e3".namecps],
	["g3".namecps,"c3".namecps, "e3".namecps]
];
~desC = ["c2".namecps,"c3".namecps, "e3".namecps,"g3".namecps];
~desB = ["b2".namecps,"g3".namecps, "e2".namecps,"g3".namecps];
~desF = ["a2".namecps,"f3".namecps, "f2".namecps,"f2".namecps];
~desNunca = [
	["a3".namecps, "f3".namecps, "f3".namecps],  ["a3".namecps,"f3".namecps, "g3".namecps],
	["a3".namecps, "f3".namecps, "a3".namecps],
	["a3".namecps,"f3".namecps, "f3".namecps]
];
~desLo = [
	["a3".namecps, "f3".namecps, "f3".namecps],  ["b3".namecps,"g3".namecps, "f3".namecps],
	["c3".namecps, "a3".namecps, "f3".namecps],
	["c3".namecps,"g3".namecps, "f3".namecps],
	["c3".namecps, "a3".namecps, "f3".namecps]
];
~desAqui = [
	["c3".namecps, "a3".namecps, "f3".namecps],  ["b3".namecps,"f3".namecps, "a3".namecps],
	["b3".namecps, "f3".namecps, "a3".namecps],
	["b3".namecps,"f3".namecps, "a3".namecps],
];
~desD = ["d3".namecps,"f3".namecps];
~desC2 = ["c3".namecps,"g3".namecps];
~desFin = ["c2".namecps, "c3".namecps,"f3".namecps];
);

Ndef(\am, {GVerb.ar(SinOsc.ar(["d1".namecps, "f0".namecps, "d0".namecps]*4)*EnvGen.kr(Env.perc(1, 0.1)), 78, 39)*0.02}).play(6,2); // chord (a-c-f)

d.(~desA, 4, 0.1, 0.4);
d.(~desA, 4, 0.1, 0.4);
d.(~desG, 4, 0.1, 0.4);
d.(~desA, 4, 0.1, 0.4);
d.(~desC_, 4, 0.1, 0.4); // . . .
d.(~desA, 4, 0.1, 0.4);
d.(~desB, 4, 0.1, 0.4);
d.(~desF, 4, 0.1, 0.4);
h.(~desC, nil, 2);
d.(~desNunca,4,0.1,0.4); // . . .
d.(~desLo, 5,0.1,0.35); // . . .
d.(~desAqui, 4, 0.1, 0.4); // . .
d.(~desD);
d.(~desC2);
h.(~desFin, nil, 2);