//bool, Obj This, ObjList objs, str OUT reasonText

Building bld;
Settlement this;
Unit u;
ObjList ol;
int i;
str item;
str strText;
str dest,class, research;

this = bld.settlement;
dest = cmdparam;

class = ParseStr(dest, dest);
research = ParseStr(dest, dest);

	ol = objs[0].AsBuilding.settlement.Units;
	for (i = 0; i < ol.count; i += 1)
	{
		u = ol[i].AsUnit;
	}

if ((objs[0].AsBuilding.settlement.Units.count > 0 ) && (u.free_item_slots > 0) && (!objs[0].AsBuilding.FindItem("NO2").IsValid) && (u.AsHero.IsValid()) && (u.free_item_slots > 0 ))
  {
	if ((cmdcost_gold > objs[0].AsBuilding.settlement.gold) || (cmdcost_food > objs[0].AsBuilding.settlement.food) || (cmdcost_pop>0 && cmdcost_pop + GetConst("MinPopulation") > objs[0].AsBuilding.settlement.population) )
	{
		reasonText = rollover(objs[0].AsBuilding, class,true);
		return true;
	}
	reasonText = rollover(objs[0].AsBuilding, class, true);
	return true;
  }

strText = rollover(objs[0].AsBuilding, class, false) + "\n<color 255 0 0>";

if (objs[0].AsBuilding.FindItem("NO2").IsValid){
   reasonText = strText + Translate("No hay ningun artefacto epico en estos momentos");
return false;
}
if ((objs[0].AsBuilding.settlement.Units.count == 0 ) || (!u.AsHero.IsValid() )){
   reasonText = strText + Translate("No hay ningun heroe en el mercado arcano");
return false;
}
if (u.free_item_slots == 0 ){
   reasonText = strText + Translate("El heroe no puede llevar mas artefactos");
return false;
}

return false;
