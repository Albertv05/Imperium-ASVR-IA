// void, Obj this

int gametime;
int pop;
int militamen;
int level;
Unit u;
bool give_veteran_guild;

.Progress();

militamen = 50;

gametime = GetTime() / 60000;

//I cauld use a simple formula to calculate this, but I decided not to.
if (gametime >= 20 && gametime < 40) {
	level = 4;
}
else if (gametime >= 40 && gametime < 60) {
	level = 8;
}
else if (gametime >= 60) {
	level = 12;
}
else {
	level = 1;
}

if (EnvReadString(.AsBuilding.settlement, "Maestros herreros") == "researched")
	give_veteran_guild = true;
else
	give_veteran_guild = false;

//spawn militia
while (militamen) {
	u = Place("IMilitiaman", .pos, .player);
	u.SetLevel(level);
	u.SetFood(0);
	u.AddItem("Guerrero");
	if (give_veteran_guild)
		u.AddBonus(4,2,2,0,0);
	if (Count(u.player, "ILider2") > 0){
		u.AddItem("Supervivencia");
		u.SetFeeding(false);}
	.AsBuilding.settlement.ForceAddUnit(u);
	militamen -= 1;
}