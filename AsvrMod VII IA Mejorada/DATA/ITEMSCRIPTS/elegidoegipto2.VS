if ( (owner.AsUnit.race == Egypt) && (owner.AsUnit().AsHero.IsValid) && (!owner.AsUnit().IsHeirOf("Lider")) ){
owner.AsUnit().SetLevel(owner.AsUnit().inherentlevel-10);
owner.AsUnit().RemoveBonus(10, 5, 5, 0, 0);
																				}
if ( (owner.AsUnit.race == Egypt) && (owner.AsUnit().AsHero.IsValid) && (owner.AsUnit().IsHeirOf("Lider")) ){
owner.AsUnit().SetLevel(owner.AsUnit().inherentlevel-20);
owner.AsUnit().RemoveBonus(20, 10, 10, 0, 0);
																				}