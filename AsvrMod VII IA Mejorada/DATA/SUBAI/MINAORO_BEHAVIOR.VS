// void, Obj This



Building this;



this = This.AsBuilding();



while(!.IsValid) Sleep(10000); 
while(.IsValid()){

if (.settlement.player == 16){


Sleep(100);


if (.settlement.player != 16){


Sleep(100);


.settlement.SetGold(0);

.settlement.SetPopulation(0);
}


}
}


//prevent behavior script from terminating (this will lockup the game)
while(true) Sleep(50000);