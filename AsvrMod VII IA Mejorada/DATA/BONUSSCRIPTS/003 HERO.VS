// void, Settlement set, int playerid
//@name Leader
//@name.es Líder
//@name.it Condottiero
//@description A leader hero of your civilization at the start.
//@description.es Un héroe líder de tu civilización al empezar.
//@description.it Un eroe condottiero della tua civiltà all'inizio.

int r;
str hclass;
Unit newunit;


Sleep(100);

r = set.GetCentralBuilding.race;

if (r == Gaul)
	hclass = "GLider";
else if (r == ImperialRome)
	hclass = "MLider";
else if (r == RepublicanRome)
	hclass = "RLider";
else if (r == Carthage)
	hclass = "CLider";
else if (r == Iberia)
	hclass = "ILider";
else if (r == Britain)
	hclass = "BLider";
else if (r == Egypt)
	hclass = "ELider";
else if (r == Germany)
	hclass = "TLider";

newunit = Place(GetRandomHeroClass(hclass, playerid), set.GetCentralBuilding().pos, playerid);
set.ForceAddUnit(newunit);