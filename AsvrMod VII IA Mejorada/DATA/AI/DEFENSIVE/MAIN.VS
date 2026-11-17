// void

int i;
GAIKA g;

//AIRun('AIStupidBuilder.vs');
AIRun('Prioritize.vs' );
AIRun('Recruiter.vs' );
AIRun('GAIKAMonitor.vs' );
AIRun('SquadMonitor.vs');
AIRun('EconomyMonitor.vs');
AIRun('TacticMonitor.vs');

//if (rand(100)<25)
	SetAIVar(AIGetPlayer, AIV_MaxRPretorian, -1);
	SetAIVar(AIGetPlayer, AIV_MaxGWomanWarrior, -1);
	SetAIVar(AIGetPlayer, AIV_MaxRTribune, -1);
	SetAIVar(AIGetPlayer, AIV_MaxCNoble, -1);
	SetAIVar(AIGetPlayer, AIV_MaxIEliteGuard, -1);
	SetAIVar(AIGetPlayer, AIV_MaxBHighlander, -1);
	SetAIVar(AIGetPlayer, AIV_MaxEGuardian, -1);
	SetAIVar(AIGetPlayer, AIV_MaxTMaceman, -1);

Sleep(60000);
//Sleep(600000); Sleep(600000); // 20 min
while (1) {
	// Decide where to attack
	for (i = 1; i < GAIKACount(); i += 1)	{
		g = GetGAIKA(i);
		if (g.ControlledNeighbors(AIGetPlayer)>0)
			if (g.settlement.IsEnemy(AIGetPlayer)){
				//pr("main: gaika ");
				//if (rand(2)==1)
					g.SetControlFlag(AIGetPlayer, true);
			}
	}
	Sleep(300000); // 10 min
	if (GetTime()>=2000000 || AllyMilEval(AIGetPlayer)>2*EnemyMilEval(AIGetPlayer)) // 50 min - time to become aggressive
		for (i = 1; i < GAIKACount(); i += 1)	{
			g = GetGAIKA(i);
			if (g.settlement.IsStronghold)
				g.SetControlFlag(AIGetPlayer, true);
		}
}
