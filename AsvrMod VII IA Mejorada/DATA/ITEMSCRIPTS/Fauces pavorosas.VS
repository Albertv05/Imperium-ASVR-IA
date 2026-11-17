//void, Obj owner, Obj victim
ObjList ol;

int i;

ol = ObjsInCircle(victim.pos, 150, cUnit).GetObjList();
  if(ol.count == 0) return;
  for(i=0;i<ol.count;i+=1){
if ((ol[i].AsUnit().IsEnemy(owner.AsUnit)) && (!ol[i].AsUnit().IsHeirOf("BaseAnimal")) && (!ol[i].AsUnit().IsHeirOf("Momia")) && (!ol[i].AsUnit().AsGhost().IsValid) ){
 CreateFeedback("StaminaLoss", ol[i].AsUnit());
 ol[i].AsUnit().SetStamina(0);
 ol[i].AsUnit().AsUnit().Curse();
ol[i].AsUnit().SetCommand("move", (victim.pos)+Point(-200 + rand(400), -200 + rand(400)));
}
  }