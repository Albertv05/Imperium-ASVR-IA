// void, Settlement set

int AIPlayer, nRace;
str strTech = "", strTech2 = "";
int nMaxLevelTraining;

AIPlayer = set.player;
nRace = set.GetCentralBuilding.race;
nMaxLevelTraining = EnvReadInt(AIPlayer, "maxtrainlevel");

/// take care! some of the upgrades are per stronghold...other per player!

if (nRace == Gaul)
{
	strTech = "Fights";
	if (IsResearched(set, strTech))
	{
		if (nMaxLevelTraining < 12)
		{
			if (nMaxLevelTraining < 4)
				strTech = "Gaul Training 1";
			else if (nMaxLevelTraining < 8)
				strTech = "Gaul Training 2";
			else
				strTech = "Gaul Training 3";
		}
		else
		{
			strTech = "Warrior Tales";
			if (IsResearched(AIPlayer, strTech))
			{
				strTech = "Nordic trade routes";
				if (IsResearched(set, strTech))
					{
						strTech = "Belts of Might";
						if (IsResearched(set, strTech))
						strTech = "";
					}
			}	
		}	
	}		
}

if (nRace == RepublicanRome)
{
	strTech = "RGladiator Shows";
	if (IsResearched(set, strTech))
	{
		if (nMaxLevelTraining < 8)
		{
			if (IsResearched(set, strTech))
				if (nMaxLevelTraining < 4)
					strTech = "Rome Training 1";
				else
					strTech = "Rome Training 2";
		
		}
		else 
		{
			strTech = "Veteran Offence";
			if (IsResearched(AIPlayer, strTech))
			{
				strTech = "Veteran Defence";
				if (IsResearched(AIPlayer, strTech))
					{
						strTech = "Veteran Health";
						if (IsResearched(AIPlayer, strTech))
							strTech = "";
					}
			}	
		}
	}
}

if (nRace == ImperialRome)
{
	strTech = "MGladiator Shows";
	if (IsResearched(set, strTech))	{
		strTech = "Standartization I";
		if (IsResearched(set, strTech))	{
			strTech = "Standartization II";
			if (IsResearched(set, strTech))	{
				strTech = "Flexibility";
				if (IsResearched(set, strTech))
					strTech = "";
			}
		}
	}
}

// paralel research
if (nRace == ImperialRome || nRace == RepublicanRome)
if (strTech == "" || set.gold > AIVar(AIPlayer, AIV_SquanderGoldAmount))
if (!IsResearched(set, "Import horses"))
{
	strTech2 = "Free Wine";
	if (IsResearched(set, strTech2))
		strTech2 = "Import horses";
	if (strTech == "") strTech = strTech2;
	else {
		EnvWriteString(set, "strTech", strTech2);
		set.AIRun("ESH_NeedTech.vs");
	}
}

if (nRace == Carthage)
{
	strTech = "People's Assembly";
	if (IsResearched(set, strTech)) {
		strTech = "Shared Strength";
		if (IsResearched(set, strTech)) {
			strTech = "Shared Triumph";
			if (IsResearched(set, strTech))
				strTech = "";
		}
	}
	
}

if (nRace == Iberia)
{
	strTech = "Warriors' Wisdom";
	if (IsResearched(AIPlayer, strTech)) {
		strTech = "Ancestral Knowledge";
		if (IsResearched(set, strTech)) {
			strTech = "";
			if (set.gold >= AIVar(AIPlayer, AIV_ExcessGold))
			if (!IsResearched(set, "Nobility"))
				strTech = "Nobility"; // arena also could research this
		} else {
			strTech2 = "Code of Valor";
			if (!IsResearched(set, strTech2))
				strTech = strTech2;
		}
	}
	else
	{
		strTech2 = "Tournaments";
		if (!IsResearched(set, strTech2))
			strTech = strTech2;
		else {
			strTech2 = "Heroes' Wisdom";
			if (!IsResearched(AIPlayer, strTech2))
				strTech = strTech2;
		}
	}
}

