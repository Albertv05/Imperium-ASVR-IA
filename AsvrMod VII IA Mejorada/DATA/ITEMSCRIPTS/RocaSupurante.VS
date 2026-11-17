//void, Obj owner, Obj victim

Obj obj;
if(owner.AsUnit.InHolder)
	return;
obj = Place("Mist", owner.AsUnit().pos, owner.player);
obj.SetStamina(10);         
obj.SetCommand("spawn");