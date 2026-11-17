// void, Settlement set, int playerid
//@name Food
//@name.es Comida
//@name.it Cibo
//@description 3000 food at the start, plus 30 food every 2 seconds.
//@description.es 3000 de comida al empezar, más 30 de comida cada 2 segundos.
//@description.it 3000 di cibo all'inizio, più 30 di cibo ogni 2 secondi.

int FoodRate;
Sleep(100);

set.SetFood(set.food + 3000);
FoodRate = 30;

while (1) {
	Sleep(2000);
	if (set.IsValid) {
		if (set.player == playerid)	{
			set.SetFood(set.food + FoodRate);
			set.GoldConverted(0);
		}
	}
}