Unit this;
this = This.AsUnit;

while(!.IsValid) Sleep(10000); 
if (!.IsAlive()) return;

if (.IsAlive){			

if ((.IsHeirOf("RLider2")) && (!.HasItem("GranGeneral")))
	.AddItem("GranGeneral");

if ((.IsHeirOf("MLider2")) && (!.HasItem("GranGeneral")))
	.AddItem("GranGeneral");

if ((.IsHeirOf("CLider1")) && (!.HasItem("GranGeneral")))
	.AddItem("GranGeneral");

if ((.IsHeirOf("GLider3")) && (!.HasItem("GranGeneral")))
	.AddItem("GranGeneral");

if ((.IsHeirOf("ELider4")) && (!.HasItem("GranGeneral")))
	.AddItem("GranGeneral");

if ((.IsHeirOf("ILider4")) && (!.HasItem("GranGeneral")))
	.AddItem("GranGeneral");

if ((.IsHeirOf("BLider1")) && (!.HasItem("PresenciaInspiradora")))
	.AddItem("PresenciaInspiradora");

if ((.IsHeirOf("TLider1")) && (!.HasItem("PresenciaInspiradora")))
	.AddItem("PresenciaInspiradora");

if ((.IsHeirOf("ILider1")) && (!.HasItem("AtaqueSorpresa")))
	.AddItem("AtaqueSorpresa");

if ((.IsHeirOf("BLider3")) && (!.HasItem("JarlLegendario")))
	.AddItem("JarlLegendario");

if ((.IsHeirOf("CLider3")) && (!.HasItem("HijoCartago")))
	.AddItem("HijoCartago");

if ((.IsHeirOf("GLider2")) && (!.HasItem("PrincesaGuerrera")))
	.AddItem("PrincesaGuerrera");

if ((.IsHeirOf("GLider1")) && (!.HasItem("AvatarBelenos")))
	.AddItem("AvatarBelenos");

if ((.IsHeirOf("CLider2")) && (!.HasItem("RecuperarBotin")))
	.AddItem("RecuperarBotin");

if ((.IsHeirOf("MLider3")) && (!.HasItem("FavoritoMarte")))
	.AddItem("FavoritoMarte");

if ((.IsHeirOf("RLider3")) && (!.HasItem("FavoritoJupiter")))
	.AddItem("FavoritoJupiter");

if ((.IsHeirOf("BLider2")) && (!.HasItem("GranMaestro")))
	.AddItem("GranMaestro");

if ((.IsHeirOf("TLider3")) && (!.HasItem("GranMaestro")))
	.AddItem("GranMaestro");

if ((.IsHeirOf("ELider3")) && (!.HasItem("GranMaestro")))
	.AddItem("GranMaestro");

if ((.IsHeirOf("ELider2")) && (!.HasItem("Misticismo")))
	.AddItem("Misticismo");

if ((.IsHeirOf("GLider4")) && (!.HasItem("Misticismo")))
	.AddItem("Misticismo");

if ((.IsHeirOf("ELider1")) && (!.HasItem("TropasRegulares")))
	.AddItem("TropasRegulares");

if ((.IsHeirOf("TLider2")) && (!.HasItem("LiderEjemplar")))
	.AddItem("LiderEjemplar");

if ((.IsHeirOf("ILider2")) && (!.HasItem("ResistenciaNumantina")))
	.AddItem("ResistenciaNumantina");

if ((.IsHeirOf("ILider3")) && (!.HasItem("GuardiaReal")))
	.AddItem("GuardiaReal");

if ((.IsHeirOf("MLider1")) && (!.HasItem("DisciplinaMilitar")))
	.AddItem("DisciplinaMilitar");

if ((.IsHeirOf("RLider1")) && (!.HasItem("LeyendasRoma")))
	.AddItem("LeyendasRoma");

if ((.IsHeirOf("TLider4")) && (!.HasItem("TributosMilitares")))
	.AddItem("TributosMilitares");

if ((.IsHeirOf("CLider4")) && (!.HasItem("VeteranosNumidia")))
	.AddItem("VeteranosNumidia");

if ((.IsHeirOf("BLider4")) && (!.HasItem("TradicionLancera")))
	.AddItem("TradicionLancera");
}

Sleep(50000);

//prevent behavior script from terminating (this will lockup the game)
while(true) Sleep(50000);
