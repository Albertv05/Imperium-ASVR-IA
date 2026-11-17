//void, Obj owner

ObjList ol;
Unit u, this;
int i, nCount;

this = owner.AsDruid();

if (!owner.AsDruid().IsValid()) return;

  ol = ObjsInCircle(.pos, (300), cUnit).GetObjList();

if(ol.count == 0) return;
  for(i=0;i<ol.count;i+=1){
if ((!.IsEnemy(ol[i].AsUnit())) && (ol[i].AsUnit().IsAlive)){
if (ol[i].AsUnit().inherentlevel<owner.AsUnit.level){
ol[i].AsUnit().SetLevel(.level);
CreateFeedback("Experience", ol[i].AsUnit());
							}
								}  
				}
.RemoveItem("Hechizo iluminacion"); 
