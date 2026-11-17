//void, Obj owner
Unit this, u;

this = owner.AsUnit();

if (!.IsValid) return;

if(!.InHolder){
	u = Place("Momia", .pos+Point(rand(120)+20, rand(120)+20), .player);
        if(u.IsValid){
        	u.StartAnim(17, u.pos);
        	u.SetLevel(owner.AsUnit.level);
                CreateFeedback("Damage1", u);
	        ItemUsed(1);
        }
} else {
	Sleep(2000);
}