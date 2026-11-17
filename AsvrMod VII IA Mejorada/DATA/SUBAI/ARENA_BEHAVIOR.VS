//void, Obj This

Building this;
Unit newunit;
str class, groupname;
int number, maxnumber;
int level, i;
ObjList ol;
point ptExit, punto;
Query qGroup;

this = This.AsBuilding();

Sleep(rand(1000) + 500);

while(1)
{
	class = EnvReadString(this, "Build");
	groupname = EnvReadString(this, "BuildGroup");
	number = EnvReadInt(this, "Build/" + class);
	maxnumber = EnvReadInt(this, "Build/" + class + "maxnumber");
	qGroup = Group("Player" + .player + groupname);
	//.pr("left : " + number + " " + class + "; group :" + groupname);
	if(number == 0 || qGroup.GetObjList.count >= maxnumber)
	{

		if (class == "RLiberatus") {
			// update the best liberatus level for our player
			ObjList ol;
			int i, l, max_level;

			ol = qGroup.GetObjList();
			max_level = EnvReadInt(.player, "BestLiberatus");
			// find the max RLiberati level for the player
			for (i = 0; i < ol.count; i += 1) {
				l = ol[i].AsUnit().inherentlevel;
				if (l > max_level) max_level = l;
			}
			EnvWriteInt(.player, "BestLiberatus", max_level);
		}
		if (class == "TValkyrie") {
			// update the best valkirie level for our player
			ObjList ol;
			int i, l, max_level;

			ol = qGroup.GetObjList();
			max_level = EnvReadInt(.player, "BestValkyries");
			// find the max Valkirie level for the player
			for (i = 0; i < ol.count; i += 1) {
				l = ol[i].AsUnit().inherentlevel;
				if (l > max_level) max_level = l;
			}
			EnvWriteInt(.player, "BestValkyries", max_level);
		}
		Sleep(1000); // fastest barrack training is about 1820 delay
	}
	else
	{
		groupname = EnvReadString(this, "BuildGroup");

		ptExit = .GetExitPoint( .settlement.GetCentralBuilding.pos, false );
		level = EnvReadInt(.settlement, "levels/" + class);

		// Shrine of Thor implementation
		if (EnvReadString(.settlement, "Shrine of Thor") == "researched" && 
			class == "BVikingLord"
		) {
			if (EnvReadInt(.player, "BVikingLordLevel") > level)
				level = EnvReadInt(.player, "BVikingLordLevel");
			if (level < 24)
				{
					EnvWriteInt(.settlement, "levels/BVikingLord", level + 1);
					EnvWriteInt(.player, "BVikingLordLevel", level + 1);
				}	
		}


		// Shrine of Thor implementation
		if (EnvReadString(.settlement, "Shrine of Thor") == "researched" && 
			class == "BHorseman"
		) {
			if (EnvReadInt(.player, "BHorsemanLevel") > level)
				level = EnvReadInt(.player, "BHorsemanLevel");
			if (level < 12)
				{
					EnvWriteInt(.settlement, "levels/BHorseman", level + 1);
					EnvWriteInt(.player, "BHorsemanLevel", level + 1);
				}	
		}

		// Liberati guild implementation
		if (EnvReadString(.settlement, "Liberati guild") == "researched" && 
		  class == "RLiberatus" && number == 10
		) {
			level += 1;
			if (EnvReadInt(.player, "BestLiberatus") > level)
				level = EnvReadInt(.player, "BestLiberatus");
			EnvWriteInt(.settlement, "levels/RLiberatus", level);
		}

		// Legendary Valkyrie  implementation
		if (EnvReadString(.settlement, "Legendary Valkyries") == "researched" && 
		  class == "TValkyrie" && number == 5)
		{
			if (EnvReadInt(.player, "BestValkyries") > level)
				level = EnvReadInt(.player, "BestValkyries");
            level += 1; 
			EnvWriteInt(.settlement, "levels/TValkyrie", level);
		}
		
		// Mountaineers
		if(class == "IMountaineer" && EnvReadString(.player, "Mountain Clan Legacy") == "researched") {
			ObjList ol;
			int i, l, max_level;
			level = EnvReadInt(.player, "BestMountaineerLevel");
			ol = qGroup.GetObjList();
			for (i = 0; i < ol.count; i += 1) {
				l = ol[i].AsUnit().inherentlevel;
				if (l > level) level = l;
			}
		}


		// Standartization
		if (class != "Lider") {
			int l2;
			l2 = EnvReadInt(.player, "standard_spawn_level");
			if (l2 > level) level = l2;
		}

		// Mumificatiion
		if (.race==Egypt && EnvReadString(.settlement, "Mumification")=="researched")
  		{
		level = EnvReadInt(.player, "BestHeroLevel");
	
		ol = GetPlayerUnits(.player, "Hero");
		for (i=0; i<ol.count;i+=1)
		{
		  if (ol[i].IsValid())
			if (ol[i].AsHero().inherentlevel > level)
			  level = ol[i].AsHero().inherentlevel;
		}
		level = (2*level)/3;
		if (level<1)  level = 1;
  		}



		if (ptExit.x==-1 && ptExit.y==-1) 
		{
			if (class != "Lider"){
			newunit = Place(class, Point(0,0), this.player);}

			if (class == "Lider"){
			if (.race==Carthage){
			newunit = Place(GetRandomHeroClass("CLider", .player), Point(0,0), this.player);
			//PlaySound("SOUNDS/NOTIFICATIONS/NOMINATED LEADER CARTAGO.WAV");
						}
			if (.race==Britain){
			newunit = Place(GetRandomHeroClass("BLider", .player), Point(0,0), this.player);
		//PlaySound("SOUNDS/NOTIFICATIONS/NOMINATED LEADER.WAV");
						}
			if (.race==Germany){
			newunit = Place(GetRandomHeroClass("TLider", .player), Point(0,0), this.player);
		//PlaySound("SOUNDS/NOTIFICATIONS/NOMINATED LEADER.WAV");
						}
			if (.race==Gaul){
			newunit = Place(GetRandomHeroClass("GLider", .player), Point(0,0), this.player);
		//PlaySound("SOUNDS/NOTIFICATIONS/NOMINATED LEADER.WAV");
						}
			if (.race==Egypt){
			newunit = Place(GetRandomHeroClass("ELider", .player), Point(0,0), this.player);
		//PlaySound("SOUNDS/NOTIFICATIONS/NOMINATED LEADER EGIPTO.WAV");
						}
			if (.race==ImperialRome){
			newunit = Place(GetRandomHeroClass("MLider", .player), Point(0,0), this.player);
		//PlaySound("SOUNDS/NOTIFICATIONS/NOMINATED LEADER ROMA.WAV");
						}
			if (.race==RepublicanRome){
			newunit = Place(GetRandomHeroClass("RLider", .player), Point(0,0), this.player);
		//PlaySound("SOUNDS/NOTIFICATIONS/NOMINATED LEADER ROMA.WAV");
						}
			if (.race==Iberia){
			newunit = Place(GetRandomHeroClass("ILider", .player), Point(0,0), this.player);
		//PlaySound("SOUNDS/NOTIFICATIONS/NOMINATED LEADER.WAV");
						}
						}
			.settlement.AddUnit(newunit);
			newunit.AddToGroup("Player" + .player + groupname);
		} else 
	                {
			if (class != "Lider"){
	                newunit = Place(class, ptExit, this.player);}

			if (class == "Lider"){
			if (.race==Carthage){
			newunit = Place(GetRandomHeroClass("CLider", .player), ptExit, this.player);
		//PlaySound("SOUNDS/NOTIFICATIONS/NOMINATED LEADER CARTAGO.WAV");
						}
			if (.race==Britain){
			newunit = Place(GetRandomHeroClass("BLider", .player), ptExit, this.player);
		//PlaySound("SOUNDS/NOTIFICATIONS/NOMINATED LEADER.WAV");
						}
			if (.race==Germany){
			newunit = Place(GetRandomHeroClass("TLider", .player), ptExit, this.player);
		//PlaySound("SOUNDS/NOTIFICATIONS/NOMINATED LEADER.WAV");
						}
			if (.race==Gaul){
			newunit = Place(GetRandomHeroClass("GLider", .player), ptExit, this.player);
		//PlaySound("SOUNDS/NOTIFICATIONS/NOMINATED LEADER.WAV");
						}
			if (.race==Egypt){
			newunit = Place(GetRandomHeroClass("ELider", .player), ptExit, this.player);
		//PlaySound("SOUNDS/NOTIFICATIONS/NOMINATED LEADER EGIPTO.WAV");
						}
			if (.race==ImperialRome){
			newunit = Place(GetRandomHeroClass("MLider", .player), ptExit, this.player);
		//PlaySound("SOUNDS/NOTIFICATIONS/NOMINATED LEADER ROMA.WAV");
						}
			if (.race==RepublicanRome){
			newunit = Place(GetRandomHeroClass("RLider", .player), ptExit, this.player);
		//PlaySound("SOUNDS/NOTIFICATIONS/NOMINATED LEADER ROMA.WAV");
						}
			if (.race==Iberia){
			newunit = Place(GetRandomHeroClass("ILider", .player), ptExit, this.player);
		//PlaySound("SOUNDS/NOTIFICATIONS/NOMINATED LEADER.WAV");
						}
						}
                        if(newunit.IsValid){
			if(EnvReadInt(this, "Punto") == 0)
		        newunit.SetCommand("enter", .settlement.GetCentralBuilding);
			
			else{
			punto = Point(EnvReadInt(this, "X"), EnvReadInt(this, "Y"));
			newunit.SetCommand("move", punto);
			}
	                newunit.AddToGroup("Player" + .player + groupname);
                                }
	                }

		newunit.SetLevel(level);
		// Add item


		if (EnvReadString(.player, "Mercenary pact") == "researched") {
			if (newunit.IsHeirOf("CBerberAssassin")|| newunit.IsHeirOf("CJavelinThrower") || newunit.IsHeirOf("CLibyanFootman") || newunit.IsHeirOf("CMaceman") || 	newunit.IsHeirOf("CMERCENARIO") || newunit.IsHeirOf("CNumidianRider")) 
			newunit.AddItem("Veterano");            }

		if (EnvReadString(.player, "Teuton Master") == "researched"){
			if (newunit.IsHeirOf("TTeutonRider"))
			newunit.AddItem("Elite");		}


		if (!newunit.IsHeirOf("Lider") && !newunit.IsHeirOf("BaseMage") && !newunit.IsHeirOf("AttackAnimal") && (!newunit.HasItem("Guerrero")) && (!newunit.HasItem("Veterano")) && (!newunit.HasItem("Elite")) && (!newunit.HasItem("Campeon")) && (!newunit.HasItem("Leyenda"))){
			newunit.AddItem("Guerrero");		}

			if (newunit.IsHeirOf("BHighlander")|| newunit.IsHeirOf("EHorusWarrior") || newunit.IsHeirOf("GWomanWarrior") || newunit.IsHeirOf("NVAEL") || newunit.IsHeirOf("TValkyrie") || newunit.IsHeirOf("RTribune") || newunit.IsHeirOf("Hipatista")){ 
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

		if (newunit.IsHeirOf("GTracio") || newunit.IsHeirOf("IMountaineer")){ 
			newunit.AddItem("Supervivencia");            }

		if (newunit.IsHeirOf("IMountaineer") || newunit.IsHeirOf("THuntress")){ 
			newunit.AddItem("Emboscada");            }

		if (newunit.IsHeirOf("TEnchantress") || newunit.IsHeirOf("EPriest") || newunit.IsHeirOf("GTracio") || newunit.IsHeirOf("CNumidianRider") || newunit.IsHeirOf("Perro")){ 
			newunit.AddItem("Rastreo");            }

		if (EnvReadString(.player, "Guias hacia el Valhala") == "researched"){
			if (newunit.IsHeirOf("TValkyrie"))
			newunit.AddItem("Guia");		}

		if ( (.race == Egypt) && (Count(.player, "ELider3") > 0) && (newunit.HasItem("Guerrero"))){
			newunit.ExchangeItem(newunit.AsUnit.FindItem("Guerrero"), "Veterano");		}
		if ( (.race == Germany) && (Count(.player, "TLider3") > 0) && (newunit.HasItem("Guerrero"))){
			newunit.ExchangeItem(newunit.AsUnit.FindItem("Guerrero"), "Veterano");		}
		if ( (.race == Britain) && (Count(.player, "BLider2") > 0) && (newunit.HasItem("Guerrero"))){
			newunit.ExchangeItem(newunit.AsUnit.FindItem("Guerrero"), "Veterano");		}


		if (EnvReadString(.player, "Favoritos de Osiris") == "researched"){
			if (newunit.IsHeirOf("EChariot"))
			newunit.AddItem("Bendicion de Osiris");		}

		if (EnvReadString(.settlement, "Maestros herreros") == "researched")
			newunit.AddBonus(4,2,2,0,0);


		if (!newunit.IsHeirOf("BaseMage") && !newunit.IsHeirOf("Hero"))
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
			if (EnvReadInt(.settlement, "items/Bendicion de Thor") == 1)
				newunit.AddItem("Bendicion de Thor");
		  }
		


		EnvWriteInt(this, "Build/" + class, number-1);
		Sleep(1000);



	}
}
