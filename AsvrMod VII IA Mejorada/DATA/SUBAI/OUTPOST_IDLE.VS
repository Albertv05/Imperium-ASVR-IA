// void, Obj This

Settlement this;
int min_resource, refresh, food_sales, food_income, required_gold, required_food, gold_income, reserved_food, food_income2;
int i;
Wagon wagon;
bool bProduceGold, bProduceFood, bSellFood, bSellGold, bWagon;
ObjList olLibyansOut;
ObjList olUnitsOut;
str strCommand;

this = This.AsBuilding().settlement;

refresh = GetConst("OutpostRefresh");
food_sales = GetConst("GOutpostFoodSales");
food_income = GetConst("GOutpostGoldReturn");
gold_income = GetConst("ROutpostGoldReturn");
food_income2 = GetConst("COutpostFoodReturn");
required_gold = GetConst("ROutpostRequiredGold");
required_food = GetConst("COutpostRequiredFood");
min_resource = GetConst("MinResQtyToTransport");
bProduceGold = This.IsHeirOf("ROutpost");
bProduceFood = This.IsHeirOf("COutpost");

while (1) {
	if (.IsIndependent())
	{
			Sleep(refresh);
			continue;
	}

	Sleep(refresh);
	bSellFood = EnvReadString(this, "GOutpostSellFood") == "yes";
	// gaul outpost behaviour
	if (!bProduceGold && !bProduceFood && bSellFood && .food > food_sales) {
		.SetFood(.food - food_sales);
		.SetGold(.gold + food_income);
		.GoldConverted(food_income);
	}

	bSellGold = EnvReadString(this, "TOutpostSellGold") == "yes";
	// german outpost behaviour
	if (!bProduceGold && !bProduceFood && bSellGold && .gold > 10) {
		.SetGold(.gold - 10);
		.SetFood(.food + 20);
		.GoldConverted(-10);
	}
	// roman outpost behaviour
	if(bProduceGold && .gold >= required_gold) {
		.SetGold(.gold + gold_income);
		.GoldConverted(gold_income);
	}
	// carthage outpost behaviour
	if(bProduceFood && .food >= required_food) {
		.SetFood(.food + food_income2);	
	}

	// send resources
	if (.supplied == this)
		.StopSupply();
	if (!.supplied.IsValid()) continue;
	if (!DiplGetCeaseFire(.player, .supplied.player)) continue;
	bWagon = false;
	if (.food > min_resource) {
		int food;
		food = 1000;
		if (bProduceFood && .food > required_food && .food - required_food < 1000)
			food = .food - required_food;
		if (food > min_resource) {
			wagon = .CreateMuleFood(food);
			wagon.SetCommand("unload", .supplied.GetCentralBuilding());
			bWagon = true;
		}
	}

	bWagon = false;
	if (.gold > min_resource) {
		int gold;
		gold = 1000;
		if (bProduceGold && .gold > required_gold && .gold - required_gold < 1000)
			gold = .gold - required_gold;
		if (gold > min_resource) {
			wagon = .CreateMuleGold(gold);
			wagon.SetCommand("unload", .supplied.GetCentralBuilding());
			bWagon = true;
		}
	}
	



	if (.Units.count)
		reserved_food = 100;
	else
		reserved_food = 0;	
	if (!bProduceFood && !bWagon && .food > (min_resource + reserved_food) && !bSellFood) {
		if (.food - reserved_food > 1000)
			wagon = .CreateMuleFood(1000);
		else
			wagon = .CreateMuleFood(.food - reserved_food);
		wagon.SetCommand("unload", .supplied.GetCentralBuilding());
	}

	if( .Units.count ) 
	{
		point pt;

		olUnitsOut.Clear;
		for(i=0; i<.Units.count; i+=1) {
			if( This.AsBuilding.IsEnemy(.Units[i] ) ) {
				olUnitsOut.Add(.Units[i]);
			}
			if (i % 50 == 49) Sleep(1);
		}
		olUnitsOut.ClearDead;

		pt.Set(1,0);
		pt.SetLen(This.AsBuilding.radius);
		pt.Rot(rand(360));
		pt = pt + This.AsBuilding.pos;
		olUnitsOut.SetCommand("advance", pt);
	}
	
}
