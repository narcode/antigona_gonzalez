//// los 7 cículos
t.tempo_(74/60);
r.play;
( // los 7 círculos // cresc.
b = { Synth(\sampleNarcode, [\buf, ~buffers['rabinal'][2], \rl, 1, \rate, 1, \pos, 0, \amp, 9, \out, 8])};
a = { Synth(\sampleNarcode, [\buf, ~buffers['rabinal'][4], \rl, 2, \amp, 5, \rate, 1, \pos, 0.rrand(0.5), \out, 10])};
c = { Synth(\sampleNarcode, [\buf, ~buffers['trio'][2], \rl, 1, \rate, 1, \pos, 0, \amp, 2, \out, 7])};
);
Ndef(\rzo2).stop(9);
~funcs = ();
~funcs['c'] = { m.(c, nil, true, 0, [1], 0, 1).play };
~funcs['a'] = { m.(b, nil, true, 1, 0, [2], 0).play };
~funcs['b'] = { m.(a, nil, true, 1, [0, 2], 1 ,[0, 1]).play };

// dev
~funcs['a'] = { m.(b, nil, true, 1, 0, [4], 0).play };
~funcs['b'] = { m.(a, nil, true, 1, [0, 8], 1 ,[0, 4]).play };
~funcs['c'] = { m.(c, nil, true, 0, [1], 0, 1).play };

// cool to end:
~funcs['a'] = { m.(b, nil, true, 1, 0, [8], 0).play };
~funcs['b'] = { m.(a, nil, true, [8], [0, 2], 1 ,[0, 1]).play };
~funcs['c'] = { m.(c, nil, true, 0, [1], 0, 1).play };

( // los 7 círculos end fadeout
b = { Synth(\sampleNarcode, [\buf, ~buffers['trio'][0], \rl, 1, \rate, 1, \pos, 0, \amp, ~ampf, \out, 8])};
a = { Synth(\sampleNarcode, [\buf, ~buffers['trio'][1], \rl, 0.2, \rate, 1, \amp, ~ampf, \pos, 0.rrand(0.5), \out, 10])};
c = { Synth(\sampleNarcode, [\buf, ~buffers['trio'][4], \rl, 1, \rate, 1, \pos, 0, \amp, ~ampf, \out, 7])};
);
~ampf = 0.01;
r.stop;
// estoy desapareciendo
t.tempo_(90/60);
g = Group.new(s, 'addToHead'); // test
Ndef(\rev, {GVerb.ar(In.ar(60,2), 119, 3)*0.3}).play(6,2).fadeTime_(4);
Ndef(\am1).fadeTime_(4);
Ndef(\am1, {GVerb.ar(SinOsc.ar(["d2".namecps, "d1".namecps])*EnvGen.kr(Env.perc(1, 1)), 78, 99)*0.1}).play(6,2);


// san fernando
t.tempo_(70/60);
a = { Synth(\sampleNarcode, [\buf, ~buffers['bd'], \rel, 1, \out, 8])};

/// backup
~vol = Volume(s, 0, 20);
~vol.gui;
~funcs['fer'] = { m.(a, nil, true, 1, 1, 1, 1).play };

Ndef(\rzo2).stop(3);
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