///////
//////// La llorona

Ndef(\amb, {GVerb.ar(SinOsc.ar(["a1".namecps, "a0".namecps])*EnvGen.kr(Env.perc(1, 1)), 78, 99)*0.01}).play(6,2); // bass

Ndef(\am, {GVerb.ar(SinOsc.ar(["a2".namecps, "c1".namecps, "e1".namecps]*4)*EnvGen.kr(Env.perc(1, 0.1)), 78, 99)*0.02}).play(6,2); // chord

Ndef(\am0, {GVerb.ar(SinOsc.ar(["a3".namecps, "g2".namecps])*EnvGen.kr(Env.perc(0.01, 0.7)), 78, 99)*0.04}).play(6,2);

Ndef(\am3, {CombN.ar(SinOsc.ar(["g1".namecps, "g1".namecps])*EnvGen.kr(Env.perc(1, 0.1)), 0.2, 0.35, 90)*0.2}).play(6,2).fadeTime_(2);

Ndef(\am3, {CombN.ar(SinOsc.ar(["g1".namecps, "g1".namecps])*EnvGen.kr(Env.perc(1, 0.08)), 0.4, 0.62, 90)*0.15}).play(6,2).quant_(0.5);

Ndef(\am0).stop(0.2);

/// .. . . . .... .. .    .  ...  .    .   .  .. .  .  .
Synth(\sampleNarcode, [\buf, ~buffers['rabinal'][0], \rl, 9, \rate, 1, \pos, 0.rrand(0.6), \amp, 1, \out, 80]); // 0, 1, 2, 26 (27 perc)
Ndef(\rev, {GVerb.ar(In.ar(80,2)*0.2, 50, 3)+(CombN.ar(In.ar(80,2), 0.2, 0.125, 9)*0.15)}).play(6,2).fadeTime_(4);

Pdef(\rab, Pbind(\instrument, \act, \cut, Pseq([1100,900, 580, 880], inf), \buf, Prand([~buffers['rabinal'][11], ~buffers['rabinal'][12]], inf), \delta, Pseq([2.5], inf), \out, 9, \rate, 1, \rt, 9, \pos, Pwhite(0, 0.8), \amp, Prand([2, 1, 0.2]+6, inf))).play(quant: Quant(8));

Pdef(\rab1, Pbind(\instrument, \act, \cut, Pseq([1100,900, 580, 880], inf), \buf, Prand([~buffers['rabinal'][14], ~buffers['rabinal'][15]], inf), \delta, Pseq([1], inf), \out, 9, \rate, 1.2, \rt, 2, \pos, Pwhite(0, 0.8), \amp, Prand([2, 1, 0.2]+6, inf))).play(quant: Quant(8));

Pdef(\rab2, Pbind(\instrument, \act, \cut, Pseq([1100,900, 580, 880], inf), \buf, Prand([~buffers['rabinal'][10], ~buffers['rabinal'][9]], inf), \delta, Pseq([1/2], inf), \out, 9, \rate, 1.2, \rt, 19, \pos, Pwhite(0, 0.8), \amp, Prand([2, 1, 0.2]+6, inf))).play(quant: Quant(8));

Pdef(\rab2).stop;

///////// Aquí
t.tempo_(70/60);
~funcs = ();
~funcs['fer'] = { m.(~bd, nil, true, 1, 1, 1, 1).play };
~funcs['fer1'] = { m.(~sn, nil, true, 0, 0, 0, [0, 0, 0]).play };
~funcs['fer2'] = { m.(~hh, nil, true, [1,1], [1,1], 0, [0,2]).play };
~bd = { Synth(\sampleNarcode, [\buf, ~buffers['bd'], \rel, 1, \out, 8])};
~hh = { Synth(\sampleNarcode, [\buf, ~buffers['hh'], \amp, 1, \rel, 1, \out, 8])};
~sn = { Synth(\sampleNarcode, [\buf, ~buffers['sn'], \amp, 0.1, \rel, 1, \out, 8])};
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