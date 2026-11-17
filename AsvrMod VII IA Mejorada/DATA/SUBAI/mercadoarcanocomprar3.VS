//void, Obj This

Building bld;
Settlement this;
Unit u;
ObjList ol;
int i;
str item;
bld = This.AsBuilding();




if (bld.IsValid) {
	this = bld.settlement;
if (.Units.count == 1 ) {

	ol = .Units;
	for (i = 0; i < ol.count; i += 1)
	{
		u = ol[i].AsUnit;


if (u.AsHero.IsValid()){


if (bld.FindItem("Cornucopia de la abundancia").IsValid)
item = "Cornucopia de la abundancia";

if (bld.FindItem("Gema aurea de Midas").IsValid)
item = "Gema aurea de Midas";

if (bld.FindItem("Amuleto de Nemea").IsValid)
item = "Amuleto de Nemea";

if (bld.FindItem("Anillo de los dvergar").IsValid)
item = "Anillo de los dvergar";

if (bld.FindItem("Orbe del fuego destructor").IsValid)
item = "Orbe del fuego destructor";

if (bld.FindItem("Anillo de Morrigan").IsValid)
item = "Anillo de Morrigan";

if (bld.FindItem("Fur gloves of health").IsValid)
item = "Fur gloves of health";

if (bld.FindItem("Yelmo alado").IsValid)
item = "Yelmo alado";

if (bld.FindItem("Concentration stone").IsValid)
item = "Concentration stone";

if (bld.FindItem("Corona negra de Pluton").IsValid)
item = "Corona negra de Pluton";

if (bld.FindItem("Arco solar").IsValid)
item = "Arco solar";

if (bld.FindItem("Arco lunar").IsValid)
item = "Arco lunar";

if (bld.FindItem("Peto del Nilo").IsValid)
item = "Peto del Nilo";

if (bld.FindItem("Brazaletes del Nilo").IsValid)
item = "Brazaletes del Nilo";

if (bld.FindItem("Colmillo de Fenrir").IsValid)
item = "Colmillo de Fenrir";

if (bld.FindItem("Anillo de los aullidos").IsValid)
item = "Anillo de los aullidos";

if (bld.FindItem("Fauces pavorosas").IsValid)
item = "Fauces pavorosas";

if (bld.FindItem("Yelmo enmascarado de Heracles").IsValid)
item = "Yelmo enmascarado de Heracles";

if (bld.FindItem("Efigie de la fuerza de Heracles").IsValid)
item = "Efigie de la fuerza de Heracles";

if (bld.FindItem("Peto olimpico de Heracles").IsValid)
item = "Peto olimpico de Heracles";

if (bld.FindItem("Cristal de sangre").IsValid)
item = "Cristal de sangre";

if (bld.FindItem("Corona invernal de Yule").IsValid)
item = "Corona invernal de Yule";

	if (u.free_item_slots > 0){
		u.AddItem(item);
		bld.ExchangeItem((bld.FindItem(item)), "NO3");}
}
}

}

}