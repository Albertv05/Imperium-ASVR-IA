if (!owner.IsValid()) return;
if (GetUseCount() != 0) return;
if (owner.AsUnit.health == owner.AsUnit.maxhealth) return;
owner.AsUnit().Heal(owner.AsUnit().maxhealth);
CreateFeedback("Heal", owner.AsUnit);
SetUseCount(10);
Sleep(1000);
SetUseCount(9);
Sleep(1000);
SetUseCount(8);
Sleep(1000);
SetUseCount(7);
Sleep(1000);
SetUseCount(6);
Sleep(1000);
SetUseCount(5);
Sleep(1000);
SetUseCount(4);
Sleep(1000);
SetUseCount(3);
Sleep(1000);
SetUseCount(2);
Sleep(1000);
SetUseCount(1);
Sleep(1000);
SetUseCount(0);


