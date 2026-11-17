// void, Settlement set

int  AIPlayer;
str  cmd;
int  i,gold,food;
ObjList olHastati,olArchers,olPriests, olPrinciples,olSpies;

int  nDonateFood, nDonateGold, nDonatePop, nBuildArmy, nResearch; // Variables for controlling AI
Hero hero;
IntArray aSkills, aSkillLevels;
bool bAssUnderFire;
int heroScId;
bool bHeroSc = false;

//pr("ITACTIC2");
if (EnvReadInt(set, "IberiaTactic") == 1) 
	return;

if (EnvReadInt(set,"StopTacticScript") == 1)
	return;

bAssUnderFire	 = false;

AIPlayer = set.player;
// Read variables
nDonateFood = AIVar(AIPlayer, AIV_DonateFood);
nDonateGold = AIVar(AIPlayer, AIV_DonateGold);
nDonatePop  = AIVar(AIPlayer, AIV_DonatePop);
nBuildArmy  = AIVar(AIPlayer, AIV_BuildArmy);
nResearch   = AIVar(AIPlayer, AIV_Research);
// Set new values to disable 
//SetAIVar(AIPlayer, AIV_DonateFood, 0);
SetAIVar(AIPlayer, AIV_DonateGold, 0);
SetAIVar(AIPlayer, AIV_DonatePop,  0);
SetAIVar(AIPlayer, AIV_BuildArmy,  0);
SetAIVar(AIPlayer, AIV_Research,   0);

// Set skills
	aSkills[0] = hsEuphoria;      aSkillLevels[0] = 10;
	aSkills[1] = hsTeamDefense;   aSkillLevels[1] = 10;
	aSkills[2] = hsHealing;       aSkillLevels[2] = 10;
	aSkills[3] = hsEpicEndurance; aSkillLevels[3] = 10;
	aSkills[4] = hsCeasefire;     aSkillLevels[4] = 10;

// gladiator shows & 4 hastati & inc pop & military accademy
{
	ObjList ol;
	bool bGladiatorShow = false;
	bool bMilAcademy    = false;
	int nSpies  = 4;
	int nIncPop = 0;
	while (!bGladiatorShow || olSpies.count<nSpies || nIncPop<1 || !bMilAcademy)
	{
		//pr("Britain Fights");
		if (!bGladiatorShow)	
			bGladiatorShow = set.TSResearch("Tournaments");

		if (bGladiatorShow &&!bMilAcademy)
			bMilAcademy = set.TSResearch("Heroes' Wisdom");

		if (olSpies.count<nSpies)
		{
			ol.Clear();
			ol.AddList(set.TSRecruitArmy("IMilitiaman",nSpies));
			ol.RemoveList(olSpies);		
			olSpies.AddList(ol);		
			olSpies.ClearDead();		
			SetNoAIFlag(olSpies, false);		
		}
		if (nIncPop<1 && set.gold>=600)
		{
			set.TSResearch("IAddPop");
			nIncPop+=1;
		}
		
		Sleep(5472 + rand(10)*100);
	}
}

if (EnvReadInt(set,"StopTacticScript") == 1)
{
	// set AI vars	
	SetAIVar(AIPlayer, AIV_DonateGold, nDonateGold); // Return variable to its value
	SetAIVar(AIPlayer, AIV_DonatePop,  nDonatePop); // Return variable to its value
	SetAIVar(AIPlayer, AIV_DonateFood, nDonateFood); // Return variable to its value
	SetAIVar(AIPlayer, AIV_BuildArmy,  nBuildArmy); // Return variable to its value
	SetAIVar(AIPlayer, AIV_Research,   nResearch); // Return variable to its value
	return;
}

