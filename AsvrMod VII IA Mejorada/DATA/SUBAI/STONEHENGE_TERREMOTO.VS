// void, Obj This

Building this;
int it, k, l, c;
ObjList player_units;
Unit unit;
int duration, time_step, damage;

this = This.AsBuilding();
if (!.IsValid()) return;

duration = GetConst("StonehengeTerremotoTime");
time_step = GetConst("StonehengeTerremotoTimeStep");
damage = GetConst("StonehengeTerremotoDamage");

PlaySound("data/Sound Entities/StonehengeSpell.xml");
ShowAnnouncement("An", "Ira de la tierra - Activo");
for (it = duration/time_step; it > 0; it -= 1) {
	for (k = 1; k <= 16; k += 1) {
		player_units = GetSettlements("Building", k);
		c = player_units.count();
		for (l = 0; l < c; l += 1) {	
	if ((player_units[l].IsHeirOf("BaseTownhall") || player_units[l].IsHeirOf("Outpost") || player_units[l].IsHeirOf("BaseVillage")) && (player_units[l].health > player_units[l].maxhealth/10) && (!player_units[l].player == 15) && (!player_units[l].player == 16)) {
			player_units[l].Damage(damage);}
			if (l % 30 == 0) Sleep(10);
		}
	}
	Sleep(time_step);
	
}
HideAnnouncement("An");