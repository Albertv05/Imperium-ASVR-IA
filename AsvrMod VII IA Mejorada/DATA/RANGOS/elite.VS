//void, Obj owner
Item this;
int nivel, vida, rango, total, amuleto;

if (victim.AsUnit().IsMilitary || victim.AsUnit().IsHeirOf("BaseMage") || victim.AsUnit().IsHeirOf("AttackAnimal")){
if (GetUseCount() < 350)

nivel = 4;
if (owner.AsUnit.inherentlevel < victim.AsUnit.inherentlevel){
nivel = ((victim.AsUnit.inherentlevel - owner.AsUnit.inherentlevel)*8);}

vida = 2;
if (owner.AsUnit.maxhealth < victim.AsUnit.maxhealth){
vida = ((victim.AsUnit.maxhealth - owner.AsUnit.maxhealth)/5 + 1);}

rango = 2;
if (victim.AsUnit.HasItem("Veterano")){
rango = 5;}
if (victim.AsUnit.HasItem("Elite")){
rango = 10;}
if (victim.AsUnit.HasItem("Campeon")){
rango = 20;}
if (victim.AsUnit.HasItem("Leyenda")){
rango = 40;}
if (victim.AsUnit.AsHero.IsValid()){
rango = 40;}
if (victim.AsUnit.IsHeirOf("Lider")){
rango = 80;}

amuleto = 0;
if (owner.AsUnit.HasItem("Amuleto de los caidos"))
amuleto = 8;

total = (nivel + vida + rango + amuleto);
SetUseCount(GetUseCount() + total);


if (owner.AsUnit.hero.IsValid){
if (owner.AsUnit.hero.HasItem("Amuleto de los heroes caidos"))
SetUseCount(GetUseCount() + total);
				}

if (owner.AsUnit.hero.IsValid){
if ((owner.AsUnit.hero.HasItem("Egida de Marte")) && (GetUseCount() >= 350)){
if (owner.AsUnit.HasItem("Amuleto de los caidos"))
owner.AsUnit().RemoveItem("Amuleto de los caidos");
owner.ExchangeItem(owner.AsUnit.FindItem("Elite"), "Leyenda");
									}
				}

if (GetUseCount() >= 350)
owner.ExchangeItem(owner.AsUnit.FindItem("Elite"), "Campeon");
}

