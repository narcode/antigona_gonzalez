(
/// window
w = Window.new("Antígona G", Rect(850, 700, 300, 100)).alwaysOnTop_(true);
w.front;
~sec = StaticText(w, Rect(0, 0, 300, 100));
~sec.string_("Llorona").align_(\center).font_(Font.monospace(30));
~name = "Llorona";
/////
~electro = ();
~electro[\llorona] = ();
~electro[\llorona][0] = Ndef(\am, {GVerb.ar(SinOsc.ar(["a1".namecps, "a0".namecps])*EnvGen.kr(Env.perc(1, 1)), 78, 99)*0.2});
~electro[\llorona][1] = Ndef(\am0, {GVerb.ar(SinOsc.ar(["g3".namecps, "g2".namecps])*EnvGen.kr(Env.perc(0.01, 0.7)), 78, 99)*0.2});
~electro[\llorona][2] = Ndef(\am3, {CombN.ar(SinOsc.ar(["g1".namecps, "g1".namecps])*EnvGen.kr(Env.perc(0.01, 1)), 0.2, 0.3, 20)*0.3});



(
MIDIdef.cc(\ag, {|val, num, chan|
	// [val, num, chan].postln;
	// triggers 32+7, 48+7, 64+7
	// fader volumen para fade-out 7 circulos: num7, chan 0
	// num23 es vol general

	// secciones por fader:

	// llorona: 0,0 (default)
	if (num == 1) {
		~name = "Llorona";
		{~sec.string_(~name)}.defer;
	};

	if (num == 2) {
		~name = "Rezo";
		{~sec.string_(~name)}.defer;
	};

	if (num == 3) {
		~name = "7 círculos";
		{~sec.string_(~name)}.defer;
	};

	if (num == 4) {
		~name = "Estoy desapareciendo";
		{~sec.string_(~name)}.defer;
	};

// buttons:
	8.do{|i|
		if (num==(10+i)) {
		 if (val > 1) {
			 switch(~name,
					"Llorona", {(~name ++ " but "++i.asString).postln;
					Ndef(\rev, {CombN.ar(In.ar(80,2), 0.2, 0.125, 9)*0.15}).play(0,2).fadeTime_(4);
						switch(i,
							0, {Ndef(\am, {GVerb.ar(SinOsc.ar(["a1".namecps, "a0".namecps])*EnvGen.kr(Env.perc(1, 1)), 78, 99)*0.2}).play(0,2);},
							1, {Ndef(\am0, {GVerb.ar(SinOsc.ar(["d3".namecps, "a2".namecps])*EnvGen.kr(Env.perc(0.01, 0.7)), 78, 99)*0.2}).play(0,2);},
							2, {Ndef(\am0, {GVerb.ar(SinOsc.ar(["f3".namecps, "a2".namecps])*EnvGen.kr(Env.perc(0.01, 0.7)), 78, 99)*0.2}).play(0,2);},
							3, {Ndef(\am0, {GVerb.ar(SinOsc.ar(["e3".namecps, "g#2".namecps])*EnvGen.kr(Env.perc(0.01, 0.7)), 78, 99)*0.2}).play(0,2);},
							4, {Ndef(\am0, {GVerb.ar(SinOsc.ar(["c3".namecps, "a2".namecps])*EnvGen.kr(Env.perc(0.01, 0.7)), 78, 99)*0.2}).play(0,2);},
							5, {Ndef(\am0, {GVerb.ar(SinOsc.ar(["g3".namecps, "g2".namecps])*EnvGen.kr(Env.perc(0.01, 0.7)), 78, 99)*0.2}).play(0,2);},
							6, {Ndef(\am3, {GVerb.ar(SinOsc.ar(["g1".namecps, "g1".namecps])*EnvGen.kr(Env.perc(0.01, 0.7)), 78, 99)*0.2}).play(0,2);},
							7, {Synth(\sampleNarcode, [\buf, ~buffers['rabinal'][18], \rl, 9, \rate, 2, \pos, 0, \amp, 1, \out, 80]);}
						);
					},

				"Rezo", {(~name ++ " but "++i.asString).postln;
					g = Group.new(s, 'addToHead');
					Ndef(\rev, {GVerb.ar(In.ar(60,2), 119, 6)*1}).play(0,2).fadeTime_(4);
					Ndef(\rzo).fadeTime_(3);Ndef(\rzo2).fadeTime_(1);
						switch(i,
							0, {Ndef(\rzo, { ((SinOsc.ar(["f#1".namecps, "f#1".namecps*2], 0, [1, 0.8])*0.1) + (BrownNoise.ar(LFNoise0.kr(7).range(0.01, 1))*1*LFNoise0.kr(1/3).range(0, 0.1)*EnvGen.kr(Env.perc(0.01, 3))) );
}).play(60, group: g);},
							1, {Ndef(\rzo, { ((SinOsc.ar(["e1".namecps, "e1".namecps*2], 0, [1, 0.8])*0.1) + (BrownNoise.ar(LFNoise0.kr(7).range(0.01, 1))*1*LFNoise0.kr(1/3).range(0, 0.1)*EnvGen.kr(Env.perc(0.01, 3))) );
}).play(60, group: g);},
							2, {Ndef(\rzo, { ((SinOsc.ar(["a1".namecps, "a1".namecps*2], 0, [1, 0.8])*0.1) + (BrownNoise.ar(LFNoise0.kr(7).range(0.01, 1))*1*LFNoise0.kr(1/3).range(0, 0.1)*EnvGen.kr(Env.perc(0.01, 3))) );
}).play(60, group: g);},
							3, {Ndef(\rzo, { ((SinOsc.ar(["d1".namecps, "d1".namecps*2], 0, [1, 0.8])*0.1) + (BrownNoise.ar(LFNoise0.kr(7).range(0.01, 1))*1*LFNoise0.kr(1/3).range(0, 0.1)*EnvGen.kr(Env.perc(0.01, 3))) );
}).play(60, group: g);},
							4 , {Ndef(\rzo).stop(0.2)},
						);
					},
				"7 círculos", {(~name ++ " but "++i.asString).postln;

					}
			);
		 };
		};
	}

});
);

);