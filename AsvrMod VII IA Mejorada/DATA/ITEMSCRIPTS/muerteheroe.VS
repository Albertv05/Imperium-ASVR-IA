//void, Obj owner
ObjList ol;
Unit this, u;
int i;

this = owner.AsHero;

ol = ObjsInCircle(this.pos, 600, cUnit).GetObjList();
  ol = ol.ObjPlayer(.player);
  if(ol.count == 0) return;
  for(i=0;i<ol.count;i+=1){
if ((!ol[i].AsUnit().HasItem("Valeroso")) && (ol[i].AsUnit().level<owner.AsUnit.level) && (!ol[i].AsUnit().IsHeirOf("BaseAnimal")) && (!ol[i].AsUnit().AsHero().IsValid()) && (!ol[i].AsUnit().AsGhost().IsValid())){
   ol[i].AsUnit().SetStamina(0);
 CreateFeedback("StaminaLoss", ol[i].AsUnit());
}
  }