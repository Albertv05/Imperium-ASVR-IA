if ( (owner.AsUnit.race == Germany) && (owner.AsUnit().AsHero.IsValid) && (!owner.AsUnit().IsHeirOf("TLider")) ){
owner.AsUnit().SetLevel(owner.AsUnit().inherentlevel+10);
owner.AsUnit().AddBonus(20, 0, 0, 0, 0);
														}
if ( (owner.AsUnit().AsHero.IsValid) && (owner.AsUnit().IsHeirOf("BritonHero")) && (!owner.AsUnit().IsHeirOf("BLider")) && (owner.AsUnit().damage_type == 0) ){
owner.AsUnit().SetLevel(owner.AsUnit().inherentlevel+10);
owner.AsUnit().AddBonus(20, 0, 0, 0, 0);
														       }
if ( (owner.AsUnit.race == Germany) && (owner.AsUnit().AsHero.IsValid) && (owner.AsUnit().IsHeirOf("TLider")) ){
owner.AsUnit().SetLevel(owner.AsUnit().inherentlevel+20);
owner.AsUnit().AddBonus(40, 0, 0, 0, 0);
														}
if ( (owner.AsUnit().AsHero.IsValid) && (owner.AsUnit().IsHeirOf("BLider")) && (owner.AsUnit().damage_type == 0) ){
owner.AsUnit().SetLevel(owner.AsUnit().inherentlevel+20);
owner.AsUnit().AddBonus(40, 0, 0, 0, 0);
														       }