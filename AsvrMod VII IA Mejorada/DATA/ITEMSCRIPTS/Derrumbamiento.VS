ObjList ol;
point pos;
int i, damage;

if (!owner.AsDruid().IsValid()) return;
if (owner.stamina < 10) return;
if (owner.pos.Dist(target.pos)>500) return;
if (!target.AsBuilding.IsValid) return;
  pos=RandomPointInCircle(target.pos,50);
  CreateFeedback("IGule_fire",pos);
  CreateFeedback("Gule_explosion",pos);
damage= (500 + owner.AsDruid.level*100);

target.AsBuilding().Damage(damage);
owner.AsUnit().SetStamina(0);
PlaySound("SOUNDS/NOTIFICATIONS/VULCANO.OGG");
owner.RemoveItem("Derrumbamiento");