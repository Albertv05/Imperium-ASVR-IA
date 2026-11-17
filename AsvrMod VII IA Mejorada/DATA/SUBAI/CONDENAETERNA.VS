// void, Obj THIS, Obj tgt

Unit u, u2;
Druid this;
this = THIS.AsDruid;

u = tgt.AsUnit;

while(u.IsAlive)
{
	if(.InRange(u))
		break;						
	.GotoAttack(u, 5000, true, 0);
}
if((u.IsAlive) && (!u.AsHero().IsValid()) && (!u.IsHeirOf("BaseAnimal")))
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

if ((.level - tgt.AsUnit().level) < 0){
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
PlaySound("SOUNDS/NOTIFICATIONS/CONDENAETERNA.OGG");
u2 = Place("Momia", tgt.pos, .player);
        if(u2.IsValid){
	u2.SetPlayer(.player);
       	u2.SetLevel(u.level);
        CreateFeedback("Lightning", u2);}
u.Damage(u.health);
.Damage(THIS.health); // kill myself
}
}


