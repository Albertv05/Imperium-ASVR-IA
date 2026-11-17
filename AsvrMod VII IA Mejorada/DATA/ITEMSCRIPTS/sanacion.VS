//void, Obj owner

ObjList ol;
Unit u, this;
int i, nCount;

this = owner.AsDruid();

if (!owner.AsDruid().IsValid()) return;

    ol = ObjsInCircle(.pos, (200+.level*10), cUnit).GetObjList();

if(ol.count == 0) return;
  for(i=0;i<ol.count;i+=1){
if ((!.IsEnemy(ol[i].AsUnit())) && (ol[i].AsUnit().IsAlive)){
   ol[i].AsUnit().Heal(50+.level*15);
   CreateFeedback("Heal", ol[i].AsUnit());
}

  

}
.RemoveItem("Hechizo sanacion"); 