//void, Obj owner

Unit this;
this = owner.AsUnit;

if (!.IsValid) return;

if (owner.IsValid()){
		
	.HealStamina(.maxstamina);
	
	.Heal(.maxhealth);

	.SetLevel(.inherentlevel+rand(10)+1);

	.AddBonus(0,(rand(5)+1)*2,(rand(5)+1)*5,0,0);

	.AddBonus((rand(5)+1)*10,0,0,0,0);	

ItemUsed(1);       

}

