//void, Obj This

Building this;
int aleatorio;
str item; 

this = This.AsBuilding;



Sleep(20000);

while(1){


if (!.FindItem("NO1").IsValid()){
Sleep(400000);
.ExchangeItem((.FindItem(item)), "NO1");}

aleatorio = rand(32);

if (aleatorio == 0)
item = "Amuleto de los caidos";

if (aleatorio == 1)
item = "Bendicion de Thor";

if (aleatorio == 2)
item = "Bear teeth amulet";

if (aleatorio == 3)
item = "Belt of might";

if (aleatorio == 4)
item = "Talisman de Anubis";

if (aleatorio == 5)
item = "Talisman de Ra";

if (aleatorio == 6)
item = "Talisman de Isis";

if (aleatorio == 7)
item = "Talisman de Neit";

if (aleatorio == 8)
item = "Talisman de Seth";

if (aleatorio == 9)
item = "Talisman de Sobek";

if (aleatorio == 10)
item = "Talisman de Thot";

if (aleatorio == 11)
item = "Talisman de Ptah";

if (aleatorio == 12)
item = "Regalo de Jupiter";

if (aleatorio == 13)
item = "Regalo de Marte";

if (aleatorio == 14)
item = "Rye spikes";

if (aleatorio == 15)
item = "Poison Mushroom";

if (aleatorio == 16)
item = "Snake skin";

if (aleatorio == 17)
item = "Belt of snakes";

if (aleatorio == 18)
item = "Eagle feather";

if (aleatorio == 19)
item = "Pocion venenosa";

if (aleatorio == 20)
item = "Healing herbs";

if (aleatorio == 21)
item = "Pocion energizante";

if (aleatorio == 22)
item = "Pocion reveladora";

if (aleatorio == 23)
item = "Pocion sombria";

if (aleatorio == 24)
item = "Anillo de la sabiduria";

if (aleatorio == 25)
item = "Hechizo convocar espiritus";

if (aleatorio == 26)
item = "Hechizo tormenta";

if (aleatorio == 27)
item = "Hechizo deflagracion";

if (aleatorio == 28)
item = "Hechizo sanacion";

if (aleatorio == 29)
item = "Hechizo corrupcion";

if (aleatorio == 30)
item = "Hechizo proteccion arcana";

if (aleatorio == 31)
item = "Hechizo iluminacion";



if (.FindItem("NO1").IsValid()){
Sleep(400000);
.ExchangeItem((.FindItem("NO1")), item);}




}

//prevent behavior script from terminating (this will lockup the game)
while(true) Sleep(50000);



