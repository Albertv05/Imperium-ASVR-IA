//void, Obj This

Building this;
ObjList ol;
int i;
Unit u;

this = This.AsBuilding();
Sleep(rand(10000) + 5000);
while(1)
{
if (EnvReadString(.settlement, "trabajosforzosos") != "on")
return;

if (.settlement.population>=1) {
 	.settlement.SetGold(.settlement.gold + 20);
	.settlement.GoldConverted(20);

	if (rand(2) == 1)
	.settlement.SetPopulation(.settlement.population - 1);
				}
	
	Sleep(2000);
}
