//void, Obj This

Building this;
int aleatorio;
str item; 

this = This.AsBuilding;



Sleep(60000);

while(1){

if (!.FindItem("NO3").IsValid()){
Sleep(800000);
.ExchangeItem((.FindItem(item)), "NO3");}



aleatorio = rand(22);

if (aleatorio == 0)
item = "Cornucopia de la abundancia";

if (aleatorio == 1)
item = "Gema aurea de Midas";

if (aleatorio == 2)
item = "Amuleto de Nemea";

if (aleatorio == 3)
item = "Anillo de los dvergar";

if (aleatorio == 4)
item = "Orbe del fuego destructor";

if (aleatorio == 5)
item = "Fur gloves of health";

if (aleatorio == 6)
item = "Yelmo alado";

if (aleatorio == 7)
item = "Concentration stone";

if (aleatorio == 8)
item = "Corona negra de Pluton";

if (aleatorio == 9)
item = "Arco solar";

if (aleatorio == 10)
item = "Arco lunar";

if (aleatorio == 11)
item = "Peto del Nilo";

if (aleatorio == 12)
item = "Brazaletes del Nilo";

if (aleatorio == 13)
item = "Colmillo de Fenrir";

if (aleatorio == 14)
item = "Anillo de los aullidos";

if (aleatorio == 15)
item = "Fauces pavorosas";

if (aleatorio == 16)
item = "Yelmo enmascarado de Heracles";

if (aleatorio == 17)
item = "Efigie de la fuerza de Heracles";

if (aleatorio == 18)
item = "Peto olimpico de Heracles";

if (aleatorio == 19)
item = "Anillo de Morrigan";

if (aleatorio == 20)
item = "Cristal de sangre";

if (aleatorio == 21)
item = "Corona invernal de Yule";




if (.FindItem("NO3").IsValid()){
Sleep(800000);
.ExchangeItem((.FindItem("NO3")), item);}



}

//prevent behavior script from terminating (this will lockup the game)
while(true) Sleep(50000);

