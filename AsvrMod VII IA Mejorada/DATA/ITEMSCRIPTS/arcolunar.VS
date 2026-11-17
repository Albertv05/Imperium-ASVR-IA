//void, Obj owner, Obj victim
ObjList ol;

int i;

ol = ObjsInCircle(victim.pos, 200, cUnit).GetObjList();
  if(ol.count == 0) return;
  for(i=0;i<ol.count;i+=1){
if ( (ol[i].AsUnit().IsEnemy(owner.AsUnit)) && (owner.AsUnit().damage_type == 1) ){
CreateFeedback("StaminaLoss", ol[i].AsUnit());
ol[i].AsUnit().SetStamina(0);
}
  }