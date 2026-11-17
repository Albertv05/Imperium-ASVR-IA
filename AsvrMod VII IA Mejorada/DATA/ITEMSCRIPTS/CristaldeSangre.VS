
if (GetUseCount() < 20){
SetUseCount(GetUseCount() + 1);
owner.AsUnit().SetLevel(owner.AsUnit().inherentlevel+1);
			}

if (GetUseCount() == 20){
SetUseCount(0);
owner.AsUnit().Damage(owner.AsUnit().health);
			}