if (nRace == Britain)
{
	strTech = "Britain Fights";
	if (IsResearched(set, strTech))
	{
		strTech = "BNobility";
		if (IsResearched(AIPlayer, strTech))
		{
			strTech = "Noble Offence";
			if (IsResearched(AIPlayer, strTech))
			{
				strTech = "Noble Defence";		
				if (IsResearched(AIPlayer, strTech))
					strTech = "";
			}
		}		
	}
	if (strTech=="") // Gamblings from Tavern
	{
		strTech = "Gambling";
		if (IsResearched(set, strTech))
		{
			strTech = "Gambler's Day";
			if (IsResearched(AIPlayer, strTech))
			{
				strTech = "Gambler's Test";
				if (IsResearched(AIPlayer, strTech))
				{
					strTech = "Gambler's Luck";
					if (IsResearched(AIPlayer, strTech))
						strTech = "";
				}
			}
		}
		
	}
}

if (nRace == Germany)
{
	strTech = "TFights";
	if (IsResearched(set, strTech))
	{
		strTech = "Learning";
		if (IsResearched(AIPlayer, strTech))
		{
			strTech = "Attack focus";		
			if (IsResearched(AIPlayer, strTech))
				strTech = "";		
		}		
	}
}

if (nRace == Egypt)
{
	strTech = "Cult of Horus";
	if (IsResearched(set, strTech))
	{
		strTech = "Favoritos de Horus";
		if (IsResearched(AIPlayer, strTech))
		{
		strTech = "Light of Horus I";
		if (IsResearched(set, strTech))
		{	
			strTech = "Light of Horus II";		
			if (IsResearched(set, strTech))
			{
				strTech = "Light of Horus III";		
				if (IsResearched(set, strTech))
					strTech = "";					
		  }		
		}
		}	
	}
	if (strTech == "")
	{
		strTech = "Cult of Anubis";
		if (IsResearched(set, strTech))
		{
		strTech = "Favoritos de Anubis";
		if (IsResearched(AIPlayer, strTech))
		{
			strTech = "Path of the dead I";
			if (IsResearched(AIPlayer, strTech))
			{	
				strTech = "Path of the dead II";		
				if (IsResearched(AIPlayer, strTech))
				{
					strTech = "Path of the dead III";		
					if (IsResearched(AIPlayer, strTech))
						strTech = "";					
			  }		
			}	
		}
		}
	}	
	if (strTech == "")
	{
		strTech = "Statue of Isis, mother of Anubis";
		if (IsResearched(AIPlayer, strTech))
		{
			strTech = "Statue of Osiris, father of Horus";
			if (IsResearched(AIPlayer, strTech))
			{
				strTech = "Statue of Amon-Ra";
				if (IsResearched(AIPlayer, strTech))
					strTech = "";			
			}
		}
	}
}

if (strTech == "")
	EnvWriteInt(set, "ResearchTrainingComplete", 1);
else
	EnvWriteInt(set, "ResearchTrainingComplete", 0);

if (nRace == ImperialRome)
if (strTech == "") 
if (!IsResearched(set, "Military Academy"))
if ((rand(30) == 0 && nMaxLevelTraining >= 8) || set.gold >= AIVar(AIPlayer, AIV_ExcessGold))
	strTech = "Military Academy";

if (nRace == ImperialRome || nRace == RepublicanRome)
if (strTech == "") 
if ((rand(10) == 0) || set.gold >= 3000)
{
if (!IsResearched(set, "Ascensos I"))
	strTech = "Ascensos I";
}

if (nRace == ImperialRome)
if (strTech == "") 
if ((rand(10) == 0) || set.gold >= 5000)
{
if (!IsResearched(set, "Ascensos II"))
	strTech = "Ascensos II";
}

if (nRace == RepublicanRome)
if (strTech == "") 
if ((rand(10) == 0) || set.gold >= 5000)
{
if (!IsResearched(set, "Libertad"))
	strTech = "Libertad";
}

if (nRace == Carthage)
if (strTech == "") 
if (rand(30) == 0)
if (!IsResearched(set, "Ferocity"))
	strTech = "Ferocity";


if (nRace == Carthage)
if (strTech == "") 
if ((set.gold > 2000) && (IsResearched(set, "Sacred Legion")))
{
if (!IsResearched(set, "Culto de Moloch"))
	strTech = "Culto de Moloch";
}

if (nRace == ImperialRome)
if (strTech == "") 
if (rand(30) == 0)
if (!IsResearched(set, "God's Gift2"))
	strTech = "God's Gift2";

if (nRace == RepublicanRome)
if (strTech == "") 
if (rand(30) == 0)
if (!IsResearched(set, "God's Gift"))
	strTech = "God's Gift";

