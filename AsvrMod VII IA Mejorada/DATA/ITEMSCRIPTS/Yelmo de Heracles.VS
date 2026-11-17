//void, Obj owner, Obj victim

if (owner.IsValid())
	if (owner.health < owner.maxhealth) {
		owner.Heal(owner.maxhealth/10);
		CreateFeedback("Heal", owner.AsUnit);
	}
