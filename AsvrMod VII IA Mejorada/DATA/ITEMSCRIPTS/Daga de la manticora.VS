if (!owner.AsUnit().IsValid()) return;
if (!target.AsUnit.IsValid) return;

owner.AsUnit.KillCommand;

while (!owner.AsUnit().Goto(target.AsUnit, 20, 500, false, 500));

if (target.AsUnit.IsValid){
owner.AsUnit.Face(target.pos);
target.AsUnit.SetStamina(0);
target.AsUnit.Damage(owner.AsUnit.damage);
if (target.AsUnit.IsAlive)
target.AsUnit.Disease();   }

