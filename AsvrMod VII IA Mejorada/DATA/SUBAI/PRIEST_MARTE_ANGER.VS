// void, Obj This

Druid this;
Unit u;
ObjList ol;
int i;

this = This.AsDruid();
ol = ObjsInSight(this, "Unit").GetObjList();
if (!This.IsValid()) return;

if (ol.count==0) return;
.PlayAnim(19, .pos);
PlaySound("SOUNDS/NOTIFICATIONS/CONDENAETERNA.OGG");
if (ol.count>0)
	for(i=0;i<ol.count;i+=1){ //make 100 attempts to damage 
		if (ol[i].AsUnit().IsDead()) continue;
		if (This.IsEnemy(ol[i].AsUnit())) {
			CreateFeedback("Fire", ol[i].AsUnit());
			ol[i].AsUnit().Damage(10 + This.AsDruid().level);
			This.Damage(This.health); // kill myself
		}
	}