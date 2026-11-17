// bool, Obj This, Obj target

Unit this;
this = This.AsUnit();

if (!.IsAlive()) return false;
if (!.IsHeirOf("GDruid")) return false;

if (!target.IsAlive()) return false;
if (target == this)    return false;
if (target.stamina >= target.maxstamina) return false;
if (.IsEnemy(target))  return false;
if (target.AsUnit)
	if (target.AsUnit.InHolder)   return false;
if (!.CanSee(target))  return false;
if (target.AsShip.IsValid)  return false;
if (target.AsGhost.IsValid) return false;

return true;