if (nRace == Iberia)
if (strTech == "") 
if ((rand(30) == 0) || set.gold >= AIVar(AIPlayer, AIV_ExcessGold))
if (!IsResearched(set, "Maestros herreros"))
	strTech = "Maestros herreros";

if (nRace == Britain)
if (strTech == "") 
if ((set.gold > 2500) && (IsResearched(set, "Britain Fights")))
{
if (!IsResearched(set, "Tradicion arquera"))
	strTech = "Tradicion arquera";
}

if (nRace == Egypt)
if (strTech == "") 
if (rand(20) <= (EnvReadInt(AIPlayer, "BestHeroLevel") / 5) || set.gold > AIVar(AIPlayer, AIV_SquanderGoldAmount))
{
	if (!IsResearched(set, "Mumification"))
		strTech = "Mumification";
}


if (nRace == ImperialRome)
if (strTech == "") 
if ((set.gold > 10000) && (IsResearched(set, "MGladiator Shows")))
{
if (!IsResearched(set, "Elegir pretor"))
	strTech = "Elegir pretor";
}

if (nRace == ImperialRome)
if (strTech == "") 
if ((set.gold > 2000) && (IsResearched(set, "Elegir pretor")))
{
if (!IsResearched(set, "Reclutar MLider"))
	strTech = "Reclutar MLider";
}

if (nRace == RepublicanRome)
if (strTech == "") 
if ((set.gold > 10000) && (IsResearched(set, "RGladiator Shows")))
{
if (!IsResearched(set, "Elegir consul"))
	strTech = "Elegir consul";
}

if (nRace == RepublicanRome)
if (strTech == "") 
if ((set.gold > 2000) && (IsResearched(set, "Elegir consul")))
{
if (!IsResearched(set, "Reclutar RLider"))
	strTech = "Reclutar RLider";
}

if (nRace == Germany)
if (strTech == "") 
if ((set.gold > 10000) && (IsResearched(set, "TFights")))
{
if (!IsResearched(set, "Elegir caudillo"))
	strTech = "Elegir caudillo";
}

if (nRace == Germany)
if (strTech == "") 
if ((set.gold > 2000) && (IsResearched(set, "Elegir caudillo")))
{
if (!IsResearched(set, "Reclutar TLider"))
	strTech = "Reclutar TLider";
}

if (nRace == Egypt)
if (strTech == "") 
if ((set.gold > 10000) && (IsResearched(set, "Cult of Osiris")))
{
if (!IsResearched(set, "Elegido del faraon"))
	strTech = "Elegido del faraon";
}

if (nRace == Egypt)
if (strTech == "") 
if ((set.gold > 2000) && (IsResearched(set, "Elegido del faraon")))
{
if (!IsResearched(set, "Reclutar ELider"))
	strTech = "Reclutar ELider";
}

if (nRace == Gaul)
if (strTech == "") 
if ((set.gold > 10000) && (IsResearched(set, "Fights")))
{
if (!IsResearched(set, "Elegir lider"))
	strTech = "Elegir lider";
}

if (nRace == Gaul)
if (strTech == "") 
if ((set.gold > 2000) && (IsResearched(set, "Elegir lider")))
{
if (!IsResearched(set, "Reclutar GLider"))
	strTech = "Reclutar GLider";
}

if (nRace == Iberia)
if (strTech == "") 
if ((set.gold > 10000) && (IsResearched(set, "Tournaments")))
{
if (!IsResearched(set, "Elegir rey2"))
	strTech = "Elegir rey2";
}

if (nRace == Iberia)
if (strTech == "") 
if ((set.gold > 2000) && (IsResearched(set, "Elegir rey2")))
{
if (!IsResearched(set, "Reclutar ILider"))
	strTech = "Reclutar ILider";
}

if (nRace == Britain)
if (strTech == "") 
if ((set.gold > 10000) && (IsResearched(set, "Britain Fights")))
{
if (!IsResearched(set, "Elegir rey"))
	strTech = "Elegir rey";
}

if (nRace == Britain)
if (strTech == "") 
if ((set.gold > 2000) && (IsResearched(set, "Elegir rey")))
{
if (!IsResearched(set, "Reclutar BLider"))
	strTech = "Reclutar BLider";
}

