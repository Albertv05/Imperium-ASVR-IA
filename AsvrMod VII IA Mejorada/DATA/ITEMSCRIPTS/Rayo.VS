ObjList ol;

int i, radio, damage;

if (!owner.AsDruid().IsValid()) return;
if (owner.stamina < 10) return;
if (owner.pos.Dist(target.pos)>500) return;
if (!target.AsUnit.IsValid) return;
radio= (50);
damage= (200 + owner.AsDruid.level*20);

ol = ObjsInCircle(target.pos, radio, cUnit).GetObjList();
CreateFeedback("Lightning2", target.AsUnit);
target.AsUnit().Damage(damage);
Sleep(500);
owner.AsUnit().SetStamina(0);

if(ol.count == 0) return;
for(i=0;i<ol.count;i+=1){
if ((ol[i].AsUnit().IsValid) && (!ol[i].AsUnit()==owner.AsDruid)) {
ol[i].AsUnit().Damage(damage/10);
}
  }
PlaySound("SOUNDS/NOTIFICATIONS/TRUENO.OGG");
owner.RemoveItem("Rayo");


