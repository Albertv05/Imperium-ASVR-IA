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
	                                if(uEnemy.IsHeirOf("Horse")){
	                                        .AddBonus(40,0,0,0,0);
	                                        Sleep(1000);
						.AddBonus(-40,0,0,0,0);
								} 

					if(!uEnemy.IsHeirOf("Horse")){
	                                                Sleep(1000);
 								break;
	                                        			}
	                                			} 
	                        	}
                        }
        }     	



//prevent behavior script from terminating (this will lockup the game)
while(true) Sleep(50000);