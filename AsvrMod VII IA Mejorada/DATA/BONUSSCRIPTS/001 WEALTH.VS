// void, Settlement set, int playerid
//@name Army
//@name.es Ejército
//@name.it Esercito
//@description 25 swordsmen and 25 archers of your civilization at the start.
//@description.es 25 espadachines y 25 arqueros de tu civilización al empezar.
//@description.it 25 spadaccini e 25 arcieri della tua civiltà all'inizio.

int r;
int number1, number2;
str class1, class2;
Unit u;


Sleep(100);

number1 = 25;
number2 = 25;

r = set.GetCentralBuilding.race;

if (r == Gaul){
	class1 = "GSwordsman";
	class2 = "GArcher";}
else if (r == ImperialRome){
	class1 = "RHastatus";
	class2 = "RArcher";}
else if (r == RepublicanRome){
	class1 = "RHastatus";
	class2 = "RArcher";}
else if (r == Carthage){
	class1 = "CLibyanFootman";
	class2 = "CJavelinThrower";}
else if (r == Iberia){
	class1 = "IMilitiaman";
	class2 = "IArcher";}
else if (r == Britain){
	class1 = "BSwordsman";
	class2 = "BBowman";}
else if (r == Egypt){
	class1 = "ESwordsman";
	class2 = "EArcher";}
else if (r == Germany){
	class1 = "TSwordsman";
	class2 = "TArcher";}

while (number1) {
	u = Place(class1, set.GetCentralBuilding.pos, set.player);
	set.ForceAddUnit(u);
	number1 -= 1;
}

while (number2) {
	u = Place(class2, set.GetCentralBuilding.pos, set.player);
	set.ForceAddUnit(u);
	number2 -= 1;
}