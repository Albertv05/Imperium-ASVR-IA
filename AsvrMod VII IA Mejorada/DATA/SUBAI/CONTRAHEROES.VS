// void, Obj This

Unit this;

Unit uEnemy;

this = This.AsUnit;

Sleep(50);

while(!.IsValid) Sleep(10000); 

while(.IsValid){
  Sleep(500);      
        if(!.InHolder){
		uEnemy = .BestTargetInRange( .posRH, 70 ).AsUnit;
                	if (uEnemy.IsAlive){
				if(.IsValidTarget( uEnemy )){
	                                if(uEnemy.AsHero.IsValid()){
	                                        .AddBonus(100,0,0,0,0);
	                                        Sleep(1000);
						.AddBonus(-100,0,0,0,0);
								} 

					if(!uEnemy.AsHero.IsValid()){
	                                                Sleep(1000);
 								break;
	                                        			}
	                                			} 
	                        	}
                        }
        }     	


//prevent behavior script from terminating (this will lockup the game)
while(true) Sleep(50000);
