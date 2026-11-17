//void, Obj owner

ObjList ol;
Unit u, this;
int i, nCount;

this = owner.AsUnit();

if (owner.AsUnit().damage_type == 0){
			

if (rand(1000) > 800){
ol = ObjsInCircle(owner.AsUnit().pos, 150, cUnit).GetObjList();
if(ol.count == 0) return;
  for(i=0;i<ol.count;i+=1){
if ((.IsEnemy(ol[i].AsUnit())) && (ol[i].AsUnit().IsAlive)){
   ol[i].AsUnit().Damage(100);
    CreateFeedback("Gule_fire", ol[i].AsUnit());
    CreateFeedback("Gule_explosion", ol[i].AsUnit());

			   }

								}
PlaySound("SOUNDS/NOTIFICATIONS/VULCANO.OGG"); 
return;
			}
					}


