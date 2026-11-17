// void, Obj THIS, Obj tgt

Unit u;
Druid this;
this = THIS.AsDruid;

u = tgt.AsUnit;

while(u.IsAlive)
{
	if(.InRange(u))
		break;						
	.GotoAttack(u, 5000, true, 0);
}
if(u.IsAlive){
.SetJupiterAngerTarget(u);
if(u.AsHero)
u.Damage(50);
else
u.Damage(300);
CreateFeedback("Lightning3", u);
.Damage(THIS.health);
}