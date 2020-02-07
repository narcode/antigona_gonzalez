(
/// window
w = Window.new("Antígona G", Rect(850, 700, 300, 100)).alwaysOnTop_(true);
w.front;
~sec = StaticText(w, Rect(0, 0, 300, 100));
~sec.string_("Llorona").align_(\center).font_(Font.monospace(30));
~name = "Llorona";
~vol = Volume(s, 0, 2, -90, 8, true);
~vol.gui;
~vol.volume = 0;
~funcs = ();
/////
~electro = ();
~electro[\llorona] = ();
~electro[\llorona][0] = Ndef(\am, {GVerb.ar(SinOsc.ar(["a1".namecps, "a0".namecps])*EnvGen.kr(Env.perc(1, 1)), 78, 99)*0.2});
~electro[\llorona][1] = Ndef(\am0, {GVerb.ar(SinOsc.ar(["g3".namecps, "g2".namecps])*EnvGen.kr(Env.perc(0.01, 0.7)), 78, 99)*0.2});
~electro[\llorona][2] = Ndef(\am3, {CombN.ar(SinOsc.ar(["g1".namecps, "g1".namecps])*EnvGen.kr(Env.perc(0.01, 1)), 0.2, 0.3, 20)*0.3});


(
MIDIdef.cc(\ag, {|val, num, chan|
	 [val, num, chan].postln;
	// triggers 32+7, 48+7, 64+7
	// fader volumen para fade-out 7 circulos: num7, chan 0
	// num23 es vol general

	// secciones por fader:

	// llorona: 0,0 (default)
	if (num == 0) {
		~name = "Llorona";
		Ndef.all.do{|n| n.stop(2);};~funcs = ();
		Ndef(\rev, {CombN.ar(In.ar(80,2), 0.2, 0.125, 9)*0.15}).play(0,2).fadeTime_(4);
		{~sec.string_(~name)}.defer;
	};

		if (num == 1) {
		~name = "Aquí";
		t.tempo_(70/60);
		r.stop;
		Ndef.all.do{|n| n.stop(2);};~funcs = ();
		~funcs['fer'] = { m.(~bd, nil, true, 1, 1, 1, 1).play };
		~bd = { Synth(\sampleNarcode, [\buf, ~buffers['bd'], \rel, 1, \out, 0])};
		{~sec.string_(~name)}.defer;
	};

	if (num == 2) {
		~name = "Rezo";
		Ndef.all.do{|n| n.stop(2);};~funcs = ();
 	g = Group.new(s, 'addToHead');
		Ndef(\rev, {GVerb.ar(In.ar(60,2), 119, 6)*1}).play(0,2).fadeTime_(4);
		Ndef(\rzo).fadeTime_(3);Ndef(\rzo2).fadeTime_(1);
		{~sec.string_(~name)}.defer;
	};

	if (num == 3) {
		~name = "7 círculos";
		Ndef.all.do{|n| n.stop(2);};
		t.tempo_(74/60);
		r.stop;
(
							b = { Synth(\sampleNarcode, [\buf, ~buffers['rabinal'][2], \rl, 1, \rate, 1, \pos, 0, \amp, 5, \out, [0,1].choose])};
a = { Synth(\sampleNarcode, [\buf, ~buffers['rabinal'][4], \rl, 1, \amp, 5, \rate, 1, \pos, 0.rrand(0.5), \out, [0,1].choose])};
c = { Synth(\sampleNarcode, [\buf, ~buffers['trio'][2], \rl, 1, \rate, 1, \pos, 0, \amp, 3.5, \out, [0,1].choose])};
);
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
		{~sec.string_(~name)}.defer;
	};

	if (num == 4) {
		~name = "Estoy desapareciendo";
		Ndef.all.do{|n| n.stop(2);};
		~funcs = ();
		t.tempo_(86/60);
g = Group.new(s, 'addToHead');
Ndef(\rev, {GVerb.ar(In.ar(60,2), 119, 2)*1}).play(0,2).fadeTime_(4);
		(
h = {arg chord=nil, bass=nil, rel=2.5;
	if (chord.isNil.not && chord.isString.not) {
		Ndef(\h, {SinOsc.ar([chord, chord*LFNoise1.kr(1/8).range(1,2)], 0, [1, 1/30])*0.1*EnvGen.kr(Env.perc(1*t.tempo, 1*t.tempo), doneAction:2);}).play(60,2, g);};
	if (bass.isNil.not || chord.isString) {
		if (bass.isNil) {
			Ndef(\hb, {SinOsc.ar((chord).namecps, mul:0.8)*EnvGen.kr(Env.perc(0.1, rel*t.tempo), doneAction:2)}).play(0);
		} {
	Ndef(\hb, {SinOsc.ar((bass).namecps, mul:0.8)*EnvGen.kr(Env.perc(0.1, rel*t.tempo), doneAction:2)}).play(0);
		};
	};
};
);
		{~sec.string_(~name)}.defer;
	};

	if (num == 7) {
		{~vol.volume_(val.linlin(0, 127, -90, 8))}.defer;
	};

// buttons:
	8.do{|i|
		if (num==(32+i)) {
		 if (val > 1) {
			 switch(~name,

					"Llorona", {(~name ++ " but "++i.asString).postln;
						switch(i,
							0, {Ndef(\am, {GVerb.ar(SinOsc.ar(["a1".namecps, "a0".namecps])*EnvGen.kr(Env.perc(1, 1)), 78, 99)*0.2}).play(0,2);},
							1, {Ndef(\am0, {GVerb.ar(SinOsc.ar(["a3".namecps, "g2".namecps])*EnvGen.kr(Env.perc(0.01, 0.7)), 78, 99)*0.2}).play(0,2);},
							2, {Ndef(\am0, {GVerb.ar(SinOsc.ar(["f3".namecps, "d2".namecps])*EnvGen.kr(Env.perc(0.01, 0.7)), 78, 99)*0.2}).play(0,2);},
							3, {Ndef(\am0, {GVerb.ar(SinOsc.ar(["e3".namecps, "g2".namecps])*EnvGen.kr(Env.perc(0.01, 0.7)), 78, 99)*0.2}).play(0,2);},
							4, {Ndef(\am0, {GVerb.ar(SinOsc.ar(["c3".namecps, "a2".namecps])*EnvGen.kr(Env.perc(0.01, 0.7)), 78, 99)*0.2}).play(0,2);},
							5, {Ndef(\am0, {GVerb.ar(SinOsc.ar(["g3".namecps, "g2".namecps])*EnvGen.kr(Env.perc(0.01, 0.7)), 78, 99)*0.2}).play(0,2);},
							6, {Ndef(\am3, {GVerb.ar(SinOsc.ar(["g1".namecps, "g1".namecps])*EnvGen.kr(Env.perc(0.01, 0.7)), 78, 99)*0.2}).play(0,2);},
							7, {Synth(\sampleNarcode, [\buf, ~buffers['rabinal'][18], \rl, 9, \rate, 2, \pos, 0, \amp, 1, \out, 80]);}
						);
					},

					"Aquí", {(~name ++ " but "++i.asString).postln;
						switch(i,
							0, {r.stop;
										(
r = Routine{
	inf.do{
		s.bind{
			// audio
			~funcs.do{|f| f.(); };
		};
		4.wait;
	}
}.play;
);
							}
						);
					},

				"Rezo", {(~name ++ " but "++i.asString).postln;
						switch(i,
							0, {Ndef(\rzo, { ((SinOsc.ar(["f#1".namecps, "f#1".namecps*2], 0, [1, 0.8])*0.1) + (BrownNoise.ar(LFNoise0.kr(7).range(0.01, 1))*1*LFNoise0.kr(1/3).range(0, 0.1)*EnvGen.kr(Env.perc(0.01, 3))) );
							}).play(60, group: g); "f#".postln;},
							1, {Ndef(\rzo, { ((SinOsc.ar(["e1".namecps, "e1".namecps*2], 0, [1, 0.8])*0.1) + (BrownNoise.ar(LFNoise0.kr(7).range(0.01, 1))*1*LFNoise0.kr(1/3).range(0, 0.1)*EnvGen.kr(Env.perc(0.01, 3))) );
}).play(60, group: g); "e".postln;},
							2, {Ndef(\rzo, { ((SinOsc.ar(["a1".namecps, "a1".namecps*2], 0, [1, 0.8])*0.1) + (BrownNoise.ar(LFNoise0.kr(7).range(0.01, 1))*1*LFNoise0.kr(1/3).range(0, 0.1)*EnvGen.kr(Env.perc(0.01, 3))) );
}).play(60, group: g); "a".postln;},
							3, {Ndef(\rzo, { ((SinOsc.ar(["d1".namecps, "d1".namecps*2], 0, [1, 0.8])*0.1) + (BrownNoise.ar(LFNoise0.kr(7).range(0.01, 1))*1*LFNoise0.kr(1/3).range(0, 0.1)*EnvGen.kr(Env.perc(0.01, 3))) );
							}).play(60, group: g); "d".postln;},
							4 , {Ndef(\rzo).stop(0.2); "stop".postln;},
							5 , {Ndef(\rzo2, { ((SinOsc.ar(["f#1".namecps, "f#1".namecps*2], 0, [1, 0.8])*0.1) + (BrownNoise.ar(LFNoise0.kr(7).range(0.01, 1))*1*LFNoise0.kr(1/3).range(0, 0.1)*EnvGen.kr(Env.perc(0.01, 3))) );
							}).play(60, group: g); "f# nuevo".postln;},
							6 , {Ndef(\rzo2, { ((SinOsc.ar(["e1".namecps, "e1".namecps*2], 0, [1, 0.8])*0.1) + (BrownNoise.ar(LFNoise0.kr(7).range(0.01, 1))*1*LFNoise0.kr(1/3).range(0, 0.1)*EnvGen.kr(Env.perc(0.01, 3))) );
							}).play(60, group: g); "e nuevo".postln;},
							7 , {Ndef(\rzo2, { ((SinOsc.ar(["d1".namecps, "d1".namecps*2], 0, [1, 0.8])*0.1) + (BrownNoise.ar(LFNoise0.kr(7).range(0.01, 1))*1*LFNoise0.kr(1/3).range(0, 0.1)*EnvGen.kr(Env.perc(0.01, 3))) );
							}).play(60, group: g); "d nuevo".postln;},
						);
					},

				"7 círculos", {(~name ++ " but "++i.asString).postln;
						switch(i,
							0, {~funcs['c'] = { m.(c, nil, true, 0, [1], 0, 1).play };},
							1, {~funcs['a'] = { m.(a, nil, true, 1, 0, [2], 0).play };},
							2, {~funcs['b'] = { m.(b, nil, true, 1, [0, 2], 1 ,[0, 1]).play };},
							3, {var buf3 = ~buffers['rabinal'][0.rrand(35)];
								var rit1 = 0.rrand(4); var rit2 = 0.rrand(2);
								var rit3 = [0.rrand(2), 0.rrand(4)]; var rit4 = 0.rrand(8);
								a = { Synth(\sampleNarcode, [\buf, buf3, \rl, 1, \rate, 1, \pos, 0, \amp, 5, \out, [0,1].choose])};
								~funcs['a'] = { m.(a, nil, true, rit1, rit2, rit3, rit4).play };
							},
							4, {var buf4=~buffers['rabinal'][0.rrand(35)];
								var rit1 = 0.rrand(4); var rit2 = [0.rrand(2), 0.rrand(4)];
								var rit3 = 0.rrand(5); var rit4 = [0.rrand(2), 0.rrand(4)];
								b = { Synth(\sampleNarcode, [\buf, buf4, \rl, 1, \amp, 5, \rate, 1, \pos, 0.rrand(0.5), \out, [0,1].choose])};
								~funcs['b'] = { m.(b, nil, true, rit1, rit2, rit3,rit4).play };
							},
							5, {var buf5 = ~buffers['trio'][0.rrand(7)]; c = { Synth(\sampleNarcode, [\buf, buf5, \rl, 1, \rate, 1, \pos, 0, \amp, 5, \out, [0,1].choose])};
							},
							6, {c = { Synth(\sampleNarcode, [\buf, ~buffers['trio'][4], \rl, 1, \rate, 1, \pos, 0, \amp, 3.5, \out, [0,1].choose])};
								a = { Synth(\sampleNarcode, [\buf, ~buffers['trio'][1], \rl, 0.2, \rate, 1, \amp, 3.5, \pos, 0.rrand(0.5), \out, [0,1].choose])};
								~funcs['a'] = { m.(a, nil, true, 1, 0, [8], 0).play };},
							7, {b = { Synth(\sampleNarcode, [\buf, ~buffers['trio'][0], \rl, 1, \rate, 1, \pos, 0, \amp, 3.5, \out, [0,1].choose])};
								~funcs['b'] = { m.(b, nil, true, [8], [0, 2], 1 ,[0, 1]).play };}
						);
					},

					"Estoy desapareciendo", {(~name ++ " but "++i.asString).postln;
						switch(i,
							0, {Ndef(\am1, {GVerb.ar(SinOsc.ar(["d2".namecps, "d1".namecps])*EnvGen.kr(Env.perc(1, 1)), 78, 99)*0.1}).play(0,2);}
						);
					}
			);
		 };
		};
	}

});
);

);