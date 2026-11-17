//void, Obj owner, Obj victim

if ( (owner.IsValid()) && (owner.AsUnit().damage_type == 0) ){
owner.AsUnit().Heal(victim.AsUnit().maxhealth/10);
CreateFeedback("Heal", owner.AsUnit);
owner.AsUnit().HealStamina(victim.AsUnit().stamina);
owner.AsUnit.SetFood(owner.AsUnit.maxfood);
	}