//barrack level 1 & hero
{
	bool bBarrack1 = false;
	while (!bBarrack1 || !hero.IsValid())
	{
		//pr("barrack level 1 & hero");
		if (!bBarrack1)
			bBarrack1 = set.TSResearch("Barrack Level 1");
		if (!hero.IsValid())
			hero = set.TSRecruitHero();
	
		Sleep(3472 + rand(10)*100);
	}
}
if (EnvReadInt(set,"StopTacticScript") == 1)
{
	// give army to AI
	hero.SetNoAIFlag(false);
	// set AI vars	
	SetAIVar(AIPlayer, AIV_DonateGold, nDonateGold); // Return variable to its value
	SetAIVar(AIPlayer, AIV_DonatePop,  nDonatePop); // Return variable to its value
	SetAIVar(AIPlayer, AIV_DonateFood, nDonateFood); // Return variable to its value
	SetAIVar(AIPlayer, AIV_BuildArmy,  nBuildArmy); // Return variable to its value
	SetAIVar(AIPlayer, AIV_Research,   nResearch); // Return variable to its value
	return;
}

if (hero.IsValid())
if(!bHeroSc)
{
	ObjList ol;
	Obj oDummy;
	ol.Add(hero);
	hero.KillCommand();
	hero.TSAdvHeroSkills(aSkills, aSkillLevels);	
	heroScId = AIRun("TS_AttackAtWill.vs", set, ol,oDummy, 0);	
	bHeroSc = true;	
	//pr("attackatwill1");
}	
else
	hero.TSAdvHeroSkills(aSkills, aSkillLevels);	

// 30 more hastati
{
	int nHastati = 7;
	while (olHastati.count<nHastati)
		{
			int nCount;
			nCount = nHastati - olHastati.count;
			olHastati.AddList(set.TSRecruitArmy("IMilitiaman",nCount));
			Sleep(5472 + rand(10)*100);	
			//pr("30 more bswordsman");
		}
}
if (EnvReadInt(set,"StopTacticScript") == 1)
{
	// Break script
	if (bHeroSc)
		AIBreakScript(heroScId);
	// give army to AI
	hero.SetNoAIFlag(false);
	olHastati.ClearDead();
	SetNoAIFlag(olHastati, false);
	// set AI vars	
	SetAIVar(AIPlayer, AIV_DonateGold, nDonateGold); // Return variable to its value
	SetAIVar(AIPlayer, AIV_DonatePop,  nDonatePop); // Return variable to its value
	SetAIVar(AIPlayer, AIV_DonateFood, nDonateFood); // Return variable to its value
	SetAIVar(AIPlayer, AIV_BuildArmy,  nBuildArmy); // Return variable to its value
	SetAIVar(AIPlayer, AIV_Research,   nResearch); // Return variable to its value
	return;
}

// attach to hero attack outposts
if (hero.IsValid() )
if (hero.IsAlive)
{
	ObjList ol;
	Obj oDummy;

	if (bHeroSc)
	  AIBreakScript(heroScId);
	hero.TSAdvHeroSkills(aSkills, aSkillLevels);	
	hero.SetCommand("enter", set.GetCentralBuilding() );
	olHastati.ClearDead();
	olHastati.SetCommand("attach", hero);
	ol.Add(hero);
	heroScId = AIRun("TS_AttackAtWill.vs", set, ol,oDummy, 0);
	//pr("attackatwill2");
}

//standartization 1, standartization 2, felxibility
{
	bool bStandartization = false;
	bool bStandartization2 = false;
	bool bFlexability = false;
	while (!bStandartization || !bStandartization2 || !bFlexability)
	{
		if (!bStandartization)	
			bStandartization = set.TSResearch("Nobility");
		
		if (bStandartization && !bStandartization2)	
			bStandartization2 = set.TSResearch("Warriors' Wisdom");
		
		if (bStandartization && bStandartization2 &&!bFlexability)	
			bFlexability = set.TSResearch("Mountain Clan");

		if (EnvReadInt(set,"StopTacticScript") == 1)
		{
			// Break script
			if (bHeroSc)
				AIBreakScript(heroScId);
			// give army to AI
			hero.SetNoAIFlag(false);
			olHastati.ClearDead();
			SetNoAIFlag(olHastati, false);
			// set AI vars	
			SetAIVar(AIPlayer, AIV_DonateGold, nDonateGold); // Return variable to its value
			SetAIVar(AIPlayer, AIV_DonatePop,  nDonatePop); // Return variable to its value
			SetAIVar(AIPlayer, AIV_DonateFood, nDonateFood); // Return variable to its value
			SetAIVar(AIPlayer, AIV_BuildArmy,  nBuildArmy); // Return variable to its value
			SetAIVar(AIPlayer, AIV_Research,   nResearch); // Return variable to its value
			return;
		}
		Sleep(5335 + rand(10)*100);
		//pr("Gambling");
	}
}

