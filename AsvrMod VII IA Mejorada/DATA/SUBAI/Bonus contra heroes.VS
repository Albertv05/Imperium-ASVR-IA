//void, Obj This

Unit this;

this = This.AsUnit;
Sleep(500);
while(!.IsValid) Sleep(10000); 
if (!.IsAlive()) return;
if ((!.HasItem("Bonus contra heroes")) && (.IsAlive))
.AddItem("Bonus contra heroes");




//prevent behavior script from terminating (this will lockup the game)
while(true) Sleep(50000);
