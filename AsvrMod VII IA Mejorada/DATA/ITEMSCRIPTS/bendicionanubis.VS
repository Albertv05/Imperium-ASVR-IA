//void, Obj owner, Obj victim
Unit this, u;

this = victim;

if (!.IsValid) return;

if((!.InHolder) && (rand(1000) > 900) && (owner.AsUnit().IsHeirOf("EAnubisWarrior"))){
 u = Place("GGhost", victim.pos, owner.player);
        if(u.IsValid){
  u.SetStamina(5);         
  u.SetLevel(owner.AsUnit().level);
  u.SetCommand("spawn");
  SwapSelectedObj(victim, u);
        }
} else {
 Sleep(2000);
}