if (hero.IsValid())
if (hero.IsAlive)
	hero.TSAdvHeroSkills(aSkills, aSkillLevels);	

// Arrows
{
	bool bArrows = false;
	while (!bArrows)
		{
			bArrows = set.TSResearch("Slings");
			Sleep(7675 + rand(10)*100);
			//pr("Javelins");
		}
}

SetAIVar(AIPlayer, AIV_Research,   nResearch); // Return variable to its value

if (EnvReadInt(set,"StopTacticScript") == 1)
{
	// Break script
	if (bHeroSc)
		AIBreakScript(heroScId);
	// give army to AI
	hero.SetNoAIFlag(false);
	olHastati.ClearDead();
	SetNoAIFlag(olHastati, false);
	// set AI vars	
	SetAIVar(AIPlayer, AIV_DonateGold, nDonateGold); // Return variable to its value
	SetAIVar(AIPlayer, AIV_DonatePop,  nDonatePop); // Return variable to its value
	SetAIVar(AIPlayer, AIV_DonateFood, nDonateFood); // Return variable to its value
	SetAIVar(AIPlayer, AIV_BuildArmy,  nBuildArmy); // Return variable to its value
	SetAIVar(AIPlayer, AIV_Research,   nResearch); // Return variable to its value
	return;
}

if (hero.IsValid())
if (hero.IsAlive)
	hero.TSAdvHeroSkills(aSkills, aSkillLevels);	

// 20 archers
{
	int nArchers = 7;
	while (olArchers.count<nArchers)
		{
			int nCount;
			nCount = nArchers - olArchers.count;
			olArchers.AddList(set.TSRecruitArmy("ISlinger",nCount));
			Sleep(4472 + rand(10)*100);
			//pr("BJavelineer");
		}
}
if (hero.IsValid())
if (hero.IsAlive)
	hero.TSAdvHeroSkills(aSkills, aSkillLevels);	


// Give army to AI
if (bHeroSc)
	AIBreakScript(heroScId);

if (hero.IsValid)
if (hero.IsAlive)
{
	hero.TSAdvHeroSkills(aSkills, aSkillLevels);	
	hero.SetCommand("enter", set.GetCentralBuilding() );
	hero.SetNoAIFlag(false);
}

olArchers.ClearDead();
olHastati.ClearDead();
SetNoAIFlag(olArchers,false);
SetNoAIFlag(olHastati,false);

SetAIVar(AIPlayer, AIV_DonateGold, nDonateGold); // Return variable to its value
SetAIVar(AIPlayer, AIV_DonatePop,  nDonatePop); // Return variable to its value
SetAIVar(AIPlayer, AIV_DonateFood, nDonateFood); // Return variable to its value
SetAIVar(AIPlayer, AIV_BuildArmy,  nBuildArmy); // Return variable to its value

