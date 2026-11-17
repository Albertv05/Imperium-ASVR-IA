// void, Obj This

Building this;
int k, l, c, poblacion;
ObjList peasant;
Settlement settle;
int duration, time_step, percent, additional, damage, it;

this = This.AsBuilding();
if (!.IsValid()) return;

duration = GetConst("StonehengeSuicidioTime");
time_step = GetConst("StonehengeSuicidioTimeStep");
percent = GetConst("StonehengeSuicidioPorcentajePoblacion");
additional = GetConst("StonehengeSuicidioPoblacionExtra");
damage = GetConst("StonehengeSuicidioDamage");

PlaySound("data/Sound Entities/StonehengeSpell.xml");
ShowAnnouncement("An", "Muerte silenciosa - Activo");
for (it = duration/time_step; it > 0; it -= 1) {
	peasant = GetSettlements("Building", 0);
	c = peasant.count();
	for (l = 0; l < c; l += 1) {
		settle = peasant[l].AsBuilding().settlement();
		poblacion = settle.population * (100 - percent) / 100 - additional;
		if (poblacion < 11) poblacion = 11;
		settle.SetPopulation(poblacion);
		if (l % 30 == 0) Sleep(10);
	}

	for (k = 1; k <= 16; k += 1) {
		peasant = GetPlayerUnits(k, "Peasant");
		peasant.ClearDead();
		c = peasant.count();
		for (l = 0; l < c; l += 1) {
			peasant[l].AsUnit().Damage(damage);
			CreateFeedback("Death", peasant[l].AsUnit());
			if (l % 30 == 0) Sleep(10);
		}
	}

	Sleep(time_step);
}
HideAnnouncement("An");