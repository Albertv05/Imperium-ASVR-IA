//void, Obj This

Unit this;

this = This.AsUnit;
Sleep(500);
while(!.IsValid) Sleep(10000); 
if (!.IsAlive()) return;
if ((!.HasItem("Inmune a los espiritus")) && (.IsAlive))
.AddItem("Inmune a los espiritus");


//prevent behavior script from terminating (this will lockup the game)
while(true) Sleep(50000);