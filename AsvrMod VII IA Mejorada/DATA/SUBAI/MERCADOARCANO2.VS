//void, Obj This

Building this;
int aleatorio;
str item; 

this = This.AsBuilding;



Sleep(40000);

while(1){


if (!.FindItem("NO2").IsValid()){
Sleep(600000);
.ExchangeItem((.FindItem(item)), "NO2");}


aleatorio = rand(26);


if (aleatorio == 0)
item = "Pocion extraordinaria";

if (aleatorio == 1)
item = "Yelmo ceremonial";

if (aleatorio == 2)
item = "Hoz de oro de Litha";

if (aleatorio == 3)
item = "Secreto del bosque";

if (aleatorio == 4)
item = "Conjuro oscuro";

if (aleatorio == 5)
item = "Pluma de fenix";

if (aleatorio == 6)
item = "King's Belt";

if (aleatorio == 7)
item = "Ojo de las grayas";

if (aleatorio == 8)
item = "Bubo el buho mecanico";

if (aleatorio == 9)
item = "Amuleto de los heroes caidos";

if (aleatorio == 10)
item = "Odre del agua inagotable";

if (aleatorio == 11)
item = "Golden Ankh";

if (aleatorio == 12)
item = "Ankh de plata";

if (aleatorio == 13)
item = "Ankh de cobre";

if (aleatorio == 14)
item = "Armadura de fand";

if (aleatorio == 15)
item = "Yelmo de fand";

if (aleatorio == 16)
item = "Escudo del bifrost";

if (aleatorio == 17)
item = "Roca supurante";

if (aleatorio == 18)
item = "Mascara de los sacrificios";

if (aleatorio == 19)
item = "Impetu faraonico";

if (aleatorio == 20)
item = "Hoplon de las embestidas";

if (aleatorio == 21)
item = "Coraje de Troya";

if (aleatorio == 22)
item = "Defensa de Troya";

if (aleatorio == 23)
item = "Colgante estelar";

if (aleatorio == 24)
item = "Daga de la manticora";

if (aleatorio == 25)
item = "Hombreras punzantes";

if (.FindItem("NO2").IsValid()){
Sleep(600000);
.ExchangeItem((.FindItem("NO2")), item);}

}

//prevent behavior script from terminating (this will lockup the game)
while(true) Sleep(50000);

