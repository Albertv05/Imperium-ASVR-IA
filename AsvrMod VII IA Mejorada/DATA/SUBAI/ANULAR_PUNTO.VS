//void, Obj this

if(!.AsBuilding().IsValid()) return;

if(EnvReadInt(.AsBuilding(), "Punto") == 1)
	EnvWriteInt(.AsBuilding(), "Punto", 0);