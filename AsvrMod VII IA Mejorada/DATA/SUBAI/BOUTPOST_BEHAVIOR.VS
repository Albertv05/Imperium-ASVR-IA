//void, Obj This

Building this;
ObjList ol;
int i;
int nSleepTime;
Unit u;

nSleepTime = GetConst("IOutpostExpTick");

this = This.AsBuilding();

Sleep(rand(nSleepTime) + 1000);

while(1)
{
Sleep(nSleepTime);

	ol = .settlement.Units;
	for (i = 0; i < ol.count; i += 1)
	{
		u = ol[i].AsUnit;
		if (!u.IsValid) continue;
		if (.IsEnemy(u)) continue;

		if (u.HasItem("Veterano")) {
		if (u.FindItem("Veterano").use_count<200)
 		u.FindItem("Veterano").SetUseCount(u.FindItem("Veterano").use_count+10);
		if (u.FindItem("Veterano").use_count >= 100)
		u.ExchangeItem(u.AsUnit.FindItem("Veterano"), "Elite");
		return;
										  }
		if (u.HasItem("Guerrero")) {
		if (u.FindItem("Guerrero").use_count<100)
 		u.FindItem("Guerrero").SetUseCount(u.FindItem("Guerrero").use_count+10);
		if (u.FindItem("Guerrero").use_count >= 100)
		u.ExchangeItem(u.AsUnit.FindItem("Guerrero"), "Veterano");
		return;
										  }

	}
Sleep(nSleepTime);
}
