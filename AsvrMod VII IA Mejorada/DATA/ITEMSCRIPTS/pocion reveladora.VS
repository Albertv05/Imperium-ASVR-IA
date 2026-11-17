//void, Obj owner

Obj WatchEye;
WatchEye = Place("Vision", target, owner.AsUnit.player);
WatchEye.SetSight(owner.AsUnit.sight * 3);
WatchEye.SetCommand("spy");
ItemUsed(1);

