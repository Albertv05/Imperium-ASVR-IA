//void, Obj owner

ObjList ol;
Unit u, this;
int i, nCount;

this = owner.AsUnit();

if( (owner.AsUnit.FindItem("Escudo del bifrost").IsValid()) && owner.AsUnit.FindItem("Hacha del bifrost").IsValid() ){

ol = ObjsInRange(this, cUnit, 300).GetObjList();

ol = ol.ObjPlayer(.player);
if(ol.count == 0) return;
  for(i=0;i<ol.count;i+=1){
if ((ol[i].AsUnit().IsAlive) && (ol[i].AsUnit().stamina < ol[i].AsUnit().maxstamina) && (!ol[i].AsUnit().IsHeirOf("BaseAnimal"))){
   ol[i].AsUnit().HealStamina(3);
 CreateFeedback("StaminaBoost", ol[i].AsUnit());
}
  }

}