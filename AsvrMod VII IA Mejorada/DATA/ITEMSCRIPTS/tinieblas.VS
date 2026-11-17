//void, Obj attached

Unit u;

if (rand(1000) > 250)
	return;
if(attached.AsUnit.InHolder)
	return;

u = Place("AnubisGhost", attached.pos, attached.player);
u.StartAnim(17, u.pos);
u.SetStamina(10);
u.SetLevel(attached.AsUnit.level);
u.SetCommand("spawn");
SwapSelectedObj(attached, u);
CreateFeedback("Damage1", u);
