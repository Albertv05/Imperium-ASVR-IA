//void, Obj owner, Obj victim

while (owner.AsUnit().IsValid){

Sleep(60000);
owner.AsUnit().SetExperience(owner.AsUnit().experience + 1);

	}


//prevent behavior script from terminating (this will lockup the game)
while(true) Sleep(50000);