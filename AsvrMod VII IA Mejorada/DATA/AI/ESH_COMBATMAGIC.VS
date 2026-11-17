// void, Settlement set

int AIPlayer, nRace, nAvail;
str strTech = "";

AIPlayer = set.player;
nRace = set.GetCentralBuilding.race;
nAvail = -1;

///--- Roman upgrade that could be made without priests
if (nRace == ImperialRome || nRace == RepublicanRome)
if (IsResearched(set, "Altar of Jupiter"))
if (!IsResearched(set, "God's Gift"))
if (rand(20) == 0 || set.gold >= 6000)
{
	EnvWriteString(set, "strTech", "God's Gift"); set.AIRun("ESH_NeedTech.vs");
	return;
}

///--- specify technology
if (nRace == Gaul)
{
	if (!IsResearched(AIPlayer, "Ghoul Summoning"))  strTech = "Ghoul Summoning";
	else if (!IsResearched(AIPlayer, "Restoration")) strTech = "Restoration";
	else if (!IsResearched(AIPlayer, "Posesion")) strTech = "Posesion";
	else return;
	if (!IsResearched(set, "Ritual Chamber"))        strTech = "Ritual Chamber";
	nAvail = Count(AIPlayer, "GDruid");
}
if (nRace == ImperialRome || nRace == RepublicanRome)
{
	if (!IsResearched(AIPlayer, "Cloud of Plague"))       strTech = "Cloud of Plague";
	else if (!IsResearched(AIPlayer, "Wrath of Jupiter")) strTech = "Wrath of Jupiter";
	else if (!IsResearched(AIPlayer, "Wrath of Marte")) strTech = "Wrath of Marte";
	else if ((!IsResearched(AIPlayer, "God's Gift2")) && (nRace == ImperialRome))   strTech = "God's Gift2";
	else if ((!IsResearched(AIPlayer, "God's Gift")) && (nRace == RepublicanRome))   strTech = "God's Gift";
	else return;
	if (!IsResearched(set, "Altar of Jupiter"))           strTech = "Altar of Jupiter";
	nAvail = Count(AIPlayer, "RPriest");
}
if (nRace == Carthage)
{
	if (!IsResearched(AIPlayer, "Zombify")) strTech = "Zombify";
	else if (!IsResearched(AIPlayer, "Posesion")) strTech = "Posesion";
	else return;
	if (!IsResearched(set, "Dark Rituals")) strTech = "Dark Rituals";
	nAvail = Count(AIPlayer, "CShaman");
}
if (nRace == Iberia)
{
	if (!IsResearched(AIPlayer, "Cover of Mercy"))         strTech = "Cover of Mercy";
	else if (!IsResearched(AIPlayer, "Iberian Mass Heal")) strTech = "Iberian Mass Heal";
	else if ((IsResearched(AIPlayer, "Iberian Mass Heal")) && (!IsResearched(AIPlayer, "Magia")))  strTech = "Magia";
	else if (!IsResearched(AIPlayer, "Iberian Bear Summoning")) strTech = "Iberian Bear Summoning";
	else if (!IsResearched(AIPlayer, "Veneno de Sardonia")) strTech = "Veneno de Sardonia";
	else return;
	if (!IsResearched(AIPlayer, "Code of Valor"))          strTech = "Code of Valor";
	nAvail = Count(AIPlayer, "IEnchantress");
	if (!IsResearched(AIPlayer, "Cover of Mercy"))
		nAvail = 3 * nAvail; /// boost combat upgrades because enchantress can only train
}
if (nRace == Britain)
{
	if (!IsResearched(AIPlayer, "Britain Ghoul Summoning")) strTech = "Britain Ghoul Summoning";
	else if (!IsResearched(AIPlayer, "Britain Mass Heal"))  strTech = "Britain Mass Heal";
	else if (!IsResearched(AIPlayer, "Ira de Taranis"))  strTech = "Ira de Taranis";
	else if (!IsResearched(AIPlayer, "Bendicion de Thor"))  strTech = "Bendicion de Thor";
	else return;
	if (!IsResearched(set, "Britain chamber"))              strTech = "Britain chamber";
	nAvail = Count(AIPlayer, "BDruid");
	if (!IsResearched(AIPlayer, "Britain Ghoul Summoning"))
		nAvail = 3 * nAvail; /// boost combat upgrades because BDruids can only hide units
}
if (nRace == Egypt)
{
	if (!IsResearched(AIPlayer, "ECloud of Plague")) strTech = "ECloud of Plague";
	else if (!IsResearched(AIPlayer, "EZombify"))    strTech = "EZombify";
	else if (!IsResearched(AIPlayer, "Lion Summoning"))    strTech = "Lion Summoning";
	else if (!IsResearched(AIPlayer, "Condena eterna"))    strTech = "Condena eterna";
	else return;
	if (!IsResearched(set, "Cult of Osiris"))        strTech = "Cult of Osiris";
	nAvail = Count(AIPlayer, "EPriest");
}
if (nRace == Germany)
{
	if (!IsResearched(AIPlayer, "German Mass Heal")) strTech = "German Mass Heal";
	else if (!IsResearched(AIPlayer, "Control"))    strTech = "Control";
	else if (!IsResearched(AIPlayer, "German Bear Summoning"))    strTech = "German Bear Summoning";
	else if (!IsResearched(AIPlayer, "Amuleto de los caidos"))    strTech = "Amuleto de los caidos";
	else return;
	if (!IsResearched(set, "German chamber"))        strTech = "German chamber";
	nAvail = Count(AIPlayer, "TEnchantress");
}

if (nAvail < AIVar(AIPlayer, AIV_CombatMagic) && set.gold < AIVar(AIPlayer, AIV_SquanderGoldAmount))
	return;

if (strTech != "")
{
	EnvWriteString(set, "strTech", strTech);
	set.AIRun("ESH_NeedTech.vs");
	return;
}
