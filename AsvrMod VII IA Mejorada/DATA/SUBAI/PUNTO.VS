// void, Obj this, point pt


.Progress();


if(EnvReadInt(.AsBuilding(), "Punto") == 0)
	
EnvWriteInt(.AsBuilding(), "Punto", 1);


EnvWriteInt(.AsBuilding(), "X", pt.x);

EnvWriteInt(.AsBuilding(), "Y", pt.y);

Place("Pt3", pt, .player);