if(owner.AsUnit.IsValid()){
 Unit u, ow;
 int at,defP,defS,hp,st,i;
 ow=owner.AsUnit();
 u=Place(ow.class, ow.pos, 1).AsUnit;
 u.SetLevel(ow.level);
 u.SetName(ow.name);
 for(i=1;i<=ow.item_count;i+=1){
  if(ow.GetItem(i).id!="Pluma de fenix")
   u.AddItem(ow.GetItem(i).id);
 } 
 at=0;defP=0;defS=0;hp=0;st=0;
 if(ow.attack>u.attack)
  at=ow.attack-u.attack;
 if(ow.armor_slash>u.armor_slash)
  defS=ow.armor_slash-u.armor_slash;
 if(ow.armor_pierce>u.armor_pierce)
  defP=ow.armor_pierce-u.armor_pierce;
 if(ow.health>u.health)
  hp=ow.maxhealth-u.maxhealth;
 if(ow.stamina>10)
  st=ow.stamina-10;
 u.AddBonus(at,defS,defP,hp,0);
 u.RemoveBonus(0,0,0,0,(hp-st));
 if(ow.sight>u.sight)
  u.SetSight(ow.sight);
 ow.RemoveAllItems();
 ow.Disappear();
}