//void, Obj this, Obj Victim

if (!.IsValid())
	return;

// Kills statistic
if (.AsUnit.IsValid)
if (!.AsUnit.IsDead())
	{
	.AsUnit.IncKills(1);
	}

// Egypt

if (EnvReadString(.player, "Path of the dead I") == "researched")
  {
	if (.AsUnit().inherentlevel < 4 )
	  .AsUnit().SetLevel(4);
  }

if (EnvReadString(.player, "Path of the dead II") == "researched")
  {
	if (.AsUnit().inherentlevel < 8 )
	  .AsUnit().SetLevel(8);
  }

if (EnvReadString(.player, "Path of the dead III") == "researched")
  {
	if (.AsUnit().inherentlevel < 12 )
	  .AsUnit().SetLevel(12);
  }


//
if ((EnvReadString(.player, "Spoils of war") == "researched") && (!.IsHeirOf("TTeutonArcher")) && (.HasItem("Spoils of War")) && (.FindItem("Spoils of War").use_count<5) && (!.IsHeirOf("Sentry")) && (!Victim.AsUnit.IsHeirOf("BaseAnimal"))){
	.FindItem("Spoils of War").SetUseCount(.FindItem("Spoils of War").use_count+1);
}

if ((EnvReadString(.player, "Spoils of war") == "researched") && (!.IsHeirOf("TTeutonArcher")) && (!.HasItem("Spoils of War")) && (!.IsHeirOf("Sentry")) && (!Victim.AsUnit.IsHeirOf("BaseAnimal"))){
	.AddItem("Spoils of War");}


if ((.IsHeirOf("TTeutonArcher")) && (.HasItem("Spoils of War")) && (.FindItem("Spoils of War").use_count<5) && (!.IsHeirOf("Sentry")) && (!Victim.AsUnit.IsHeirOf("BaseAnimal"))){
	.FindItem("Spoils of War").SetUseCount(.FindItem("Spoils of War").use_count+1);
}

if ((.IsHeirOf("TTeutonArcher")) && (!.HasItem("Spoils of War")) && (!.IsHeirOf("Sentry")) && (!Victim.AsUnit.IsHeirOf("BaseAnimal"))){
	.AddItem("Spoils of War");}

if ((.IsHeirOf("Perro")) && (.AsUnit.food < .AsUnit.maxfood)){
	.AsUnit.SetFood(.AsUnit.food + rand(5)+1);}




// rArena items
if (EnvReadString(.player, "Veteran Offence") == "researched") {
	if (!.AsHero().IsValid && !.HasItem("Veteran Offence"))
	  .AddItem("Veteran Offence");
}

if (EnvReadString(.player, "Veteran Defence") == "researched") {
	if (!.AsHero().IsValid && !.HasItem("Veteran Defence"))
  		.AddItem("Veteran Defence");
}

if (EnvReadString(.player, "Veteran Health") == "researched") {
	if (!.AsHero().IsValid && !.HasItem("Veteran Health"))
      	.AddItem("Veteran Health");
}

// Britain
if (.AsUnit().inherentlevel > 12)
{
	if (EnvReadString(.player, "Noble Offence") == "researched") {
		if (!.AsHero().IsValid && !.HasItem("Noble Offence"))
			.AddItem("Noble Offence");
	}

	if (EnvReadString(.player, "Noble Defence") == "researched") {
		if (!.AsHero().IsValid && !.HasItem("Noble Defence"))
  		.AddItem("Noble Defence");
	}
}

if (EnvReadString(.player, "Gambler's Day") == "researched")
	if (Victim.AsUnit)
	if (!Victim.IsSentry)
		if (.AsUnit().inherentlevel < Victim.AsUnit().inherentlevel)
		{
			int chance;
			chance = EnvReadInt(.player, "GamblersDayChance");
			if (rand(100) < chance)
			{
				.AsUnit.SetLevel(Victim.AsUnit.inherentlevel);
			}
		}

								