if (nRace == Carthage)
if (strTech == "") 
if ((set.gold > 10000) && (IsResearched(set, "People's Assembly")))
{
if (!IsResearched(set, "Elegir general supremo"))
	strTech = "Elegir general supremo";
}

if (nRace == Carthage)
if (strTech == "") 
if ((set.gold > 2000) && (IsResearched(set, "Elegir general supremo")))
{
if (!IsResearched(set, "Reclutar CLider"))
	strTech = "Reclutar CLider";
}

if (nRace == Carthage)
if (strTech == "") 
if ((set.gold > 2000) && (IsResearched(set, "People's Assembly")))
{
if (!IsResearched(set, "Generales"))
	strTech = "Generales";
}

if (nRace == Carthage)
if (strTech == "") 
if ((set.gold > 4000) && (IsResearched(set, "Generales")))
{
if (!IsResearched(set, "Elegidos de Cartago"))
	strTech = "Elegidos de Cartago";
}



if (nRace == Carthage)
if (strTech == "") 
if ((set.gold > 2000) && (IsResearched(set, "Free Trade")))
{
if (!IsResearched(set, "Hachas del sur"))
	strTech = "Hachas del sur";
}

if (nRace == Carthage)
if (strTech == "") 
if ((set.gold > 1500) && (IsResearched(set, "Hachas del sur")))
{
if (!IsResearched(set, "Verdugos del desierto"))
	strTech = "Verdugos del desierto";
}

if (nRace == Carthage)
if (strTech == "") 
if ((set.gold > 2000) && (IsResearched(set, "Hachas del sur")) && Count(set.player, "CMERCENARIO") <= 40)
{
if (!IsResearched(set, "Reclutar grupo de mercenarios"))
	strTech = "Reclutar grupo de mercenarios";
}

if (nRace == Iberia)
if (strTech == "") 
if ((set.gold > 4000) && (IsResearched(set, "Free Drinks")))
{
if (!IsResearched(set, "Hermandad"))
	strTech = "Hermandad";
}

if (nRace == Iberia)
if (strTech == "") 
if ((set.gold > 4000) && (IsResearched(set, "Hermandad")))
{
if (!IsResearched(set, "Irreductibles"))
	strTech = "Irreductibles";
}

if (nRace == Iberia)
if (strTech == "") 
if ((set.gold > 500) && (IsResearched(set, "Hermandad")) && Count(set.player, "GTracio") <= 19)
{
if (!IsResearched(set, "Reclutar guerrero aquitano"))
	strTech = "Reclutar guerrero aquitano";
}

if (nRace == Egypt)
if (strTech == "") 
if ((set.gold > 3000) && (IsResearched(set, "Grain Trade")))
{
if (!IsResearched(set, "Hijos de Persia"))
	strTech = "Hijos de Persia";
}

if (nRace == Egypt)
if (strTech == "") 
if ((set.gold > 2000) && (IsResearched(set, "Hijos de Persia")))
{
if (!IsResearched(set, "Elegidos de Persia"))
	strTech = "Elegidos de Persia";
}

if (nRace == Egypt)
if (strTech == "") 
if ((set.gold > 4000) && (IsResearched(set, "Hijos de Persia")) && Count(set.player, "PINMORTAL") <= 20)
{
if (!IsResearched(set, "Reclutar grupo de Inmortales"))
	strTech = "Reclutar grupo de Inmortales";
}

if (nRace == Germany)
if (strTech == "") 
if ((set.gold > 4000) && (IsResearched(set, "Ritual Chamber")))
{
if (!IsResearched(set, "Alucinogenos"))
	strTech = "Alucinogenos";
}

if (nRace == Germany)
if (strTech == "") 
if ((set.gold > 1000) && (IsResearched(set, "Alucinogenos")))
{
if (!IsResearched(set, "Furia salvaje"))
	strTech = "Furia salvaje";
}

if (nRace == Germany)
if (strTech == "") 
if ((set.food > 500) && (IsResearched(set, "Alucinogenos")) && Count(set.player, "NVAEL") <= 29)
{
if (!IsResearched(set, "Reclutar berserkers"))
	strTech = "Reclutar berserkers";
}


if (nRace == Gaul)
if (strTech == "") 
if ((set.gold > 2000) && (IsResearched(set, "Ritual Chamber")))
{
if (!IsResearched(set, "Consejo de ancianos"))
	strTech = "Consejo de ancianos";
}

