// void, Obj This

Unit newunit;
Barrack this;
point ptExit, ptEnter, mo;
int perc, level;
Query qEnemies;

str carCmdParam, cdrCmdParam; 

carCmdParam = ParseStr(cmdparam, cdrCmdParam); 

this = This.AsBarrack();

qEnemies = Intersect(ObjsInSight(.settlement.GetCentralBuilding(),"Object"),EnemyObjs(.player(),"Object"));
 
perc = 100 - EnvReadInt(.settlement, "BarrackTrainTimeDecrease");
.Progress((.cmddelay * perc) / 100);

// Create unit
ptExit = .GetExitPoint(.settlement.GetCentralBuilding.pos, false);
if (ptExit.x==-1 && ptExit.y==-1) {
	newunit = Place(carCmdParam, Point(0,0), this.player);
	.settlement.AddUnit(newunit);
} else {
	newunit = Place(carCmdParam, ptExit, this.player);
	if(EnvReadInt(.AsBuilding(), "Punto") == 0)
		if (qEnemies.IsEmpty())
			newunit.SetCommand("enter", .settlement.GetCentralBuilding);
		else
			newunit.SetCommand("advanceenter", .settlement.GetCentralBuilding);
	else
		if (qEnemies.IsEmpty()){
			mo = Point(EnvReadInt(.AsBuilding(), "X"), EnvReadInt(.AsBuilding(), "Y"));
			newunit.SetCommand("move", mo);
		}else{
			mo = Point(EnvReadInt(.AsBuilding(), "X"), EnvReadInt(.AsBuilding(), "Y"));
			newunit.SetCommand("advance", mo);
		}
}

// Set level
level = 1;

if(newunit.IsValid) 
if( GetClassRace(carCmdParam) == Carthage ) {
	if (!newunit.IsHeirOf("BaseMage"))
	  {	
		if( EnvReadString(.settlement, "Shared Strength") == "researched" ) {
			int nThisClass;
			nThisClass = Count(.player, carCmdParam);
			if( nThisClass > 12 )
				level = 6;
		}
		if( EnvReadString(.settlement, "Shared Triumph") == "researched" ) {
			int nThisClass;
			nThisClass = Count(.player, carCmdParam);
			if( nThisClass > 24 )
				level = 12;
		}
	  }
}
{
    int l2;
    l2 = EnvReadInt(.settlement, "levels/" + carCmdParam);
    if (l2 > level) level = l2;
}

// standartization
{
	if(newunit.IsValid)
	if (!newunit.IsHeirOf("BaseMage"))
	  {	
		int l2;
		l2 = EnvReadInt(.player, "standard_spawn_level");
		if (l2 > level) level = l2;
      }
}

newunit.SetLevel(level);

		if (EnvReadString(.player, "Tradicion arquera") == "researched"){
			if (newunit.IsHeirOf("BBowman"))
			newunit.AddItem("Elite");
			if (Count(.player, "BLider4") > 0){
			if ( (newunit.IsHeirOf("BBronzeSpearman")) || (newunit.IsHeirOf("BJavelineer")) )
			newunit.AddItem("Elite"); 		}		
										}

		if ((newunit.IsHeirOf("CNoble")) && (Count(.player, "CLider3") > 0)){
			newunit.AddItem("Elite");		}
		if ((newunit.IsHeirOf("RTribune")) && (Count(.player, "RLider1") > 0)){
			if (rand(10)>8)
			newunit.AddItem("Leyenda");		}

		if (EnvReadString(.player, "Mercenary pact") == "researched") {
			if (newunit.IsHeirOf("CBerberAssassin")|| newunit.IsHeirOf("CJavelinThrower") || newunit.IsHeirOf("CLibyanFootman") || newunit.IsHeirOf("CMaceman") || 	newunit.IsHeirOf("CMERCENARIO") || newunit.IsHeirOf("CNumidianRider")) 
			newunit.AddItem("Veterano");            }

		if (!newunit.IsHeirOf("BaseMage") && !newunit.IsHeirOf("Lider") && !newunit.IsHeirOf("AttackAnimal") && (!newunit.HasItem("Guerrero")) && (!newunit.HasItem("Veterano")) && (!newunit.HasItem("Elite")) && (!newunit.HasItem("Campeon")) && (!newunit.HasItem("Leyenda"))){
			newunit.AddItem("Guerrero");		}

		if (newunit.IsHeirOf("BHighlander") || newunit.IsHeirOf("EHorusWarrior") || newunit.IsHeirOf("GWomanWarrior") || newunit.IsHeirOf("NVAEL") || newunit.IsHeirOf("TValkyrie") || newunit.IsHeirOf("RTribune") || newunit.IsHeirOf("Hipatista")){ 
			newunit.AddItem("Valeroso");            }

		if (EnvReadString(.settlement, "Valor legendario") == "researched"){
			newunit.AddItem("Valeroso");		}

		if ( ((Count(.player, "BLider1") > 0) || (Count(.player, "TLider1") > 0)) && (!newunit.HasItem("Valeroso")) && (!newunit.AsHero.IsValid) ){
			newunit.AddItem("Valeroso");		}

		if (newunit.IsHeirOf("Perro") || newunit.IsHeirOf("EAnubisWarrior") || newunit.IsHeirOf("NVAEL") || newunit.IsHeirOf("CWarElephant")){ 
			newunit.AddItem("Aterrador");            }

		if (newunit.IsHeirOf("GTridentWarrior") || newunit.IsHeirOf("EAnubisWarrior") || newunit.IsHeirOf("EHorusWarrior")){ 
			newunit.AddItem("Inmune a los espiritus");            }

		if (newunit.IsHeirOf("Melee2") || newunit.IsHeirOf("Melee3")){ 
			newunit.AddItem("Bonus contra caballeria");            }

		if (newunit.IsHeirOf("TEnchantress") || newunit.IsHeirOf("EPriest") || newunit.IsHeirOf("GTracio") || newunit.IsHeirOf("CNumidianRider") || newunit.IsHeirOf("Perro")){ 
			newunit.AddItem("Rastreo");            }

		if ( (.race == Egypt) && (Count(.player, "ELider3") > 0) && (newunit.HasItem("Guerrero"))){
			newunit.ExchangeItem(newunit.AsUnit.FindItem("Guerrero"), "Veterano");		}
		if ( (.race == Germany) && (Count(.player, "TLider3") > 0) && (newunit.HasItem("Guerrero"))){
			newunit.ExchangeItem(newunit.AsUnit.FindItem("Guerrero"), "Veterano");		}
		if ( (.race == Britain) && (Count(.player, "BLider2") > 0) && (newunit.HasItem("Guerrero"))){
			newunit.ExchangeItem(newunit.AsUnit.FindItem("Guerrero"), "Veterano");		}

		if (EnvReadString(.player, "Favoritos de Anubis") == "researched"){
			if (newunit.IsHeirOf("EAnubisWarrior"))
			newunit.AddItem("Bendicion de Anubis");		}

		if (EnvReadString(.player, "Favoritos de Horus") == "researched"){
			if (newunit.IsHeirOf("EHorusWarrior"))
			newunit.AddItem("Bendicion de Horus");		}

		if (EnvReadString(.settlement, "Culto de Moloch") == "researched"){
			if (newunit.IsHeirOf("CNoble"))
			newunit.AddItem("Ira de Moloch");		}



