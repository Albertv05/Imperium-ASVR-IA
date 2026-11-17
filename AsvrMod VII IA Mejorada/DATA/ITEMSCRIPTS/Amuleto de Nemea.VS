//void, Obj owner
Unit this, u;

this = owner.AsUnit();

if (!.IsValid) return;

if(!.InHolder){
	u = Place("LionNemea", .pos+Point(rand(120)+20, rand(120)+20), .player);
        //.SetName("Wzywajacy"+.player);
        if(u.IsValid){
        	u.SetLevel((owner.AsUnit.level)+20);
	        u.AddBonus(0,0,0,0,0); 
	        //SwapSelectedObj(owner, u);
	        u.AddCommand(true, "heal", .posRH);
                CreateFeedback("Lightning", u);
	        ItemUsed(1);
        }
} else {
	Sleep(2000);
}