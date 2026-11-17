// void, GAIKA g, int AIPlayer
SquadList SL;
Squad sqFarest, sqNearest;
int nMinDist = 100000, nMaxDist = 0;
int tolerance = 160; // allowed delta distance (in pixels)
int own, ally, enemy, enemy_hidden, nMinNeed, coming = 0;
bool bWait;

g.GetSquads(SL, AI_COMING, AIPlayer, AI_OWN + AI_ALLY); if (SL.EOL) { EnvWriteInt(AIPlayer, "SynchStart" + g.ID, 0); return; } // IA Plus: nobody coming, reset the wait timer

// check whether to wait at all
if (SL.Size == 1) bWait = false;
else  {
  g.Eval(AI_STAYING, AIPlayer, own, ally, enemy, enemy_hidden);
  nMinNeed = g.MinNeed(AIPlayer, own, ally, enemy);
  bWait = (own + ally < nMinNeed);
}
//if(bWait)
	//pr(bWait);
// stop waiting if not necessary
if (!bWait) {
  SL.Lock;
  for (SL.Rewind; !SL.EOL; SL.Next)
    if (SL.Cur.State == SS_ApproachWait) if (SL.Cur.Player == AIPlayer)
      SL.Cur.SendTo(g, 100);
  SL.Unlock;
  return;
}

// find nearest and farest squad and count military eval
for (SL.Rewind; !SL.EOL; SL.Next) {
  Squad sq;
	int nDist; 

  sq = SL.Cur; if (sq.TestFlags(SF_PEACEFUL)) continue;
	if (sq.TestFlags(SF_NOAI)) continue;
  coming += sq.Eval;
  if (sq.GAIKAIn.LSA != g.LSA) continue;
  // if (sq.State != SS_Approach && sq.State != SS_ApproachWait) continue;
  nDist = sq.pos.Dist(g.Center);
  if (nDist < nMinDist) { nMinDist = nDist; sqNearest = sq; }
  if (nDist > nMaxDist) { nMaxDist = nDist; sqFarest = sq; }
}

// second check: don't wait if nearest squads will do it
if (own + ally + coming >= nMinNeed) {
  int nClose = 0;
 
  for (SL.Rewind; !SL.EOL; SL.Next) {
    Squad sq;
    int nDist;
    sq = SL.Cur; if (sq.TestFlags(SF_PEACEFUL)) continue;
		if (sq.TestFlags(SF_NOAI)) continue;
/*
    if (sq.Player != AIPlayer) continue;
    if (sq.State != SS_Approach && sq.State != SS_ApproachWait) continue;
*/
    if (sq.GAIKAIn.LSA != g.LSA) continue;
    nDist = sq.pos.Dist(g.Center);
    if (nDist > nMinDist + tolerance) continue;
    nClose += sq.Eval;
    if (own + ally + nClose >= nMinNeed) { bWait = false; break; }
  }
} else // don't wait if all squads won't do it anyway :)
  bWait = false;

// stop waiting if not necessary (second check)
if (!bWait) {
  SL.Lock;
  for (SL.Rewind; !SL.EOL; SL.Next)
    if (SL.Cur.State == SS_ApproachWait) if (SL.Cur.Player == AIPlayer)
      SL.Cur.SendTo(g, 100);
  SL.Unlock;
  return;
}

// IA Plus: never wait more than 30 s for stragglers (an army stuck in a jam stopped everybody)
{
  int nSynchStart;
  nSynchStart = EnvReadInt(AIPlayer, "SynchStart" + g.ID);
  if (nSynchStart == 0)
    EnvWriteInt(AIPlayer, "SynchStart" + g.ID, GetTime);
  else
    if (GetTime - nSynchStart > 30000)
      bWait = false;
}
if (!bWait) {
  SL.Lock;
  for (SL.Rewind; !SL.EOL; SL.Next)
    if (SL.Cur.State == SS_ApproachWait) if (SL.Cur.Player == AIPlayer)
      SL.Cur.SendTo(g, 100);
  SL.Unlock;
  return;
}

// command squads
SL.Lock;
for (SL.Rewind; !SL.EOL; SL.Next) {
  Squad sq;
  int nDist;
  int state; 

  sq = SL.Cur;
  if (sq.Player != AIPlayer) continue;
  if (sq.State != SS_Approach && sq.State != SS_ApproachWait) continue;
  if (sq.GAIKAIn.LSA != g.LSA) continue;
  nDist = sq.pos.Dist(g.Center);

  if (nDist > nMinDist + tolerance) state = SS_Approach;
  else if (nDist + tolerance < nMaxDist) state = SS_ApproachWait;
  else state = SS_Approach;

  if (sq.State == state) continue;

  if (state == SS_Approach) sq.SendTo(g, 100);
  else sq.ClrCmd(SS_ApproachWait, 0, SF_ADVCHOOSER);
}
SL.Unlock;
