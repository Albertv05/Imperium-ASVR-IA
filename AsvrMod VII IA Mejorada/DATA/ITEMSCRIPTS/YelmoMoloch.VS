ObjList ol;

int i, radio, damage;


if (!owner.AsHero().IsValid()) return;
if (owner.health < 10) return;
if (owner.pos.Dist(target)>500) return;
damage = (owner.AsHero.health*9/10);
radio= (100+owner.AsHero.health*9/100);

CreateFeedback("Fire", target, 1000);
ol = ObjsInCircle(target, radio, cUnit).GetObjList();
  if(ol.count == 0) return;
  for(i=0;i<ol.count;i+=1){
if ((ol[i].AsUnit().IsValid) && (!ol[i].AsUnit()==owner.AsHero)) {
ol[i].AsUnit().Damage(damage - ol[i].pos.Dist(target)*5);
CreateFeedback("Fire", ol[i].AsUnit);
}
  }
PlaySound("SOUNDS/NOTIFICATIONS/VULCANO.OGG");
owner.AsHero().Damage(damage);