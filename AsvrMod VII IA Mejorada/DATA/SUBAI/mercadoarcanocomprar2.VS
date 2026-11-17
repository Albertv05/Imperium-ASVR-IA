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

if (bld.FindItem("Daga de la manticora").IsValid)
item = "Daga de la manticora";

if (bld.FindItem("Pocion extraordinaria").IsValid)
item = "Pocion extraordinaria";

if (bld.FindItem("Yelmo ceremonial").IsValid)
item = "Yelmo ceremonial";

if (bld.FindItem("Hoz de oro de Litha").IsValid)
item = "Hoz de oro de Litha";

if (bld.FindItem("Secreto del bosque").IsValid)
item = "Secreto del bosque";

if (bld.FindItem("Conjuro oscuro").IsValid)
item = "Conjuro oscuro";

if (bld.FindItem("Pluma de fenix").IsValid)
item = "Pluma de fenix";

if (bld.FindItem("King's Belt").IsValid)
item = "King's Belt";

if (bld.FindItem("Ojo de las grayas").IsValid)
item = "Ojo de las grayas";

if (bld.FindItem("Bubo el buho mecanico").IsValid)
item = "Bubo el buho mecanico";

if (bld.FindItem("Amuleto de los heroes caidos").IsValid)
item = "Amuleto de los heroes caidos";

if (bld.FindItem("Odre del agua inagotable").IsValid)
item = "Odre del agua inagotable";

if (bld.FindItem("Colgante estelar").IsValid)
item = "Colgante estelar";

if (bld.FindItem("Golden Ankh").IsValid)
item = "Golden Ankh";

if (bld.FindItem("Ankh de plata").IsValid)
item = "Ankh de plata";

if (bld.FindItem("Ankh de cobre").IsValid)
item = "Ankh de cobre";

if (bld.FindItem("Armadura de fand").IsValid)
item = "Armadura de fand";

if (bld.FindItem("Yelmo de fand").IsValid)
item = "Yelmo de fand";

if (bld.FindItem("Escudo del bifrost").IsValid)
item = "Escudo del bifrost";

if (bld.FindItem("Hacha del bifrost").IsValid)
item = "Hacha del bifrost";

if (bld.FindItem("Impetu faraonico").IsValid)
item = "Impetu faraonico";

if (bld.FindItem("Hombreras punzantes").IsValid)
item = "Hombreras punzantes";

if (bld.FindItem("Hoplon de las embestidas").IsValid)
item = "Hoplon de las embestidas";

if (bld.FindItem("Coraje de Troya").IsValid)
item = "Coraje de Troya";

if (bld.FindItem("Defensa de Troya").IsValid)
item = "Defensa de Troya";

if (bld.FindItem("Mascara de los sacrificios").IsValid)
item = "Mascara de los sacrificios";

if (bld.FindItem("Roca supurante").IsValid)
item = "Roca supurante";

	if (u.free_item_slots > 0){
		u.AddItem(item);
		bld.ExchangeItem((bld.FindItem(item)), "NO2");}
}
}

}

}