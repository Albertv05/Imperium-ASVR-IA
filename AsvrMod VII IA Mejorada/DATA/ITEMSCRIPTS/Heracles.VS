//void, Obj owner

Unit this;

this = owner.AsUnit;
if (!.IsValid) return;

while (true)
{
	Sleep(1000);
	if (owner.IsValid())
	if (owner.health < owner.maxhealth){
		CreateFeedback("Heal", this);
		owner.Heal(30);
		if ((owner.AsUnit.FindItem("Yelmo enmascarado de Heracles").IsValid()) && (owner.AsUnit.FindItem("Efigie de la fuerza de Heracles").IsValid()) && (owner.AsUnit.FindItem("Peto olimpico de Heracles").IsValid()));
		owner.Heal(30);

						}

}

//prevent behavior script from terminating (this will lockup the game)
while(true) Sleep(50000);
