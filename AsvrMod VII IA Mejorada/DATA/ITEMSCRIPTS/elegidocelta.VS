if ( ((owner.AsUnit.race == Gaul) || ((owner.AsUnit.race == Britain) && (owner.AsUnit().damage_type == 1)) ) && (owner.AsUnit().AsHero.IsValid) && (!owner.AsUnit().IsHeirOf("Lider")) ){
owner.AsUnit().SetLevel(owner.AsUnit().inherentlevel+10);
owner.AsUnit().AddBonus(10, 5, 5, 0, 0);
																				}
if ( ((owner.AsUnit.race == Gaul) || ((owner.AsUnit.race == Britain) && (owner.AsUnit().damage_type == 1)) ) && (owner.AsUnit().AsHero.IsValid) && (owner.AsUnit().IsHeirOf("Lider")) ){
owner.AsUnit().SetLevel(owner.AsUnit().inherentlevel+20);
owner.AsUnit().AddBonus(20, 10, 10, 0, 0);
																				}

