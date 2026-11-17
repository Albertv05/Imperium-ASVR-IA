if ((owner.AsUnit().AsHero.IsValid) && (owner.AsUnit().damage_type == 0)){
PlaySound("SOUNDS/NOTIFICATIONS/VULCANO.OGG");
CreateFeedback("Fire", victim.AsUnit);
owner.AsUnit().RemoveBonus(100000, 0, 0, 0, 0);
owner.AsUnit().SetSpecial(12, false);
ItemUsed(1);
				}


