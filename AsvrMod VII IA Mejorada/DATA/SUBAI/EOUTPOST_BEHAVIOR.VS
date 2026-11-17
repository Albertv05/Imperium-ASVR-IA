//void, Obj This

Building this;
ObjList ol;
int i;
Unit u;


this = This.AsBuilding();

Sleep(2500);

while(1)
{
	ol = .settlement.Units;
	for (i = 0; i < ol.count; i += 1)
	{
		u = ol[i].AsUnit;
		if (!u.IsValid) continue;
		if (.IsEnemy(u)) continue;
		if ((u.AsUnit().food) < (u.AsUnit().maxfood)) 
		u.SetFood(u.food+1);
		if ((u.health) < (u.maxhealth)) 
		u.Heal(5);
     		if ((u.stamina) < (u.maxstamina))
     		u.HealStamina(1);
										  
	}
	Sleep(2500);
}
