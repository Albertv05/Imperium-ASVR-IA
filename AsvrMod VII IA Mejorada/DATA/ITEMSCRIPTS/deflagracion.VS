ObjList ol;

int i, radio, damage;
Unit this;
this = owner.AsDruid();

if (!owner.AsDruid().IsValid()) return;

damage = (200+owner.AsDruid.level*10);
radio= (200+owner.AsDruid.level*10);

PlaySound("SOUNDS/NOTIFICATIONS/VULCANO.OGG");

ol = ObjsInCircle(.pos, radio, cUnit).GetObjList();
  if(ol.count == 0) return;
  for(i=0;i<ol.count;i+=1){
if ((ol[i].AsUnit().IsValid) && (!ol[i].AsUnit()==.AsDruid)) {
ol[i].AsUnit().Damage(damage - ol[i].pos.Dist(.pos));
CreateFeedback("Fire", ol[i].AsUnit);
}
  }

.RemoveItem("Hechizo deflagracion"); 