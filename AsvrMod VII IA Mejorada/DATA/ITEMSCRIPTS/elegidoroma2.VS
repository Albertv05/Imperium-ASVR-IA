if ( ((owner.AsUnit.race == RepublicanRome) || (owner.AsUnit.race == ImperialRome)) && (owner.AsUnit().AsHero.IsValid) && (!owner.AsUnit().IsHeirOf("Lider")) ){
owner.AsUnit().SetLevel(owner.AsUnit().inherentlevel-10);
owner.AsUnit().RemoveBonus(0, 10, 10, 0, 0);
																				}
if ( ((owner.AsUnit.race == RepublicanRome) || (owner.AsUnit.race == ImperialRome)) && (owner.AsUnit().AsHero.IsValid) && (owner.AsUnit().IsHeirOf("Lider")) ){
owner.AsUnit().SetLevel(owner.AsUnit().inherentlevel-20);
owner.AsUnit().RemoveBonus(0, 20, 20, 0, 0);
																				}