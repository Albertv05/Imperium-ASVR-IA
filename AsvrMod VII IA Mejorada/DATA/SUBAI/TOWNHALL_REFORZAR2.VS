//void, Obj This

Building bld;
Settlement this;

bld = This.AsBuilding();



if (bld.IsValid) {
	this = bld.settlement;
	if (.IsValid) {
		ObjList l;
		int i;
		Building bld2;

		l = .ObjectsAround("BaseTownBuilding");
		l.AddList(.ObjectsAround("Gate"));
		for (i = l.count; i > 0;) {
			i -= 1;
			bld2 = l[i].AsBuilding();
			if (bld.IsEnemy(bld2))
				continue;
			if (bld2.maxhealth < 10000){
			EnvWriteString(this, "reforzar", "on");
			Sleep(10000);
			bld2.SetMaxHealth(bld2.maxhealth + 5000);
			bld2.SetHealth(bld2.health + 5000);
							}

		}	
		PlaySound("SOUNDS/SELECTION/IRONMINE.WAV");
	}
}