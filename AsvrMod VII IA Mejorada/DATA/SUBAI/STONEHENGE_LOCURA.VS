// void, Obj This

Building this;
int it, k, l, c;
ObjList player_units;
Unit unit;
int duration, time_step;

this = This.AsBuilding();
if (!.IsValid()) return;

duration = GetConst("StonehengeLocuraTime");
time_step = GetConst("StonehengeLocuraTimeStep");

PlaySound("data/Sound Entities/StonehengeSpell.xml");
ShowAnnouncement("An", "Furia salvaje - Activo");
for (it = duration/time_step; it > 0; it -= 1) {
	for (k = 1; k <= 16; k += 1) {
		player_units = GetPlayerUnits(k, "Unit");
		player_units.ClearDead();
		c = player_units.count();
		for (l = 0; l < c; l += 1) {
			player_units[l].AsUnit().AddBonus(1,0,0,0,0);
			if (l % 30 == 0) Sleep(10);
		}
	}
	Sleep(time_step);
}
HideAnnouncement("An");
for (k = 1; k <= 16; k += 1) {
		player_units = GetPlayerUnits(k, "Unit");
		player_units.ClearDead();
		c = player_units.count();
		for (l = 0; l < c; l += 1) {
			player_units[l].AsUnit().RemoveBonus(120,0,0,0,0);
			if (l % 30 == 0) Sleep(10);
		}
}