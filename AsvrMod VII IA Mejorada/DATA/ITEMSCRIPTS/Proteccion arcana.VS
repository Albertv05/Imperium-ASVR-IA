//void, Obj owner
Unit this;
Obj obj;

this = owner.AsDruid();

if (!.IsValid) return;
if (.InHolder) return;

SetUseCount(5 + .inherentlevel);
while (GetUseCount > 0){

Sleep(1000);
obj = Place("CoverOfMercy", .pos+Point(-rand(300) + 150, -rand(300) + 150), .player);
       obj.SetStamina(2);
   ItemUsed(1);
 } 
.RemoveItem("Hechizo proteccion arcana"); 

//prevent behavior script from terminating (this will lockup the game)
while(true) Sleep(50000);
