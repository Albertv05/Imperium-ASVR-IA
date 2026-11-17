//void, Obj this, Settlement sett
int money;
int gold;
Item item;
int i;

if (!sett.IsValid)
	return;

if (sett.GetCentralBuilding.AsCatapult)
	return;

if(( sett.GetCentralBuilding.IsHeirOf("BaseRuins") ) || ( sett.GetCentralBuilding.IsHeirOf("TTent") )  || ( sett.GetCentralBuilding.IsHeirOf("GreatTavern") ))
	return;

// spoils of war
if((.HasItem("Spoils of War")) && ((sett.GetCentralBuilding.IsHeirOf("Outpost")) || (sett.GetCentralBuilding.IsHeirOf("BaseTownhall")) || (sett.GetCentralBuilding.IsHeirOf("MercadoArcano"))) ){
gold = GetConst("SpoilsOfWarGold");
item = .FindItem("Spoils of War");
money = item.use_count;
if(( sett.GetCentralBuilding.IsHeirOf("GOutpost") ) || ( sett.GetCentralBuilding.IsHeirOf("TOutpost") )){
gold = (125);}
	sett.SetGold(sett.gold + money * gold );
	sett.GoldConverted(money * gold);
	.AsUnit.RemoveItem("Spoils of War");
}

// RecuperarBotin
if((.HasItem("RecuperarBotin")) && ((sett.GetCentralBuilding.IsHeirOf("Outpost")) || (sett.GetCentralBuilding.IsHeirOf("BaseTownhall")) || (sett.GetCentralBuilding.IsHeirOf("MercadoArcano"))) ){
gold = GetConst("SpoilsOfWarGold");
item = .FindItem("RecuperarBotin");
money = item.use_count;
if(( sett.GetCentralBuilding.IsHeirOf("GOutpost") ) || ( sett.GetCentralBuilding.IsHeirOf("TOutpost") )){
gold = (125);}
	sett.SetGold(sett.gold + money * gold );
	sett.GoldConverted(money * gold);
	item.SetUseCount(0);
}


// Gema aurea de Midas
if((.HasItem("Gema aurea de Midas")) && ((sett.GetCentralBuilding.IsHeirOf("Outpost")) || (sett.GetCentralBuilding.IsHeirOf("BaseTownhall")) || (sett.GetCentralBuilding.IsHeirOf("MercadoArcano"))) ){
item = .FindItem("Gema aurea de Midas");
money = item.use_count;
	sett.SetGold(sett.gold + money);
	sett.GoldConverted(money);
	item.SetUseCount(0);
}


if((.HasItem("Piel de lobo")) && ((sett.GetCentralBuilding.IsHeirOf("Outpost")) || (sett.GetCentralBuilding.IsHeirOf("BaseTownhall")) || (sett.GetCentralBuilding.IsHeirOf("MercadoArcano"))) ){
item = .FindItem("Piel de lobo");
money = (item.use_count * 100);
if(( sett.GetCentralBuilding.IsHeirOf("GOutpost") ) || ( sett.GetCentralBuilding.IsHeirOf("TOutpost") )){
money = (item.use_count * 125);} 
	sett.SetGold(sett.gold + money);
	sett.GoldConverted(money);
	.AsUnit.RemoveItem("Piel de lobo");
}


if((.HasItem("Piel de oso")) && ((sett.GetCentralBuilding.IsHeirOf("Outpost")) || (sett.GetCentralBuilding.IsHeirOf("BaseTownhall")) || (sett.GetCentralBuilding.IsHeirOf("MercadoArcano"))) ){
item = .FindItem("Piel de oso");
money = (item.use_count * 150);
if(( sett.GetCentralBuilding.IsHeirOf("GOutpost") ) || ( sett.GetCentralBuilding.IsHeirOf("TOutpost") )){
money = (item.use_count * 187);}  
	sett.SetGold(sett.gold + money);
	sett.GoldConverted(money);
	.AsUnit.RemoveItem("Piel de oso");
}


if((.HasItem("Piel de leon")) && ((sett.GetCentralBuilding.IsHeirOf("Outpost")) || (sett.GetCentralBuilding.IsHeirOf("BaseTownhall")) || (sett.GetCentralBuilding.IsHeirOf("MercadoArcano"))) ){
item = .FindItem("Piel de leon");
money = (item.use_count * 200);
if(( sett.GetCentralBuilding.IsHeirOf("GOutpost") ) || ( sett.GetCentralBuilding.IsHeirOf("TOutpost") )){
money = (item.use_count * 250);}   
	sett.SetGold(sett.gold + money);
	sett.GoldConverted(money);
	.AsUnit.RemoveItem("Piel de leon");
}


if((.HasItem("Cornamenta de ciervo")) && ((sett.GetCentralBuilding.IsHeirOf("Outpost")) || (sett.GetCentralBuilding.IsHeirOf("BaseTownhall")) || (sett.GetCentralBuilding.IsHeirOf("MercadoArcano"))) ){
item = .FindItem("Cornamenta de ciervo");
money = (item.use_count * 50);
if(( sett.GetCentralBuilding.IsHeirOf("GOutpost") ) || ( sett.GetCentralBuilding.IsHeirOf("TOutpost") )){
money = (item.use_count * 67);}   
	sett.SetGold(sett.gold + money);
	sett.GoldConverted(money);
	.AsUnit.RemoveItem("Cornamenta de ciervo");
}


if((.HasItem("Tesoro")) && ((sett.GetCentralBuilding.IsHeirOf("Outpost")) || (sett.GetCentralBuilding.IsHeirOf("BaseTownhall")) || (sett.GetCentralBuilding.IsHeirOf("MercadoArcano"))) ){
money = 10000;
if(( sett.GetCentralBuilding.IsHeirOf("GOutpost") ) || ( sett.GetCentralBuilding.IsHeirOf("TOutpost") )){
money = (12500);}  
	sett.SetGold(sett.gold + money);
	sett.GoldConverted(money);
	.AsUnit.RemoveItem("Tesoro");
}


if((.HasItem("Carne")) && ((sett.GetCentralBuilding.IsHeirOf("Outpost")) || (sett.GetCentralBuilding.IsHeirOf("BaseTownhall"))) ){
item = .FindItem("Carne");
money = item.use_count;
if(( sett.GetCentralBuilding.IsHeirOf("GOutpost") ) || ( sett.GetCentralBuilding.IsHeirOf("TOutpost") )){
money = (item.use_count * 3/2);}  
	sett.SetFood(sett.food + money);
	.AsUnit.RemoveItem("Carne");
}