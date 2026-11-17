//void, Obj owner
Unit this, u;

this = owner.AsDruid();

if (!.IsValid) return;
if (.InHolder) return;

SetUseCount(5 + .inherentlevel);
while (GetUseCount > 0){

Sleep(1000);

 u = Place("AnubisGhost", .pos+Point(-rand(300) + 150, -rand(300) + 150), .player);
 u.StartAnim(17, u.pos);
        u.SetLevel(.level);
        u.SetStamina(2);
       u.SetMaxHealth(50); 
       u.SetHealth(50);
    u.SetCommand("protect", this);
        CreateFeedback("Damage1", u);
   ItemUsed(1);
 } 
.RemoveItem("Hechizo convocar espiritus"); 

//prevent behavior script from terminating (this will lockup the game)
while(true) Sleep(50000);
