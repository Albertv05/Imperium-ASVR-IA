//void, Obj victim

Unit u;

if (rand(1000) > 250)
	return;

u = Place("AnubisGhost", victim.pos, owner.AsUnit.player);
u.StartAnim(17, u.pos);
u.SetStamina(10);
u.SetLevel(victim.AsUnit.level);
u.SetCommand("spawn");
SwapSelectedObj(victim, u);
CreateFeedback("Damage1", u);
