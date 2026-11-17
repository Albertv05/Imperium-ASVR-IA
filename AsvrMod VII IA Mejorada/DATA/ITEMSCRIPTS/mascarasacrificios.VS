if (owner.AsUnit.IsValid())
	if (owner.AsUnit.health < owner.maxhealth) {
		owner.AsUnit.Heal(100);
		CreateFeedback("Heal", owner.AsUnit);
	}