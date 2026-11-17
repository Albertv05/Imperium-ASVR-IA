if (!owner.AsHero().IsValid()) return;
if (!target.AsUnit().IsValid()) return;
if (owner.pos.Dist(target.AsUnit.pos)>250) return;
if (target.AsUnit().level>=owner.AsUnit.level) return;
if (GetUseCount() != 100) return;

CreateFeedback("Damage2", target.AsUnit); 
target.Damage(target.maxhealth);
SetUseCount(0);