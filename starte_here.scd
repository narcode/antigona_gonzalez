/////////// Antígona González
////////////
/////// fina 2020
//////////

//// INSTRUCCIONES \\\\

// 0. Evaluar las siguientes lineas, línea por línea:
o = Server.local.options;
o.memSize = 4096*10;
s.reboot;
s.meter;

// 1. poner cursor en linea 15 y evaluar con shift+enter
~path = thisProcess.nowExecutingPath.dirname ++ "/";

// 2. poner cursor en linea 18 y evaluar con shift+enter
(~path++"synths_buffers_mx.scd").load;

// 3. poner cursor en linea 21 y evaluar con shift+enter
(~path++"midi.scd").load;


////// Estoy desapareciendo
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
h.(~dm9, "d1");
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
h.(~g3, "g1", 16);
