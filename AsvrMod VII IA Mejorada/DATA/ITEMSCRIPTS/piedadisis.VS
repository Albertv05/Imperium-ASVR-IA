Obj obj;

if(attached.AsUnit.InHolder)
	return;

obj = Place("CoverOfMercy", attached.pos, attached.player);
obj.SetStamina(5);

