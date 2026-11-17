//void, Obj owner
Unit this, u;

this = owner.AsUnit();

if (!.IsValid) return;

if((!.InHolder) && (GetUseCount() == 100)){
	u = Place("Bubo", .pos+Point(rand(120)+20, rand(120)+20), .player);
        if(u.IsValid){
        	u.SetLevel(owner.AsUnit.level); 
	        //SwapSelectedObj(owner, u);
        }
SetUseCount(0);
}