if (EnvReadString(.player, "Banquete de Belenos") == "researched"){
if (Count(.player, "GLider1") == 0){
	if ((!.AsHero().IsValid) && (rand(1000) > 900))
		.AsUnit().SetExperience(.AsUnit().experience + Victim.AsUnit().experience);		
					}
if (Count(.player, "GLider1") > 0){
	if ((!.AsHero().IsValid) && (rand(1000) > 800))
		.AsUnit().SetExperience(.AsUnit().experience + Victim.AsUnit().experience);		
					}
									}


if ((EnvReadString(Victim.player, "Veneno de Sardonia") == "researched") && (!.HasItem("Valeroso")) && (.AsUnit.inherentlevel < Victim.AsUnit.inherentlevel) && (!.IsHeirOf("BaseAnimal")) && (!.AsHero().IsValid())){
		.AsUnit().SetStamina(0);
		.SetCommand("move", (Victim.pos)+Point(-200 + rand(400), -200 + rand(400)));
		CreateFeedback("StaminaLoss", .AsUnit());		
}

if (!.IsHeirOf("Sentry")){

if ((Victim.AsUnit().class == "Wolf") || (Victim.AsUnit().class == "WolfUnit")){
	if ((.HasItem("Piel de lobo")) && (.FindItem("Piel de lobo").use_count<5)){
		.FindItem("Piel de lobo").SetUseCount(.FindItem("Piel de lobo").use_count+1);}
	if (!.HasItem("Piel de lobo")){
		.AsUnit().AddItem("Piel de lobo");}
		
}
if ((Victim.AsUnit().class == "LionF") || (Victim.AsUnit().class == "LionM") || (Victim.AsUnit().class == "LionFUnit") || (Victim.AsUnit().class == "LionMUnit")) {
	if ((.HasItem("Piel de leon")) && (.FindItem("Piel de leon").use_count<5)){
		.FindItem("Piel de leon").SetUseCount(.FindItem("Piel de leon").use_count+1);}	
	if (!.HasItem("Piel de leon")){
		.AsUnit().AddItem("Piel de leon");}
	
}
if ((Victim.AsUnit().class == "Bear") || (Victim.AsUnit().class == "BearUnit")){
	if ((.HasItem("Piel de oso")) && (.FindItem("Piel de oso").use_count<5)){
		.FindItem("Piel de oso").SetUseCount(.FindItem("Piel de oso").use_count+1);}
	if (!.HasItem("Piel de oso")){
		.AsUnit().AddItem("Piel de oso");}

	
	if ((.HasItem("Carne")) && (.FindItem("Carne").use_count<200)){
		.FindItem("Carne").SetUseCount(.FindItem("Carne").use_count+50);}
	if (!.HasItem("Carne")){
		.AsUnit().AddItem("Carne");}
	
		
}
if ((Victim.AsUnit().class == "Boar") || (Victim.AsUnit().class == "BoarUnit")){
	if ((.HasItem("Carne")) && (.FindItem("Carne").use_count<200)){
		.FindItem("Carne").SetUseCount(.FindItem("Carne").use_count+50);}
	if (!.HasItem("Carne")){
		.AsUnit().AddItem("Carne");}
		
}
if (Victim.AsUnit().class == "Deer"){
	if ((.HasItem("Cornamenta de ciervo")) && (.FindItem("Cornamenta de ciervo").use_count<5)){
		.FindItem("Cornamenta de ciervo").SetUseCount(.FindItem("Cornamenta de ciervo").use_count+1);}
	if (!.HasItem("Cornamenta de ciervo")) {
		.AsUnit().AddItem("Cornamenta de ciervo");}


	if ((.HasItem("Carne")) && (.FindItem("Carne").use_count<200)){
		.FindItem("Carne").SetUseCount(.FindItem("Carne").use_count+50);}
	if (!.HasItem("Carne")){
		.AsUnit().AddItem("Carne");}
			
}
}