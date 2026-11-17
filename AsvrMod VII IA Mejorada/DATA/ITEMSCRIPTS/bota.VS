//void, Obj owner
Unit this, u;

while(true){
Sleep(1000);
if (GetUseCount() < 1000)
SetUseCount(GetUseCount() + 10);
if (GetUseCount() > 1000)
SetUseCount(1000);

}

//prevent behavior script from terminating (this will lockup the game)
while(true) Sleep(50000);
