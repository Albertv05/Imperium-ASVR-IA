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

if (bld.FindItem("Amuleto de los caidos").IsValid)
item = "Amuleto de los caidos";

if (bld.FindItem("Bendicion de Thor").IsValid)
item = "Bendicion de Thor";

if (bld.FindItem("Bear teeth amulet").IsValid)
item = "Bear teeth amulet";

if (bld.FindItem("Belt of might").IsValid)
item = "Belt of might";

if (bld.FindItem("Talisman de Anubis").IsValid)
item = "Talisman de Anubis";

if (bld.FindItem("Talisman de Ra").IsValid)
item = "Talisman de Ra";

if (bld.FindItem("Talisman de Isis").IsValid)
item = "Talisman de Isis";

if (bld.FindItem("Talisman de Neit").IsValid)
item = "Talisman de Neit";

if (bld.FindItem("Talisman de Seth").IsValid)
item = "Talisman de Seth";

if (bld.FindItem("Talisman de Sobek").IsValid)
item = "Talisman de Sobek";

if (bld.FindItem("Talisman de Thot").IsValid)
item = "Talisman de Thot";

if (bld.FindItem("Talisman de Ptah").IsValid)
item = "Talisman de Ptah";

if (bld.FindItem("Regalo de Jupiter").IsValid)
item = "Regalo de Jupiter";

if (bld.FindItem("Regalo de Marte").IsValid)
item = "Regalo de Marte";

if (bld.FindItem("Rye spikes").IsValid)
item = "Rye spikes";

if (bld.FindItem("Poison Mushroom").IsValid)
item = "Poison Mushroom";

if (bld.FindItem("Snake skin").IsValid)
item = "Snake skin";

if (bld.FindItem("Belt of snakes").IsValid)
item = "Belt of snakes";

if (bld.FindItem("Eagle feather").IsValid)
item = "Eagle feather";

if (bld.FindItem("Pocion reveladora").IsValid)
item = "Pocion reveladora";

if (bld.FindItem("Pocion energizante").IsValid)
item = "Pocion energizante";

if (bld.FindItem("Pocion venenosa").IsValid)
item = "Pocion venenosa";

if (bld.FindItem("Pocion sombria").IsValid)
item = "Pocion sombria";

if (bld.FindItem("Healing herbs").IsValid)
item = "Healing herbs";

if (bld.FindItem("Anillo de la sabiduria").IsValid)
item = "Anillo de la sabiduria";

if (bld.FindItem("Hechizo convocar espiritus").IsValid)
item = "Hechizo convocar espiritus";

if (bld.FindItem("Hechizo tormenta").IsValid)
item = "Hechizo tormenta";

if (bld.FindItem("Hechizo deflagracion").IsValid)
item = "Hechizo deflagracion";

if (bld.FindItem("Hechizo sanacion").IsValid)
item = "Hechizo sanacion";

if (bld.FindItem("Hechizo corrupcion").IsValid)
item = "Hechizo corrupcion";

if (bld.FindItem("Hechizo proteccion arcana").IsValid)
item = "Hechizo proteccion arcana";

if (bld.FindItem("Hechizo iluminacion").IsValid)
item = "Hechizo iluminacion";

	if (u.free_item_slots > 0){
		u.AddItem(item);
		bld.ExchangeItem((bld.FindItem(item)), "NO1");}
}
}

}

}