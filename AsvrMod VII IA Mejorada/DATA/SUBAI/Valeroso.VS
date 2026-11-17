//void, Obj This

Unit this;

this = This.AsUnit;
Sleep(500);
while(!.IsValid) Sleep(10000); 
if (!.IsAlive()) return;
if ((!.HasItem("Valeroso")) && (.IsAlive))
.AddItem("Valeroso");

//prevent behavior script from terminating (this will lockup the game)
while(true) Sleep(50000);