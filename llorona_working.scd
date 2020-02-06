///////

/// .O.ve. r. t. u.... r.. e.    .  ...  .    .   .  .. .  .
Synth(\sampleNarcode, [\buf, ~buffers['rabinal'][8], \rl, 9, \rate, 1, \pos, 0.rrand(0.3), \amp, 1, \out, 80]); // 0, 1, 2, 26 (27 perc)
Ndef(\rev, {GVerb.ar(In.ar(80,2)*0.2, 50, 3)+(CombN.ar(In.ar(80,2), 0.2, 0.125, 9)*0.15)}).play(6,2).fadeTime_(4);

Pdef(\rab, Pbind(\instrument, \act, \cut, Pseq([1100,900, 580, 880], inf), \buf, Prand([~buffers['rabinal'][11], ~buffers['rabinal'][8]], inf), \delta, Pseq([2], inf), \out, Prand([9, 80, 9], inf), \rate, 1, \rt, 0.1, \pos, Pwhite(0, 0.2), \amp, Prand([2, 1, 0.2]+7, inf))).play; // process rt -> 0.1 ~ 0.8

Pdef(\rab1, Pbind(\instrument, \act, \cut, Pseq([1100,900, 580, 880], inf), \buf, Prand([~buffers['rabinal'][18], ~buffers['rabinal'][15]], inf), \delta, Pseq([2], inf), \out, Prand([9, 80, 9, 9], inf), \rate, 1, \rt, 1, \pos, Pwhite(0, 0.2), \amp, Prand([0.2, 0.2, 0.2]+6, inf))).play; // 2 (18, 15)

Pdef(\rab2, Pbind(\instrument, \act, \cut, Pseq([1100,900, 580, 880], inf), \buf, Prand([~buffers['rabinal'][16], ~buffers['rabinal'][17]], inf), \delta, Pseq([1/2], inf), \out, Prand([9, 9, 9, 9], inf), \rate, 1, \rt, 2, \pos, Pwhite(0, 0.2), \amp, Prand([1, 1, 0.2]+6, inf))).play; // 3

Pdef(\rab3, Pbind(\instrument, \act, \cut, Pseq([1100,900, 580, 880], inf), \buf, Prand([~buffers['rabinal'][27], ~buffers['rabinal'][18]], inf), \delta, Pseq([1/3], inf), \out, Prand([9, 9, 9, 9], inf), \rate, Pwhite(1, 3), \rt, 0.9, \pos, Pwhite(0, 0.2), \amp, Prand([1, 1, 0.2]+6, inf))).play; // 4 (27, 18) (28, 18)

Pdef(\rab3).stop;

//////// La llorona
Ndef(\amb).fadeTime_(1);
Ndef(\amb, {GVerb.ar(SinOsc.ar(["a1".namecps, "a0".namecps])*EnvGen.kr(Env.perc(1, 1)), 78, 99)*0.015}).play(6,2); // bass

Ndef(\am, {GVerb.ar(SinOsc.ar(["f1".namecps, "c1".namecps, "e1".namecps]*4)*EnvGen.kr(Env.perc(1, 0.1)), 78, 99)*0.015}).play(6,2); // chord (a-c-f)

Ndef(\am0, {GVerb.ar(SinOsc.ar(["e3".namecps, "g2".namecps])*EnvGen.kr(Env.perc(0.01, 0.7)), 78, 99)*0.05}).play(6,2);

Ndef(\am3, {CombN.ar(SinOsc.ar(["g1".namecps, "g1".namecps])*EnvGen.kr(Env.perc(1, 0.1)), 0.2, 2, 85)*0.1}).play(6,2).fadeTime_(2);

Ndef(\am3, {CombN.ar(SinOsc.ar(["g1".namecps, "g1".namecps(34)])*EnvGen.kr(Env.perc(0.1, 0.08)), 0.4, 0.2, 10)*0.1}).play(6,2).quant_(0.5);

Ndef(\am3).stop(1);

/// C0nt4r:
Synth(\sampleNarcode, [\buf, ~buffers['rabinal'][27], \at, 2, \rl, 9, \rate, 0.4, \pos, 0.rrand(0.6), \amp, 2, \out, 80]); // (27 percm 4) /// rate: 0.3 ~
Ndef(\rev, {GVerb.ar(In.ar(80,2)*0.2, 50, 40)+(CombN.ar(In.ar(80,2), 0.2, 0.125, 9)*0.15)}).play(6,2).fadeTime_(4);

///////// Aquí
t.tempo_(70/60);
~funcs = ();
~funcs['fer'] = { m.(~bd, nil, true, 1, 1, 1, 1).play };
~funcs['fer1'] = { m.(~sn, nil, true, 0, [1, 2], 0, [2, 2]).play };
~funcs['fer2'] = { m.(~hh, nil, true, [2],1,1,1).play };
~bd = { Synth(\sampleNarcode, [\buf, ~buffers['bd'], \rel, 1, \out, 8])};
~hh = { Synth(\sampleNarcode, [\buf, ~buffers['hh'], \amp, 0.2, \rel, 1, \out, 10])};
~sn = { Synth(\sampleNarcode, [\buf, ~buffers['sn'], \amp, 0.1, \rel, 2, \out, 9])};
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


g = Group.new(s, 'addToHead');
Ndef(\rev, {GVerb.ar(In.ar(60,2), 119, 6)*1}).play(11,2).fadeTime_(4);

Ndef(\ferg, {GVerb.ar(SinOsc.ar(["g3".namecps, "g2".namecps])*EnvGen.kr(Env.perc(0.01, 0.7)), 78, 18)*0.1}).play(6,2); // 0.01
Ndef(\ferg).stop(1);

//// backup routine
t.tempo_(80/60);
~funcs = ();
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

r.stop;