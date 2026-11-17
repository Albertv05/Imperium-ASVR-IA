if(!owner.AsUnit().IsHeirOf("TValkyrie")) return;
if (owner.AsUnit.hero.IsValid)
owner.AsUnit.hero.SetExperience(owner.AsUnit.hero.experience + 1);