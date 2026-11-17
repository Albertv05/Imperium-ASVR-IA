// void, Settlement set, int playerid
//@name Riches
//@name.es Riqueza
//@name.it Ricchezza
//@description 2000 gold at the start, plus 20 gold every 2 seconds.
//@description.es 2000 de oro al empezar, más 20 de oro cada 2 segundos.
//@description.it 2000 monete d'oro all'inizio, più 20 monete d'oro ogni 2 secondi.
int GoldRate;
Sleep(100);

set.SetGold(set.gold + 2000);
set.GoldConverted(2000);


GoldRate = 20;

while (1) {
	Sleep(2000);
	if (set.IsValid) {
		if (set.player == playerid)	{
			set.SetGold(set.gold + GoldRate);
			set.GoldConverted(GoldRate);
		}
	}
}
