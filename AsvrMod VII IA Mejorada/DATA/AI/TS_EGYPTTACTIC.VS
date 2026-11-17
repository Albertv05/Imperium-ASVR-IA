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

//pr("ETACTIC2");
if (EnvReadInt(set, "EgyptTactic") == 1) 
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
	aSkills[0] = hsSurvival;      aSkillLevels[0] = 10;
	aSkills[1] = hsVigor;         aSkillLevels[1] = 10;
	aSkills[2] = hsHealing;       aSkillLevels[2] = 10;
	aSkills[3] = hsQuickMarch;    aSkillLevels[3] = 10;
	aSkills[4] = hsRecovery;      aSkillLevels[4] = 10;

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
			bGladiatorShow = set.TSResearch("Cult of Horus");

		if (bGladiatorShow &&!bMilAcademy)
			bMilAcademy = set.TSResearch("Statue of Osiris, father of Horus");

		if (olSpies.count<nSpies)
		{
			ol.Clear();
			ol.AddList(set.TSRecruitArmy("ESwordsman",nSpies));
			ol.RemoveList(olSpies);		
			olSpies.AddList(ol);		
			olSpies.ClearDead();		
			SetNoAIFlag(olSpies, false);		
		}
		if (nIncPop<1 && set.gold>=1000)
		{
			set.TSResearch("BuySlaves");
			nIncPop+=1;
		}
		
		Sleep(5236 + rand(10)*100);
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
	
		Sleep(5236 + rand(10)*100);
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
	int nHastati = 8;
	while (olHastati.count<nHastati)
		{
			int nCount;
			nCount = nHastati - olHastati.count;
			olHastati.AddList(set.TSRecruitArmy("ESwordsman",nCount));
			Sleep(5236 + rand(10)*100);	
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
			bStandartization = set.TSResearch("Cult of Osiris");
		
		if (bStandartization && !bStandartization2)	
			bStandartization2 = set.TSResearch("Mumification");
		
		if (bStandartization && bStandartization2 &&!bFlexability)	
			bFlexability = set.TSResearch("EZombify");

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
			bArrows = set.TSResearch("Cult of Anubis");
			Sleep(5337 + rand(10)*100);
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
	int nArchers = 8;
	while (olArchers.count<nArchers)
		{
			int nCount;
			nCount = nArchers - olArchers.count;
			olArchers.AddList(set.TSRecruitArmy("EAnubisWarrior",nCount));
			Sleep(5236 + rand(10)*100);
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

EnvWriteInt(set, "EgyptTactic",1);


/*	
int  AIPlayer;
str  cmd;
int  i,gold,food;
ObjList olArchers,olGuardians, olAxetrowers;
int  nDonateFood, nDonateGold, nDonatePop, nBuildArmy, nResearch; // Variables for controlling AI
Hero hero;
bool bHero;
IntArray aSkills, aSkillLevels;
int heroScId;
bool bHeroSc = false;


if (EnvReadInt(set, "EgyptTactic") == 1) 
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
SetAIVar(AIPlayer, AIV_DonatePop,  0);
SetAIVar(AIPlayer, AIV_BuildArmy,  0);
SetAIVar(AIPlayer, AIV_Research,   0);

// SetSkills
	aSkills[0] = hsSurvival;      aSkillLevels[0] = 10;
	aSkills[1] = hsVigor;         aSkillLevels[1] = 10;
	aSkills[2] = hsHealing;       aSkillLevels[2] = 10;
	aSkills[3] = hsQuickMarch;    aSkillLevels[3] = 10;
	aSkills[4] = hsRecovery;      aSkillLevels[4] = 10;

// Buy slaves & hire a hero
// Train 3 Militiamen and send them to spy around the stronghold
{
	bool bBuySlaves = false;
	int i=0;
	cmd = "trainESwordsman";

	while (!hero.IsValid || !bBuySlaves || i<3)
	{
		if (!hero.IsValid)
			hero = set.TSRecruitHero();
		
		if (!bBuySlaves && set.gold>=1000)
			{
				set.TSResearch("BuySlaves");
				bBuySlaves = true;
			}
		if (i<3)
			{
				point ptDummy; Obj objDummy;
				Barrack barrack;
				barrack = set.BestBarrack(5);
				if (barrack.IsValid)
				if (GetCmdCost(cmd, gold, food))
				{
					set.SpentGoldOnArmy((gold + (food / 2)));
					barrack.ExecCmd(cmd, ptDummy, objDummy, false);
				}	
				i+=1;
			}			
		Sleep(5251 + rand(10)*100);	
	}	
}
if (EnvReadInt(set,"StopTacticScript") == 1)
{
	// set ai flag
	if (hero.IsValid)
		hero.SetNoAIFlag(false);
	//set vars
	SetAIVar(AIPlayer, AIV_DonateGold, nDonateGold); // Return variable to its value
	SetAIVar(AIPlayer, AIV_DonatePop,  nDonatePop); // Return variable to its value
	SetAIVar(AIPlayer, AIV_DonateFood, nDonateFood); // Return variable to its value
	SetAIVar(AIPlayer, AIV_BuildArmy,  nBuildArmy); // Return variable to its value
	SetAIVar(AIPlayer, AIV_Research,   nResearch); // Return variable to its value
	return;
}

	
if (hero.IsValid)
if(!bHeroSc)
	{
		ObjList ol;
		Obj oDummy;
		ol.Add(hero);
		hero.KillCommand();
		hero.TSAdvHeroSkills(aSkills, aSkillLevels);	
		heroScId = AIRun("TS_AttackAtWill.vs", set, ol,oDummy, 0);	
		bHeroSc = true;					
	}	
// Research Grain trade and Cult of Anubis
{
	bool bGrainTrade = false;
	bool bCultofAnubis = false;
	while (!bGrainTrade || !bCultofAnubis)
	{
		if (!bGrainTrade) 
			bGrainTrade = set.TSResearch("GrainTrade");
		if (!bCultofAnubis)
			bCultofAnubis = set.TSResearch("Cult of Anubis");
		if (EnvReadInt(set,"StopTacticScript") == 1)
		{
			// stop ai script
			if (bHeroSc)
				AIBreakScript(heroScId);
			// set ai flag
			if (hero.IsValid)
				hero.SetNoAIFlag(false);
			//set vars
			SetAIVar(AIPlayer, AIV_DonateGold, nDonateGold); // Return variable to its value
			SetAIVar(AIPlayer, AIV_DonatePop,  nDonatePop); // Return variable to its value
			SetAIVar(AIPlayer, AIV_DonateFood, nDonateFood); // Return variable to its value
			SetAIVar(AIPlayer, AIV_BuildArmy,  nBuildArmy); // Return variable to its value
			SetAIVar(AIPlayer, AIV_Research,   nResearch); // Return variable to its value
			return;
		}
		Sleep(7503 + rand(10)*100);	
	}
}
if (hero.IsAlive)
	hero.TSAdvHeroSkills(aSkills, aSkillLevels);	

// Research path of dead I && barrack level 1
{
	bool bPathofDeadI = false;
	bool bBarrackL1 = false;
	while (!bPathofDeadI || !bBarrackL1)
	{
		if (!bPathofDeadI) 
			bPathofDeadI = set.TSResearch("Path of the dead I");
		if (!bBarrackL1)
			bBarrackL1 = set.TSResearch("Barrack Level 1");
		if (EnvReadInt(set,"StopTacticScript") == 1)
		{
			// stop ai script
			if (bHeroSc)
				AIBreakScript(heroScId);
			// set ai flag
			if (hero.IsValid)
				hero.SetNoAIFlag(false);
			//set vars
			SetAIVar(AIPlayer, AIV_DonateGold, nDonateGold); // Return variable to its value
			SetAIVar(AIPlayer, AIV_DonatePop,  nDonatePop); // Return variable to its value
			SetAIVar(AIPlayer, AIV_DonateFood, nDonateFood); // Return variable to its value
			SetAIVar(AIPlayer, AIV_BuildArmy,  nBuildArmy); // Return variable to its value
			SetAIVar(AIPlayer, AIV_Research,   nResearch); // Return variable to its value
			return;
		}
		Sleep(5251 + rand(10)*100);	
	}
}
if (hero.IsAlive)
	hero.TSAdvHeroSkills(aSkills, aSkillLevels);	

// Research path of dead II  & Religious feast
{
	bool bPathofDeadII = false;
	bool bReligiousFeast = false;
	int nGuardians = 8;
	int nArchers   = 8;
	int nAxetrowers = 16;
	while (!bPathofDeadII || !bReligiousFeast)
	{
		if (!bPathofDeadII) 
			bPathofDeadII = set.TSResearch("Path of the dead II");

		if (!bReligiousFeast) 
			bReligiousFeast = set.TSResearch("ReligiousFeast");
		if (EnvReadInt(set,"StopTacticScript") == 1)
		{
			// stop ai script
			if (bHeroSc)
				AIBreakScript(heroScId);
			// set ai flag
			if (hero.IsValid)
				hero.SetNoAIFlag(false);
			//set vars
			SetAIVar(AIPlayer, AIV_DonateGold, nDonateGold); // Return variable to its value
			SetAIVar(AIPlayer, AIV_DonatePop,  nDonatePop); // Return variable to its value
			SetAIVar(AIPlayer, AIV_DonateFood, nDonateFood); // Return variable to its value
			SetAIVar(AIPlayer, AIV_BuildArmy,  nBuildArmy); // Return variable to its value
			SetAIVar(AIPlayer, AIV_Research,   nResearch); // Return variable to its value
			return;
		}
		Sleep(4251 + rand(10)*100);	
	}

if (hero.IsAlive)
	hero.TSAdvHeroSkills(aSkills, aSkillLevels);	
// train  6 Guardians, 6 Archers, 12 Axetrowers
	while (olGuardians.count<nGuardians || olArchers.count<nArchers || olAxetrowers.count<nAxetrowers)
	{
		int nCount;
		if (olGuardians.count<nGuardians)
		{
			nCount = nGuardians - olGuardians.count;
			olGuardians.AddList(set.TSRecruitArmy("EGuardian",nCount));	
		}
		
		if (olArchers.count<nArchers)
		{
			nCount = nArchers - olArchers.count;
			olArchers.AddList(set.TSRecruitArmy("EArcher",nCount));	
		}
		
		if (olAxetrowers.count<nAxetrowers)
		{
			nCount = nAxetrowers - olAxetrowers.count;
			olAxetrowers.AddList(set.TSRecruitArmy("EAxetrower",nCount));	
		}

		if (EnvReadInt(set,"StopTacticScript") == 1)
		{
			// stop ai script
			if (bHeroSc)
				AIBreakScript(heroScId);
			// set ai flag
			if (hero.IsValid)
				hero.SetNoAIFlag(false);
			olArchers.ClearDead();
			olGuardians.ClearDead();
			olAxetrowers.ClearDead();
			SetNoAIFlag(olArchers,false);
			SetNoAIFlag(olGuardians,false);
			SetNoAIFlag(olAxetrowers,false);
			//set vars
			SetAIVar(AIPlayer, AIV_DonateGold, nDonateGold); // Return variable to its value
			SetAIVar(AIPlayer, AIV_DonatePop,  nDonatePop); // Return variable to its value
			SetAIVar(AIPlayer, AIV_DonateFood, nDonateFood); // Return variable to its value
			SetAIVar(AIPlayer, AIV_BuildArmy,  nBuildArmy); // Return variable to its value
			SetAIVar(AIPlayer, AIV_Research,   nResearch); // Return variable to its value
			return;
		}
	
		Sleep(8250 + rand(10)*100);	
	}
}
//Give army to AI
if (bHeroSc)
	AIBreakScript(heroScId);
	
if (hero.IsValid)
if (hero.IsAlive)
{
	hero.TSAdvHeroSkills(aSkills, aSkillLevels);	
	hero.SetCommand("enter", set.GetCentralBuilding() );
	olArchers.SetCommand("attach", hero);
	olGuardians.SetCommand("attach", hero);
	olAxetrowers.SetCommand("attach", hero);
	hero.SetNoAIFlag(false);
}

olArchers.ClearDead();
olGuardians.ClearDead();
olAxetrowers.ClearDead();
SetNoAIFlag(olArchers,false);
SetNoAIFlag(olGuardians,false);
SetNoAIFlag(olAxetrowers,false);

// Allow AI to spend gold and build army
SetAIVar(AIPlayer, AIV_DonateGold, nDonateGold); // Return variable to its value
SetAIVar(AIPlayer, AIV_DonatePop,  nDonatePop); // Return variable to its value
SetAIVar(AIPlayer, AIV_DonateFood, nDonateFood); // Return variable to its value
SetAIVar(AIPlayer, AIV_BuildArmy,  nBuildArmy); // Return variable to its value

// Research path of dead III
{
	bool bPathofDeadIII = false;
	while (!bPathofDeadIII)
	{
		if (!bPathofDeadIII) 
			bPathofDeadIII = set.TSResearch("Path of the dead III");

		Sleep(5250 + rand(10)*100);	
	}
}

// Researches
{
	bool bCultOfHorus = false;
	bool bStOfOsiris = false;
	bool bStOfAmomRa = false;
	while(!bCultOfHorus || !bStOfOsiris || !bStOfAmomRa)
	{
		if (!bCultOfHorus)
			bCultOfHorus = set.TSResearch("Cult of Horus");
		if (!bStOfOsiris)
			bStOfOsiris = set.TSResearch("Statue of Osiris, father of Horus");
		if (!bStOfAmomRa)
			bStOfAmomRa = set.TSResearch("Statue of Amon-Ra");

		if (EnvReadInt(set,"StopTacticScript") == 1)
		{
			SetAIVar(AIPlayer, AIV_Research,   nResearch); // Return variable to its value
			return;
		}
		Sleep(7750 + rand(10)*100);	
	}
}

SetAIVar(AIPlayer, AIV_Research,   nResearch); // Return variable to its value

EnvWriteInt(set, "EgyptTactic",1);
*/
