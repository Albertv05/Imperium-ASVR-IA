// void, Settlement set, int playerid
//@name Villagers
//@name.es Aldeanos
//@name.it Contadini
//@description 50 villagers around your town hall at the start.
//@description.es 50 aldeanos alrededor de tu foro al empezar.
//@description.it 50 contadini intorno al foro all'inizio.
Building bld;
Unit unit;
point ptDest, pt;
int lRadius, i, pop_group; 
int xfix, yfix;
str strMaleVillager, strFemaleVillager;

Sleep(rand(1000)+100); 
//set.AddToPopulation(100);
lRadius = GetConst("VillageTrainPeasantRadius"); 
pop_group = 50;
bld = set.GetCentralBuilding; 
//Gaul -> "GVillager" and "GWVillager", 
strMaleVillager = bld.raceStrPref; 
if (bld.race == ImperialRome) strMaleVillager = GetRaceStrPref(RepublicanRome); 
strFemaleVillager = strMaleVillager + "W" + "Villager"; 
strMaleVillager = strMaleVillager + "Villager"; 
xfix = 1; yfix = 1; 
for (i = 0; i < pop_group; i += 1) { 
	ptDest.Set(1,1);
	ptDest.SetLen(rand(lRadius - bld.radius) + bld.radius ); 
	ptDest.Rot(rand(360)); 
	ptDest = ptDest + bld.pos; 
	pt = bld.GetExitPoint(ptDest, false); 
	// 'no peasant over peasant' code 
	if( i == 0 ) pt.Set( pt.x + 10, pt.y + 10 ); 
	else if( i == 1 ) pt.Set( pt.x - 10, pt.y - 10 ); 
	else if( i == 2 ) pt.Set( pt.x - 10, pt.y + 10 ); 
	else if( i == 3 ) pt.Set( pt.x + 10, pt.y - 10 ); 
	else pt.Set( pt.x + 10, pt.y );
	//if (rand(2) == 1)
	unit = Place(strMaleVillager, pt, playerid).AsUnit(); 	
	//else
	//unit = Place(strFemaleVillager, pt, playerid).AsUnit();
	unit.SetCommand("move", ptDest); 
	Sleep( 200 ); 
}
