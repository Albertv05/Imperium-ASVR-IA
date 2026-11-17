//void, Obj owner

ObjList ol;
Unit u, this;
int i, nCount;

this = owner.AsUnit();

if (owner.AsUnit().damage_type == 0){

if (GetUseCount() < 5){
SetUseCount(GetUseCount() + 1);
owner.AsUnit().AddBonus(20,0,0,0,0);
return;
   }

if (GetUseCount() == 5){
SetUseCount(0);
owner.AsUnit().RemoveBonus(100,0,0,0,0);
ol = ObjsInCircle(owner.AsUnit().pos, 500, cUnit).GetObjList();
if(ol.count == 0) return;
  for(i=0;i<ol.count;i+=1){
if ((.IsEnemy(ol[i].AsUnit())) && (ol[i].AsUnit().IsAlive)){
   ol[i].AsUnit().Damage(100);
   ol[i].AsUnit().SetStamina(0);
   CreateFeedback("Lightning3", ol[i].AsUnit());

}

}
PlaySound("SOUNDS/NOTIFICATIONS/TRUENO.OGG"); 
return;
}
}