EnvWriteInt(set, "IberiaTactic",1);
/*
int  AIPlayer;
str  cmd;
int  i;
int  nDonateFood, nDonateGold, nDonatePop, nBuildArmy, nResearch; // Variables for controlling AI
Hero hero;
Unit enchantress;
bool bHero, bEnchantress;
IntArray aSkills, aSkillLevels;
ObjList olMountaineers,olEnchantress;
int heroScId;
bool bHeroScStart = false;

if (EnvReadInt(set, "InitialTactic2") == 1) 
	return;

if (EnvReadInt(set,"StopTacticScript") == 1)
	return;


AIPlayer = set.player;
// Read variables
nDonateFood = AIVar(AIPlayer, AIV_DonateFood);
nDonateGold = AIVar(AIPlayer, AIV_DonateGold);
nDonatePop  = AIVar(AIPlayer, AIV_DonatePop);
nBuildArmy  = AIVar(AIPlayer, AIV_BuildArmy);
nResearch   = AIVar(AIPlayer, AIV_Research);
// Set new values to disable 
SetAIVar(AIPlayer, AIV_DonateFood, 0);
SetAIVar(AIPlayer, AIV_DonateGold, 0);
//SetAIVar(AIPlayer, AIV_DonatePop,  0);
SetAIVar(AIPlayer, AIV_BuildArmy,  0);
SetAIVar(AIPlayer, AIV_Research,   0);

aSkills[0] = hsEuphoria;      aSkillLevels[0] = 10;
aSkills[1] = hsTeamDefense;   aSkillLevels[1] = 10;
aSkills[2] = hsHealing;       aSkillLevels[2] = 10;
aSkills[3] = hsEpicEndurance; aSkillLevels[3] = 10;
aSkills[4] = hsCeasefire;     aSkillLevels[4] = 10;

Sleep(rand(2345));
// Upgrade "Free Drinks".
set.TSResearch("Free Drinks");

// Hire a hero and a couple of Enchantresses 
{
	point ptExit;
	
  ptExit.Set(0,0);
	ptExit.SetLen(set.GetCentralBuilding.radius + 100);
	ptExit = ptExit + set.GetCentralBuilding.pos;

	while (!hero.IsValid() || !enchantress.IsValid)
	{
		if (!hero.IsValid())
			{
				hero = set.TSRecruitHero();
				if (hero.IsValid)
					hero.SetCommand("move", ptExit);
			}
		if (!enchantress.IsValid)
		{
			int nCount;
			nCount =2-olEnchantress.count;
			olEnchantress.AddList(set.TSTempleRecruit(nCount));
			if (olEnchantress.count >0) 
			if (olEnchantress[0].IsValid())
				enchantress = olEnchantress[0];
		}
		Sleep(5234 + rand(20)*100);
	}

	if (hero.IsValid)
	if (enchantress.IsValid)
	{
		if (hero.pos!=ptExit)
			hero.SetCommand("move", ptExit);
		Sleep(500 + rand(24)*100);
		if (hero.IsValid)
		if (hero.pos.x!=-1 && hero.pos.y!=-1)
			enchantress.SetCommand("move", hero.pos); 
		hero.AddCommand(false,"stand_position"); 
		enchantress.AddCommand(false, "teach", hero);
	}
}

// When researched 'Free Drinks' sell 1000 food
{
	bool bFreeDrinks = false;
	while (!bFreeDrinks || set.food<1000 )
		{
			bFreeDrinks = set.TSResearch("Free Drinks");
			Sleep(5023 + rand(20)*100);			
		}
}	
// If food supplies are more than 1000 then sell 1000 food again. 
if (set.food>1000)
	set.TSResearch("Sell food");	
// Allow AI to use food
SetAIVar(AIPlayer, AIV_DonateFood, nDonateFood); // Return variable to its value

if (EnvReadInt(set,"StopTacticScript") == 1)
{
	SetAIVar(AIPlayer, AIV_DonateGold, nDonateGold); // Return variable to its value
	SetAIVar(AIPlayer, AIV_DonatePop,  nDonatePop); // Return variable to its value
	SetAIVar(AIPlayer, AIV_BuildArmy,  nBuildArmy); // Return variable to its value
	SetAIVar(AIPlayer, AIV_Research,  nResearch); // Return variable to its value
	
	if (!hero.IsDead)
		hero.SetNoAIFlag(false);
	if (!enchantress.IsDead)
		enchantress.SetNoAIFlag(false);
	
	olEnchantress.ClearDead();
	SetNoAIFlag(olEnchantress,false);
	return;
}

// Research Tournaments and start  hireing mountaineesrs
{
	ObjList ol,olSpies;
	int nCount = 7;
	
	set.TSResearch("Tournaments");
	while (olSpies.count<3) // Research 3 mountaineers and send them to spy
	{
		Sleep(5234 + rand(20)*100);
		set.TSResearch("Tournaments");
		ol.Clear();
		ol.AddList(set.TSArenaRecruit(3));
		ol.RemoveList(olSpies);		
		olSpies.AddList(ol);		
		olSpies.ClearDead();		
		SetNoAIFlag(olSpies, false);
		
		
		if (hero.IsValid)
		if (!bHeroScStart)
		{
			ObjList ol;
			Obj oDummy;
			ol.Add(hero);
			hero.KillCommand();			
			hero.TSAdvHeroSkills(aSkills, aSkillLevels);	
			heroScId = AIRun("TS_AttackAtWill.vs", set, ol,oDummy, 0);	
			bHeroScStart = true;
		}
		
		while (set.food>1000)
			set.TSResearch("Sell food");	
	}
	
	if (EnvReadInt(set,"StopTacticScript") == 1)
	{
		AIBreakScript(heroScId);
		SetAIVar(AIPlayer, AIV_DonateGold, nDonateGold); // Return variable to its value
		SetAIVar(AIPlayer, AIV_DonatePop,  nDonatePop); // Return variable to its value
		SetAIVar(AIPlayer, AIV_BuildArmy,  nBuildArmy); // Return variable to its value
		SetAIVar(AIPlayer, AIV_Research,  nResearch); // Return variable to its value
		
		if (!hero.IsDead)
			hero.SetNoAIFlag(false);
		if (!enchantress.IsDead)
			enchantress.SetNoAIFlag(false);
		
		olEnchantress.ClearDead();
		SetNoAIFlag(olEnchantress,false);
		return;
	}
	while (olMountaineers.count < nCount) // Research 7 mountaineers
	{
		int nNeeded;
		nNeeded = nCount - olMountaineers.count;		
		olMountaineers.AddList(set.TSArenaRecruit(nNeeded));
		olMountaineers.RemoveList(olSpies);
		olSpies.ClearDead();		
		SetNoAIFlag(olSpies, false);
		while (set.food>1000)
			set.TSResearch("Sell food");	
		Sleep(5234 +rand(20)*100);
	}
	
}
if (EnvReadInt(set,"StopTacticScript") == 1)
{
	AIBreakScript(heroScId);
	SetAIVar(AIPlayer, AIV_DonateGold, nDonateGold); // Return variable to its value
	SetAIVar(AIPlayer, AIV_DonatePop,  nDonatePop); // Return variable to its value
	SetAIVar(AIPlayer, AIV_BuildArmy,  nBuildArmy); // Return variable to its value
	SetAIVar(AIPlayer, AIV_Research,  nResearch); // Return variable to its value
	
	if (!hero.IsDead)
		hero.SetNoAIFlag(false);
	if (!enchantress.IsDead)
		enchantress.SetNoAIFlag(false);
	
	olEnchantress.ClearDead();
	olMountaineers.ClearDead();
	SetNoAIFlag(olEnchantress,false);
	SetNoAIFlag(olMountaineers,false);
	return;
}
// Research 8 more enchantress
{
	int nCount = 10;
	while (olEnchantress.count < nCount) // Research 7 mountaineers
	{
		int nNeeded;
		
		nNeeded = nCount - olEnchantress.count;
		olEnchantress.AddList(set.TSTempleRecruit(nNeeded));
		while (set.food>1000)
			set.TSResearch("Sell food");	

		Sleep(5234 + rand(20)*100);			
	}
}
if (EnvReadInt(set,"StopTacticScript") == 1)
{
	AIBreakScript(heroScId);
	SetAIVar(AIPlayer, AIV_DonateGold, nDonateGold); // Return variable to its value
	SetAIVar(AIPlayer, AIV_DonatePop,  nDonatePop); // Return variable to its value
	SetAIVar(AIPlayer, AIV_BuildArmy,  nBuildArmy); // Return variable to its value
	SetAIVar(AIPlayer, AIV_Research,  nResearch); // Return variable to its value
	
	if (!hero.IsDead)
		hero.SetNoAIFlag(false);
	if (!enchantress.IsDead)
		enchantress.SetNoAIFlag(false);
	
	olEnchantress.ClearDead();
	olMountaineers.ClearDead();
	SetNoAIFlag(olEnchantress,false);
	SetNoAIFlag(olMountaineers,false);
	return;
}
// Set townhall to auto-teach
set.Research("autotrain_start_i");

// Research Code of Valor & Mountain Clan
{
	bool bCodeofValor,bMountainClan;
	bCodeofValor = false;
	bMountainClan = false;
	while(!bCodeofValor || !bMountainClan)
	{
		if (!bCodeofValor)
			bCodeofValor = set.TSResearch("Code of Valor");
		if (!bMountainClan )
			bMountainClan = set.TSResearch("Mountain Clan");
		while (set.food>1000)
			set.TSResearch("Sell food");	
		if (hero.IsValid)
		if (!hero.IsDead)
			hero.TSAdvHeroSkills(aSkills, aSkillLevels);	
		if (EnvReadInt(set,"StopTacticScript") == 1)
		{
			AIBreakScript(heroScId);
			SetAIVar(AIPlayer, AIV_DonateGold, nDonateGold); // Return variable to its value
			SetAIVar(AIPlayer, AIV_DonatePop,  nDonatePop); // Return variable to its value
			SetAIVar(AIPlayer, AIV_BuildArmy,  nBuildArmy); // Return variable to its value
			SetAIVar(AIPlayer, AIV_Research,  nResearch); // Return variable to its value
			
			if (!hero.IsDead)
				hero.SetNoAIFlag(false);
			if (!enchantress.IsDead)
				enchantress.SetNoAIFlag(false);
			
			olEnchantress.ClearDead();
			olMountaineers.ClearDead();
			SetNoAIFlag(olEnchantress,false);
			SetNoAIFlag(olMountaineers,false);
			return;
		}
		Sleep(5234 + rand(20)*100);			
	}
}
// Research Mountain Clan Legacy & Ancestral Knowladge
{
	bool bAncKnowledge,bMountainClanLegacy;
	bAncKnowledge = false;
	bMountainClanLegacy = false;
	while(!bAncKnowledge || !bMountainClanLegacy)
	{
		if (!bAncKnowledge)
			bAncKnowledge = set.TSResearch("Ancestral Knowledge");
		else
		{
			if (hero.IsValid)
			if (!hero.IsDead)
			hero.TSAdvHeroSkills(aSkills, aSkillLevels);	
		}

		if (!bMountainClanLegacy )
			bMountainClanLegacy = set.TSResearch("Mountain Clan Legacy");
		while (set.food>1000)
			set.TSResearch("Sell food");	
		if (EnvReadInt(set,"StopTacticScript") == 1)
		{
			AIBreakScript(heroScId);
			SetAIVar(AIPlayer, AIV_DonateGold, nDonateGold); // Return variable to its value
			SetAIVar(AIPlayer, AIV_DonatePop,  nDonatePop); // Return variable to its value
			SetAIVar(AIPlayer, AIV_BuildArmy,  nBuildArmy); // Return variable to its value
			SetAIVar(AIPlayer, AIV_Research,  nResearch); // Return variable to its value
			
			if (!hero.IsDead)
				hero.SetNoAIFlag(false);
			if (!enchantress.IsDead)
				enchantress.SetNoAIFlag(false);
			
			olEnchantress.ClearDead();
			olMountaineers.ClearDead();
			SetNoAIFlag(olEnchantress,false);
			SetNoAIFlag(olMountaineers,false);
			return;
		}
		Sleep(5234 +rand(20)*100);			
	}
}
AIBreakScript(heroScId);
if (hero.IsValid)
if (hero.IsAlive)
{
	hero.TSAdvHeroSkills(aSkills, aSkillLevels);	
	hero.SetCommand("enter", set.GetCentralBuilding());
}
// Train 10 more Mountaineers
{
	int nCount = 20;
	while (olMountaineers.count < nCount && Count(AIPlayer, "IMountaineer")<nCount) 
	{
		int nNeeded;
		
		nNeeded = nCount - olMountaineers.count;
		olMountaineers.AddList(set.TSArenaRecruit(nNeeded));
		
		while (set.food>1000)
			set.TSResearch("Sell food");				
		if (hero.IsValid)
		if (!hero.IsDead)
			hero.TSAdvHeroSkills(aSkills, aSkillLevels);	
		if (EnvReadInt(set,"StopTacticScript") == 1)
		{
			SetAIVar(AIPlayer, AIV_DonateGold, nDonateGold); // Return variable to its value
			SetAIVar(AIPlayer, AIV_DonatePop,  nDonatePop); // Return variable to its value
			SetAIVar(AIPlayer, AIV_BuildArmy,  nBuildArmy); // Return variable to its value
			SetAIVar(AIPlayer, AIV_Research,  nResearch); // Return variable to its value
			
			if (!hero.IsDead)
				hero.SetNoAIFlag(false);
			if (!enchantress.IsDead)
				enchantress.SetNoAIFlag(false);
			
			olEnchantress.ClearDead();
			olMountaineers.ClearDead();
			SetNoAIFlag(olEnchantress,false);
			SetNoAIFlag(olMountaineers,false);
			return;
		}
		Sleep(5234 +rand(20)*100);			
	}
}

// Train Barack Level 1 and Spears
{
	bool bBarrack1,bSpears;
	bBarrack1 = false;
	bSpears = false;
	while(! bBarrack1 || !bSpears)
	{
		if (! bBarrack1)
			 bBarrack1 = set.TSResearch("Barrack Level 1");
		if (!bSpears )
			bSpears = set.TSResearch("Spears");
		if (EnvReadInt(set,"StopTacticScript") == 1)
		{
			SetAIVar(AIPlayer, AIV_DonateGold, nDonateGold); // Return variable to its value
			SetAIVar(AIPlayer, AIV_DonatePop,  nDonatePop); // Return variable to its value
			SetAIVar(AIPlayer, AIV_BuildArmy,  nBuildArmy); // Return variable to its value
			SetAIVar(AIPlayer, AIV_Research,  nResearch); // Return variable to its value
			
			if (!hero.IsDead)
				hero.SetNoAIFlag(false);
			if (!enchantress.IsDead)
				enchantress.SetNoAIFlag(false);
			
			olEnchantress.ClearDead();
			olMountaineers.ClearDead();
			SetNoAIFlag(olEnchantress,false);
			SetNoAIFlag(olMountaineers,false);
			return;
		}
		Sleep(5234 + rand(20)*100);			
	}
}

// Allow AI to spend gold and build army
SetAIVar(AIPlayer, AIV_DonateGold, nDonateGold); // Return variable to its value
SetAIVar(AIPlayer, AIV_DonatePop,  nDonatePop); // Return variable to its value
SetAIVar(AIPlayer, AIV_BuildArmy,  nBuildArmy); // Return variable to its value
SetAIVar(AIPlayer, AIV_Research,  nResearch); // Return variable to its value

if (!hero.IsDead)
	hero.SetNoAIFlag(false);
if (!enchantress.IsDead)
	enchantress.SetNoAIFlag(false);

olEnchantress.ClearDead();
olMountaineers.ClearDead();
SetNoAIFlag(olEnchantress,false);
SetNoAIFlag(olMountaineers,false);

EnvWriteInt(set, "InitialTactic2",1);
*/