if ((!newunit.IsHeirOf("BaseMage")) && (!newunit.IsHeirOf("BaseAnimal")) && (!newunit.IsHeirOf("TaxCollector")))
  {	
	if (EnvReadInt(.settlement, "items/Bear teeth amulet") == 1)
		newunit.AddItem("Bear teeth amulet");
	if (EnvReadInt(.settlement, "items/Herb amulet of luck") == 1)
		newunit.AddItem("Herb amulet of luck");
	if (EnvReadInt(.settlement, "items/Belt of might") == 1)
		newunit.AddItem("Belt of might");
	if (EnvReadInt(.settlement, "items/Regalo de Jupiter") == 1)
		newunit.AddItem("Regalo de Jupiter");
	if (EnvReadInt(.settlement, "items/Regalo de Marte") == 1)
		newunit.AddItem("Regalo de Marte");
	if (EnvReadInt(.settlement, "items/Veteran Guild") == 1)
		newunit.AddItem("Veteran Guild");
	if (EnvReadInt(.settlement, "items/Amuleto de los caidos") == 1)
		newunit.AddItem("Amuleto de los caidos");
	if ((EnvReadInt(.settlement, "items/Bendicion de Thor") == 1) && (Count(.player, "BLider3") > 0))
		newunit.AddItem("Bendicion de Thor");
  }

		if (EnvReadString(.player, "Perros de caza") == "researched"){
			if (newunit.IsHeirOf("Perro"))
			newunit.SetSpecial(17, true);		}

		if (EnvReadString(.player, "Cruces de razas") == "researched"){
			if (newunit.IsHeirOf("Perro"))
			newunit.AddBonus(10,4,4,0,0);		}

		if (EnvReadString(.settlement, "Maestros herreros") == "researched")
			newunit.AddBonus(4,2,2,0,0);

		if ((Count(.player, "ELider2") > 0) || (Count(.player, "GLider4") > 0)){
			if (newunit.AsDruid.IsValid)
			newunit.SetSpecial(5, true);
								}
		if (Count(.player, "ELider1") > 0){
			if (newunit.IsHeirOf("EArcher") || newunit.IsHeirOf("ESwordsman"))
			newunit.SetLevel(level+6);
								}
		if (Count(.player, "GLider2") > 0){
			if (newunit.IsHeirOf("GWomanWarrior"))
			newunit.SetLevel(level+4);
								}
		if (Count(.player, "ILider2") > 0){
			if (newunit.IsHeirOf("IMilitiaman"))
			newunit.AddItem("Supervivencia");
			newunit.SetFeeding(false);
							}
		if (Count(.player, "ILider1") > 0){
			if (newunit.IsHeirOf("ISlinger"))
			newunit.SetVisible(false);
							}
		if (Count(.player, "ILider3") > 0){
			if (newunit.IsHeirOf("IEliteGuard")){
			newunit.SetSpecial(2, false);
			newunit.SetSpecial(8, true);
							}
						}
		if (Count(.player, "MLider1") > 0){
			if (newunit.IsHeirOf("RPraetorian") || newunit.IsHeirOf("RPrinciple") || newunit.IsHeirOf("RHastatus"))
			newunit.AddBonus(0,2,2,0,0);
								}
		if (Count(.player, "CLider4") > 0){
			if (newunit.IsHeirOf("CLibyanFootman"))
			newunit.SetSpecial(9, true);
								}
		if ( (Count(.player, "TLider4") > 0) && (newunit.IsHeirOf("TSwordsman")) ){
			newunit.AddItem("Carne");
			newunit.FindItem("Carne").SetUseCount(rand(25)+1);
								}
							

