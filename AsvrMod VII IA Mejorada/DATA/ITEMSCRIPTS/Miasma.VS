Obj obj;
int energia;

if (!owner.AsDruid().IsValid()) return;
if (owner.stamina < 10) return;
if (owner.pos.Dist(target)>500) return;

energia= (owner.AsUnit.level);

obj = Place("Mist", target, owner.player);
obj.SetStamina(energia);
owner.SetStamina(0);
owner.RemoveItem("Plaga mortal");
PlaySound("SOUNDS/NOTIFICATIONS/POSESION.OGG");