if (nRace == Gaul)
if (strTech == "") 
if ((set.gold > 1000) && (IsResearched(set, "Consejo de ancianos")))
{
if (!IsResearched(set, "Grandes sabios"))
	strTech = "Grandes sabios";
}

if (nRace == Gaul)
if (strTech == "") 
if ((set.gold > 800) && (IsResearched(set, "Consejo de ancianos")) && Count(set.player, "GAncientDruid") <= 9)
{
if (!IsResearched(set, "Convocar alto druida"))
	strTech = "Convocar alto druida";
}

if (nRace == Britain)
if (strTech == "") 
if ((set.gold > 4000) && (IsResearched(set, "Fights")))
{
if (!IsResearched(set, "Hermandad del norte"))
	strTech = "Hermandad del norte";
}

if (nRace == Britain)
if (strTech == "") 
if ((set.gold > 4000) && (IsResearched(set, "Hermandad del norte")) && Count(set.player, "BHorseman") <= 20)
{
if (!IsResearched(set, "Reclutar grupo de jinetes normandos"))
	strTech = "Reclutar grupo de jinetes normandos";
}

if (nRace == ImperialRome)
if (strTech == "") 
if (set.gold > 2500)
{
if (!IsResearched(set, "Hijos de Grecia"))
	strTech = "Hijos de Grecia";
}

if (nRace == ImperialRome)
if (strTech == "") 
if ((set.gold > 1500) && (IsResearched(set, "Hijos de Grecia")))
{
if (!IsResearched(set, "Veteranos"))
	strTech = "Veteranos";
}

if (nRace == ImperialRome)
if (strTech == "") 
if ((set.gold > 2000) && (IsResearched(set, "Hijos de Grecia")) && Count(set.player, "Hipatista") <= 30)
{
if (!IsResearched(set, "Reclutar grupo de hipatistas"))
	strTech = "Reclutar grupo de hipatistas";
}

if (nRace == RepublicanRome)
if (strTech == "") 
if (set.gold > 2500)
{
if (!IsResearched(set, "Escudos macedonios"))
	strTech = "Escudos macedonios";
}

if (nRace == RepublicanRome)
if (strTech == "") 
if ((set.gold > 1500) && (IsResearched(set, "Escudos macedonios")))
{
if (!IsResearched(set, "Herederos de Alejandro"))
	strTech = "Herederos de Alejandro";
}

if (nRace == RepublicanRome)
if (strTech == "") 
if ((set.gold > 2000) && (IsResearched(set, "Escudos macedonios")) && Count(set.player, "EHOPLITA") <= 30)
{
if (!IsResearched(set, "Reclutar grupo de hoplitas"))
	strTech = "Reclutar grupo de hoplitas";
}


if ((nRace == RepublicanRome) || (nRace == ImperialRome))
if (strTech == "") 
if ((set.gold > 1000) && (IsResearched(set, "Free Wine")))
{
if (!IsResearched(set, "Cria de perros3"))
	strTech = "Cria de perros3";
}

if ((nRace == RepublicanRome) || (nRace == ImperialRome))
if (strTech == "") 
if ((set.gold > 1000) && (IsResearched(set, "Cria de perros3")))
{
if (!IsResearched(set, "Cruces de razas"))
	strTech = "Cruces de razas";
}

if (nRace == Britain)
if (strTech == "") 
if ((set.gold > 1000) && (IsResearched(set, "Gambling")))
{
if (!IsResearched(set, "Cria de perros1"))
	strTech = "Cria de perros1";
}

if (nRace == Britain)
if (strTech == "") 
if ((set.gold > 1000) && (IsResearched(set, "Cria de perros1")))
{
if (!IsResearched(set, "Adiestramiento experto"))
	strTech = "Adiestramiento experto";
}

if (nRace == Gaul)
if (strTech == "") 
if ((set.gold > 1000) && (IsResearched(set, "Free Beer")))
{
if (!IsResearched(set, "Cria de perros2"))
	strTech = "Cria de perros2";
}

if (nRace == Gaul)
if (strTech == "") 
if ((set.gold > 1000) && (IsResearched(set, "Cria de perros2")))
{
if (!IsResearched(set, "Perros de caza"))
	strTech = "Perros de caza";
}

