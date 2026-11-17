// void, Obj This, Obj target

Druid this;
Unit tgt;
bool bSleep = true;
int curse_stamina_cost;

this = This.AsDruid();
tgt = target.AsUnit();
if (tgt.IsHeirOf("RamUnit"))
	return;

curse_stamina_cost = GetCmdStaminaCost("robo");

while (1)
{
	if (!.IsAlive)      break;
	if (!tgt.IsAlive()) break;
	if (!.IsEnemy(tgt)) break;
	if (tgt.InHolder)   break;
	if (!.CanSee(tgt))  break;
	if (tgt.health <= 0) break;

	bSleep = false;
	if (!.InRange(tgt)) {
		.GotoAttack(tgt, 2000, false, 2500);
		continue;
	}
	if (.stamina < curse_stamina_cost) {
		Sleep(200);
		continue;
	}
	.SetLastAttackTime();
	if (!.IsVisible)
		.SetVisible(true);
	.StartAnim(17, tgt.pos);
	Sleep(.TimeToActionMoment());

	if (tgt.IsAlive())
	if (.IsEnemy(tgt))
	if (!tgt.InHolder)
	if (.CanSee(tgt))
	if (.stamina >= curse_stamina_cost)
	{
		.SetVisible(true); .SetLastAttackTime();
		.SetStamina(.stamina - curse_stamina_cost);
		tgt.Damage(30);
		CreateFeedback("Death_Magic2", tgt.pos);
		.Heal(15);
		CreateFeedback("Heal", this);
	}
	Sleep(.TimeToAnimFinish());
}

if (bSleep)
	Sleep(17); // otherwise can cycle: Advance->Curse->Advance->Curse...
