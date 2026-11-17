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

if (bld.FindItem("Yelmo de Moloch").IsValid)
item = "Yelmo de Moloch";

if (bld.FindItem("Piedad de Isis").IsValid)
item = "Piedad de Isis";

if (bld.FindItem("Orbe del conocimiento de Thot").IsValid)
item = "Orbe del conocimiento de Thot";

if (bld.FindItem("Escudo de Minerva").IsValid)
item = "Escudo de Minerva";

if (bld.FindItem("Mazo igneo de Vulcano").IsValid)
item = "Mazo igneo de Vulcano";

if (bld.FindItem("Egida de Marte").IsValid)
item = "Egida de Marte";

if (bld.FindItem("Mascara funeraria de Anubis").IsValid)
item = "Mascara funeraria de Anubis";

if (bld.FindItem("Mjolnir el tormentoso").IsValid)
item = "Mjolnir el tormentoso";

if (bld.FindItem("Efigie divina de Ra").IsValid)
item = "Efigie divina de Ra";

if (bld.FindItem("Corona laurea de Romulo").IsValid)
item = "Corona laurea de Romulo";

if (bld.FindItem("Corona del alto y bajo Egipto").IsValid)
item = "Corona del alto y bajo Egipto";

if (bld.FindItem("Corona de Wotan").IsValid)
item = "Corona de Wotan";

if (bld.FindItem("Espada flamigera de Belenos").IsValid)
item = "Espada flamigera de Belenos";

if (bld.FindItem("Aro de los reyes").IsValid)
item = "Aro de los reyes";

	if (u.free_item_slots > 0){
		u.AddItem(item);
		bld.ExchangeItem((bld.FindItem(item)), "NO4");}
}
}

}

}