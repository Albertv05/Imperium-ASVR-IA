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
if((u.IsAlive) && (!u.AsHero().IsValid()) && (!u.IsHeirOf("BaseAnimal")) && (.IsEnemy(u)))
{
.StartAnim(19, tgt.pos);
Sleep(.TimeToActionMoment);
Sleep(.TimeToAnimFinish);

if ((.level - tgt.AsUnit().level) < 10){
.StartAnim(19, tgt.pos);
Sleep(.TimeToActionMoment);
Sleep(.TimeToAnimFinish);}

if ((.level - tgt.AsUnit().level) < 8){
.StartAnim(19, tgt.pos);
Sleep(.TimeToActionMoment);
Sleep(.TimeToAnimFinish);}

if ((.level - tgt.AsUnit().level) < 6){
.StartAnim(19, tgt.pos);
Sleep(.TimeToActionMoment);
Sleep(.TimeToAnimFinish);}

if ((.level - tgt.AsUnit().level) < 4){
.StartAnim(19, tgt.pos);
Sleep(.TimeToActionMoment);
Sleep(.TimeToAnimFinish);}

if ((.level - tgt.AsUnit().level) < 2){
.StartAnim(19, tgt.pos);
Sleep(.TimeToActionMoment);
Sleep(.TimeToAnimFinish);}

if ((.level - tgt.AsUnit().level) <= 0){
.StartAnim(19, tgt.pos);
Sleep(.TimeToActionMoment);
Sleep(.TimeToAnimFinish);}

if ((tgt.AsUnit().level - .level) > 2){
.StartAnim(19, tgt.pos);
Sleep(.TimeToActionMoment);
Sleep(.TimeToAnimFinish);}

if ((tgt.AsUnit().level - .level) > 4){
.StartAnim(19, tgt.pos);
Sleep(.TimeToActionMoment);
Sleep(.TimeToAnimFinish);}

if ((tgt.AsUnit().level - .level) > 6){
.StartAnim(19, tgt.pos);
Sleep(.TimeToActionMoment);
Sleep(.TimeToAnimFinish);}

if ((tgt.AsUnit().level - .level) > 8){
.StartAnim(19, tgt.pos);
Sleep(.TimeToActionMoment);
Sleep(.TimeToAnimFinish);}

if ((tgt.AsUnit().level - .level) > 10){
.StartAnim(19, tgt.pos);
Sleep(.TimeToActionMoment);
Sleep(.TimeToAnimFinish);}



if((u.IsAlive) && (.IsAlive)){
CreateFeedback("Lightning", this);
PlaySound("SOUNDS/NOTIFICATIONS/POSESION.OGG");
u.SetPlayer(.player);
CreateFeedback("Lightning", u);
.Damage(THIS.health); // kill myself
}
}