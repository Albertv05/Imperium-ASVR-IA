//void, Obj This

Unit this;

this = This.AsUnit;
Sleep(400);

while(!.IsValid) Sleep(10000); 
if (!.IsAlive()) return;
if ((!.HasItem("Guerrero")) && (!.HasItem("Veterano")) && (!.HasItem("Elite")) && (!.HasItem("Campeon")) && (!.HasItem("Leyenda")) && (!.HasItem("Yule")) && (.IsAlive) && (!.AsHero.IsValid()))
.AddItem("Guerrero");

//prevent behavior script from terminating (this will lockup the game)
while(true) Sleep(50000);