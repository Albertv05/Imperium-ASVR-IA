//void, Obj owner
Unit this, u;

this = owner.AsUnit();

if (!.IsValid) return;

if(!.InHolder){
	u = Place("OsoGuardian", .pos+Point(rand(120)+20, rand(120)+20), .player);
        //.SetName("Wzywajacy"+.player);
        if(u.IsValid){
        	u.SetLevel(owner.AsUnit.level);
	        //SwapSelectedObj(owner, u);
                CreateFeedback("Lightning", u);
	        ItemUsed(1);
        }
} else {
	Sleep(2000);
}