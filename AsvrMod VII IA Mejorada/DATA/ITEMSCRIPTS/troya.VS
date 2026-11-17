Obj obj;

if(owner.AsUnit.InHolder) return;

if( owner.AsUnit.FindItem("Coraje de Troya").IsValid && owner.AsUnit.FindItem("Defensa de Troya").IsValid ){
obj = Place("CoverOfMercy", owner.AsUnit.pos, owner.AsUnit.player);
obj.SetStamina(5);
														}