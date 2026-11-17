//void, Obj owner, Obj victim

Unit u;

if(rand(1000) > 900){
u = Place("GGhost", owner.AsUnit().pos, owner.AsUnit().player);
u.SetStamina(5);         
u.SetLevel(owner.AsUnit().level);
u.SetCommand("spawn");
SwapSelectedObj(owner.AsUnit(), u);

}