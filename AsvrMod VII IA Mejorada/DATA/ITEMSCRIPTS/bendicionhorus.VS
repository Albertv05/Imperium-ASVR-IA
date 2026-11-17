if ( (owner.AsUnit.IsValid) && (owner.AsUnit().IsHeirOf("EHorusWarrior")) && (rand(1000) > 900) ){
owner.AsUnit().Heal(owner.AsUnit().maxhealth);
owner.AsUnit().HealStamina(owner.AsUnit().maxstamina);
CreateFeedback("Heal", owner.AsUnit); }