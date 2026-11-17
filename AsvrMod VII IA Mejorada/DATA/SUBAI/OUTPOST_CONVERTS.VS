//void, Obj This

Building this;
ObjList ol;
Unit uRecruit;
int i;
int random;
str class_unit;
int nSleepTime = 60000;
this = This.AsBuilding();
 
if (.race==Carthage) {
random = rand(7);
	if(random == 0){
	class_unit = "CLibyanFootman";
        nSleepTime = 10000;}
	if(random == 1){
	class_unit = "CJavelinThrower";
        nSleepTime = 15000;}
	if(random == 2){
	class_unit = "CMaceman";
        nSleepTime = 20000;}
	if(random == 3){
	class_unit = "CBerberAssassin";
        nSleepTime = 20000;}
	if(random == 4){
	class_unit = "CMERCENARIO";
        nSleepTime = 25000;}	
	if(random == 5){
	class_unit = "CNumidianRider";
        nSleepTime = 30000;}
	if(random == 6){
	class_unit = "CNoble";
        nSleepTime = 35000;}

} else if (.race==Iberia){
random = rand(6);
	if(random == 0){
	class_unit = "IMilitiaman";
        nSleepTime = 10000;}
	if(random == 1){
	class_unit = "IArcher";
        nSleepTime = 15000;}
	if(random == 2){
	class_unit = "IDefender";
        nSleepTime = 20000;}
	if(random == 3){
	class_unit = "ISlinger";
        nSleepTime = 20000;}
	if(random == 4){
	class_unit = "ICavalry";
        nSleepTime = 25000;}	
	if(random == 5){
	class_unit = "IEliteGuard";
        nSleepTime = 30000;}

} else if (.race==Britain){
random = rand(6);
	if(random == 0){
	class_unit = "BSwordsman";
        nSleepTime = 10000;}
	if(random == 1){
	class_unit = "BBowman";
        nSleepTime = 15000;}
	if(random == 2){
	class_unit = "BBronzeSpearman";
        nSleepTime = 20000;}
	if(random == 3){
	class_unit = "BJavelineer";
        nSleepTime = 20000;}
	if(random == 4){
	class_unit = "BShieldBearer";
        nSleepTime = 25000;}	
	if(random == 5){
	class_unit = "BHighlander";
        nSleepTime = 30000;}

} else if (.race==Germany) {
random = rand(7);
	if(random == 0){
	class_unit = "TSwordsman";
        nSleepTime = 10000;}
	if(random == 1){
	class_unit = "TArcher";
        nSleepTime = 15000;}
	if(random == 2){
	class_unit = "TAxeman";
        nSleepTime = 20000;}
	if(random == 3){
	class_unit = "THuntress";
        nSleepTime = 20000;}
	if(random == 4){
	class_unit = "TTeutonRider";
        nSleepTime = 25000;}	
	if(random == 5){
	class_unit = "TMaceman";
        nSleepTime = 30000;}
	if(random == 6){
	class_unit = "NVAEL";
        nSleepTime = 35000;}

} else if (.race==Egypt){
random = rand(6);
	if(random == 0){
	class_unit = "ESwordsman";
        nSleepTime = 10000;}
	if(random == 1){
	class_unit = "EArcher";
        nSleepTime = 15000;}
	if(random == 2){
	class_unit = "EAxetrower";
        nSleepTime = 20000;}
	if(random == 3){
	class_unit = "EGuardian";
        nSleepTime = 20000;}
	if(random == 4){
	class_unit = "EHorusWarrior";
        nSleepTime = 30000;}	
	if(random == 5){
	class_unit = "EAnubisWarrior";
        nSleepTime = 30000;}

} else if (.race==Gaul) {
random = rand(6);
	if(random == 0){
	class_unit = "GSwordsman";
        nSleepTime = 10000;}
	if(random == 1){
	class_unit = "GArcher";
        nSleepTime = 15000;}
	if(random == 2){
	class_unit = "GSpearman";
        nSleepTime = 20000;}
	if(random == 3){
	class_unit = "GAxeman";
        nSleepTime = 20000;}
	if(random == 4){
	class_unit = "GHorseman";
        nSleepTime = 25000;}	
	if(random == 5){
	class_unit = "GWomanWarrior";
        nSleepTime = 30000;}

} else if (.race == ImperialRome || .race == RepublicanRome) {
random = rand(7);
	if(random == 0){
	class_unit = "RHastatus";
        nSleepTime = 10000;}
	if(random == 1){
	class_unit = "RArcher";
        nSleepTime = 15000;}
	if(random == 2){
	class_unit = "RPrinciple";
        nSleepTime = 20000;}
	if(random == 3){
	class_unit = "RVelit";
        nSleepTime = 20000;}
	if(random == 4){
	class_unit = "RScout";
        nSleepTime = 25000;}	
	if(random == 5){
	class_unit = "RPraetorian";
        nSleepTime = 30000;}
	if(random == 6){
	class_unit = "RTribune";
        nSleepTime = 30000;}
}

Sleep(nSleepTime);
while (1)
{
	ol = .settlement.Units.ObjClass("Peasant");
	ol.ClearDead();
	ol = ol.ObjAlly(.player);
	if (ol.count > 0)
	{
		i = rand(ol.count);
		ol[i].Erase;
		uRecruit = Place(class_unit, .pos, .player);
		.settlement.ForceAddUnit(uRecruit);
		ol.Clear();
	}
	Sleep(nSleepTime);
}