if ((nRace == RepublicanRome) || (nRace == ImperialRome))
if (strTech == "") 
if ((IsResearched(set, "Cria de perros3")) && rand(3) == 0)
{
if (!IsResearched(set, "Reclutar perro de guerra"))
	strTech = "Reclutar perro de guerra";
}

if (nRace == Britain)
if (strTech == "") 
if ((IsResearched(set, "Cria de perros1")) && rand(3) == 0)
{
if (!IsResearched(set, "Reclutar perro de guerra"))
	strTech = "Reclutar perro de guerra";
}

if (nRace == Gaul)
if (strTech == "") 
if ((IsResearched(set, "Cria de perros2")) && rand(3) == 0)
{
if (!IsResearched(set, "Reclutar perro de guerra"))
	strTech = "Reclutar perro de guerra";
}

	
if (nRace == Egypt)
if (strTech == "") 
if (rand(20) == 0 || set.gold > AIVar(AIPlayer, AIV_SquanderGoldAmount))
{
	ObjList l;
	int i,j, nCount;
	Unit u;
	Building b;
	StrArray asItems, asTech;
	
	asItems[0] = "Talisman de Seth";
	asItems[1] = "Talisman de Neit";
	asItems[2] = "Talisman de Thot";
	asItems[3] = "Talisman de Ra";
	asItems[4] = "Talisman de Anubis";
	asItems[5] = "Talisman de Isis";
	asItems[6] = "Talisman de Sobek";
	asItems[7] = "Talisman de Ptah";

	asTech[0] = "Charm of Seth";
	asTech[1] = "Charm of Thoth";
	asTech[2] = "Charm of Ra";
	asTech[3] = "Charm of Isis";
	asTech[4] = "Talisman de Anubis";
	asTech[5] = "Talisman de Isis";
	asTech[6] = "Talisman de Sobek";
	asTech[7] = "Talisman de Ptah";
	
	j = rand(8);
	b = set.GetCentralBuilding;
	l = set.ObjectsAround("Military");
	nCount = 0;
	for (i = l.count; i > 0;) 
	{
		i -= 1;
		u = l[i].AsUnit();
		if (b.IsEnemy(u)) continue;
		if (u.AsHero().IsValid) continue;
		if (u.IsSentry) continue;
		if (u.HasItem(asItems[j])) continue;
		nCount += 1;
	}
	
	if (nCount > 30)
		strTech = asTech[j];
}

if (nRace == Gaul)
if (strTech == "") 
if (rand(20) == 0 || set.population >= set.max_population)
{
	ObjList l;
	int i,j, nCount;
	Unit u;
	Building b;
	StrArray asItems, asTech;
	
	asItems[0] = "Favor de Taranis";
	asItems[1] = "Favor de Teutates";
	asItems[2] = "Favor de Esus";

	asTech[0] = "Sacrificio a Taranis";
	asTech[1] = "Sacrificio a Teutates";
	asTech[2] = "Sacrificio a Esus";
	
	j = rand(3);
	b = set.GetCentralBuilding;
	l = set.ObjectsAround("Military");
	nCount = 0;
	for (i = l.count; i > 0;) 
	{
		i -= 1;
		u = l[i].AsUnit();
		if (b.IsEnemy(u)) continue;
		if (u.AsHero().IsValid) continue;
		if (u.IsSentry) continue;
		if (u.HasItem(asItems[j])) continue;
		nCount += 1;
	}
	
	if (nCount > 30)
		strTech = asTech[j];
}

/// test whether it happens!!!
if (set.gold > 8000)
if (strTech == "") 
{
	ObjList l;
	Unit u;
	Building b;
	int i, nCount, nMinToRes = 40;

	b = set.GetCentralBuilding;
	l = set.ObjectsAround("Unit");
	nCount = 0;
	for (i = l.count; i > 0;)
	{
		i -= 1;
		u = l[i].AsUnit();
		if (b.IsEnemy(u)) continue;
		if (u.IsSentry) continue;
		if (u.IsPeaceful) continue;
		if (u.inherentlevel >= 10) continue;
		nCount += 1;
		if (nCount > nMinToRes) {
			strTech = "townhall_military_training";
			break;
		}
	}
}

if (strTech != "")
{
	EnvWriteString(set, "strTech", strTech);
	set.AIRun("ESH_NeedTech.vs");
	return;
}
