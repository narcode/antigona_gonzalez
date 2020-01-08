/// synths and buffers
{
SynthDef(\harmNarcode, {|chord, out=0, at=8, rl=3, rate=1, pos=0, amp=1, buf, chordamp=1, disamp=(1/8)|
	var env = EnvGen.kr(Env.perc(at, rl), doneAction:2);
	var snd;
	snd = SinOsc.ar([chord, chord*LFNoise1.kr(1/8).range(1,2)], 0, chordamp, disamp)*env;
	Out.ar(out, snd*amp);
}).store;
s.sync;
	SynthDef(\sampleNarcode, {|out=0, rl=0.1, rate=1, pos=0, amp=1, buf|
	var env = EnvGen.kr(Env.perc(0.01, rl), doneAction:2);
	var snd;
	snd = PlayBuf.ar(1, buf, BufRateScale.kr(buf)*rate, 1, BufFrames.kr(buf)*pos)*env;
	Out.ar(out, snd*amp);
}).store;
	s.sync;
	SynthDef(\rezo_bass, {arg gate=1, out=60, amp=1, freq=100;
	var snd1 = SinOsc.ar([freq, freq*2], 0, [1, 0.8])*0.1;
	var snd2 = BrownNoise.ar(LFNoise0.kr(7).range(0.01, 1))*1*LFNoise0.kr(1/3).range(0, 0.1)*EnvGen.kr(Env.perc(0.01, 3));
	var env = EnvGen.kr(Env.adsr(4*t.tempo, 0.3, 0.9, 1*t.tempo), gate, doneAction:2);
	Out.ar(out, amp*(snd1+snd2)*env);
}).store;
	s.sync;
	SynthDef(\act, {|out=0, rt=1, at=0.01, amp=1, rate=1, buf, cut=1600|
var snd, fx;
	snd=PlayBuf.ar(2, buf, rate)*EnvGen.kr(Env.perc(attackTime: at, releaseTime:rt), doneAction: 2);
	fx = LPF.ar(snd, cut);
	Out.ar(out, fx*amp);
}).store;
s.sync;
(// basic
~buffers = ();
~path_samples = thisProcess.nowExecutingPath.dirname ++ "/samples/";
		~buffers['bd'] = Buffer.read(s, ~path_samples ++ "808bd.wav");
~buffers['hh'] = Buffer.read(s, ~path_samples ++ "808hh.wav");
~buffers['sn'] = Buffer.read(s, ~path_samples ++ "808sd.wav");
);
s.sync;
(//// a.g.
~buffers['trio'] = (); ~buffers['trio_voz'] = (); ~buffers['rabinal'] = ();
8.do{|i|
	~buffers['trio'][i] = Buffer.read(s, ~dir ++ "trio_" ++ (i+1).asString ++ ".wav");
};
5.do{|i|
	~buffers['trio_voz'][i] = Buffer.read(s, ~dir ++ "trio_voz_" ++ (i+1).asString ++ ".wav");
};
37.do{|i|
	~buffers['rabinal'][i] = Buffer.read(s, ~dir ++ "/rabinal/" ++ (i+1).asString ++ ".wav");
}
);
	s.sync;
	"A.G. => all buffers anf synths loaded".postln;
	s.sync;
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
	s.sync;
	(
h = {arg chord=nil, bass=nil, rel=3;
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
	s.sync;
	(
r = Routine{
	inf.do{
		s.bind{
			// audio
			~funcs.do{|f| f.(); };
		};
		4.wait; // must be dynamic
	}
};
);
	s.sync;
	~maxsubdiv = 12;
~minsubdiv = 12;
~funcs = ();
	s.sync;
	"A.G. => PZ Beat machine loaded".unixCmd;
}.fork;

