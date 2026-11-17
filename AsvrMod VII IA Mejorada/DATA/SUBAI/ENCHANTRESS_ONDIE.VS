// void, Obj This

Unit u;
Druid this;
Query q;
ObjList ol;
ObjList olFriendly;
int h;
int i;
int th;

this = This.AsDruid;

if (.InHolder())
	return;
if(EnvReadString(.player, "Mass Heal") != "researched")
	return;
q = ObjsInCircle(.pos, .range, "Unit");
ol = q.GetObjList();
h = 1000;

for (i = ol.count - 1; i >= 0; i -= 1) {
	u = ol[i].AsUnit;
	if ((u.IsValid) && (!.IsEnemy(u)) && (u.health < u.maxhealth) && (EnvReadString(.player, "Magia") != "researched")) {
		olFriendly.Add(u);
	}
	if ((u.IsValid) && (!.IsEnemy(u)) && (EnvReadString(.player, "Magia") == "researched") && (u.health < u.maxhealth) || (u.stamina < u.maxstamina) || (u.food < u.maxfood)) {
		olFriendly.Add(u);
	}
}

for (i = olFriendly.count - 1; i >= 0; i -= 1) {
	u = olFriendly[i];
	if (u.health < u.maxhealth) {
		th = u.maxhealth - u.health;
		if (th > h) {
			th = h;
		}
		if(EnvReadString(.player, "Magia") == "researched"){
		u.HealStamina(u.maxstamina - u.stamina);
		u.SetFood(u.maxfood);}
		u.Heal(th);
		CreateFeedback("Heal", u);
		h -= th;
		if (h == 0)
			break;
	}
}
