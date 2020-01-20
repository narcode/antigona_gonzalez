///////
//////// La llorona

Ndef(\am, {GVerb.ar(SinOsc.ar(["a1".namecps, "a0".namecps])*EnvGen.kr(Env.perc(1, 1)), 78, 99)*0.2}).play(6,2);

Ndef(\am0, {GVerb.ar(SinOsc.ar(["g3".namecps, "g2".namecps])*EnvGen.kr(Env.perc(0.01, 0.7)), 78, 99)*0.03}).play(6,2); // 0.01


Ndef(\am3, {CombN.ar(SinOsc.ar(["g1".namecps, "g1".namecps])*EnvGen.kr(Env.perc(0.01, 1)), 0.2, 0.3, 20)*0.2}).play(6,2); // 0.1

Ndef(\am0).stop(0.2);

/// .. . . . .... .. .    .  ...  .    .   .  .. .  .  .
Synth(\sampleNarcode, [\buf, ~buffers['rabinal'][18], \rl, 9, \rate, 2, \pos, 0, \amp, 1, \out, 80]);
Ndef(\rev, {CombN.ar(In.ar(80,2), 0.2, 0.125, 9)*0.15}).play(6,2).fadeTime_(4);

Pdef(\rab, Pbind(\instrument, \act, \cut, Pseq([1100,900, 580, 880], inf), \buf, Prand([~buffers['rabinal'][17], ~buffers['rabinal'][25]], inf), \delta, Pseq([1], inf), \out, 9, \rate, 1.2, \rt, 9, \amp, Prand([2, 1, 0.2]+0.7, inf))).play(quant: Quant(8));

Pdef(\rab).stop;

///////// Aquí
t.tempo_(65/60);
~funcs = ();
~funcs['fer'] = { m.(a, nil, true, 1, 1, 1, 1).play };
a = { Synth(\sampleNarcode, [\buf, ~buffers['bd'], \rel, 1, \out, 8])};
r.play;

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