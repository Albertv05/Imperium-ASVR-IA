// void, Obj This

Obj this;
Query our_heroes;
Query our_units;
ObjList list;
Unit unit, momia;
int counter, k, i;
int dead_hero_level, grave_lifetime;
int units_blessed;
bool items_given;

this = This;
our_heroes = Intersect(ObjsInCircle(.pos, .range, "Hero"), ClassPlayerObjs("Hero", .player));
our_units = Intersect(ObjsInCircle(.pos, .range, "Military"), ClassPlayerObjs("Military", .player));

dead_hero_level = .maxstamina;
grave_lifetime = 60 + 20 * dead_hero_level;

.StartAnim(1, .pos);
Sleep(rand(1000) + .TimeToAnimFinish()); // the random is in the case of starting map with 1k graves
.SetMaxHealth(grave_lifetime+1);
counter = 0;
while (1)
{
	counter += 1;
	Sleep(1000);

	if (counter % 2 == 0) {
		list = our_heroes.GetObjList();
		list.ClearDead();
		k = list.count;
		i = rand(k);
		while (k > 0) {
			unit = list[i].AsUnit();
			if (unit.IsValid())
			if (unit.level < dead_hero_level/3*2) {
				unit.SetLevel(unit.level + 1);
				CreateFeedback("Experience", unit);
				break;
			}
			i += 1;
			if (i >= list.count) i = 0;
			k -= 1;
		}
	}	

	if (counter % 5 == 0)
		.SetStamina(.stamina + 1);

	if (.stamina == 0) continue;

	list = our_units.GetObjList();
	list.ClearDead();
	k = list.count;
	i = rand(k);
	units_blessed = 0;
	while (k > 0) {
		unit = list[i].AsUnit();
		if (!unit.AsHero().IsValid()) {
			items_given = false;
			if (unit.HasItem("Guerrero"))
			{
				if (unit.FindItem("Guerrero").use_count<100)
				unit.FindItem("Guerrero").SetUseCount(unit.FindItem("Guerrero").use_count+20);
				if (unit.FindItem("Guerrero").use_count >= 100)
				unit.ExchangeItem(unit.AsUnit.FindItem("Guerrero"), "Veterano");
				items_given = true;
			}
			if (dead_hero_level >= 20){
			if (unit.HasItem("Veterano"))
			{
				if (unit.FindItem("Veterano").use_count<200)
				unit.FindItem("Veterano").SetUseCount(unit.FindItem("Veterano").use_count+20);
				if (unit.FindItem("Veterano").use_count >= 200)
				unit.ExchangeItem(unit.AsUnit.FindItem("Veterano"), "Elite");
				items_given = true;
			}}
			if (dead_hero_level >= 25){
			if (unit.HasItem("Elite"))
			{
				if (unit.FindItem("Elite").use_count<350)
				unit.FindItem("Elite").SetUseCount(unit.FindItem("Elite").use_count+20);
				if (unit.FindItem("Elite").use_count >= 350)
				unit.ExchangeItem(unit.AsUnit.FindItem("Elite"), "Campeon");
				items_given = true;
			}}
			if (dead_hero_level >= 35){
			if (unit.HasItem("Campeon"))
			{
				if (unit.FindItem("Campeon").use_count<550)
				unit.FindItem("Campeon").SetUseCount(unit.FindItem("Campeon").use_count+20);
				if (unit.FindItem("Campeon").use_count >= 550)
				unit.ExchangeItem(unit.AsUnit.FindItem("Campeon"), "Leyenda");
				items_given = true;
			}}
			if (items_given) {
				.SetStamina(.stamina - 1);
				if (.stamina == 0) break;
				units_blessed += 1;
				if (units_blessed == 5) break;
			}
		}
		i += 1;
		if (i >= list.count) i = 0;
		k -= 1;
	}

	grave_lifetime -= 1;
	.SetMaxHealth(.maxhealth -1);
	if (grave_lifetime == 120) .SetState(2);
	else if (grave_lifetime == 60) .SetState(3);
	else if (grave_lifetime == 30) .SetState(4);
	else if (grave_lifetime == 15) .SetState(5);
	else if (grave_lifetime == 0) break;
}
.StartAnim(9, .pos);
Sleep(.TimeToAnimFinish());
.Erase();
Sleep(100000);