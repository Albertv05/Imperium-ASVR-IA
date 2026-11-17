//void, Obj This

Building this;
int aleatorio;
str item; 

this = This.AsBuilding;



Sleep(80000);

while(1){


if (!.FindItem("NO4").IsValid()){
Sleep(1000000);
.ExchangeItem((.FindItem(item)), "NO4");}




aleatorio = rand(14);

if (aleatorio == 0)
item = "Piedad de Isis";

if (aleatorio == 1)
item = "Orbe del conocimiento de Thot";

if (aleatorio == 2)
item = "Escudo de Minerva";

if (aleatorio == 3)
item = "Mazo igneo de Vulcano";

if (aleatorio == 4)
item = "Egida de Marte";

if (aleatorio == 5)
item = "Mascara funeraria de Anubis";

if (aleatorio == 6)
item = "Mjolnir el tormentoso";

if (aleatorio == 7)
item = "Efigie divina de Ra";

if (aleatorio == 8)
item = "Corona laurea de Romulo";

if (aleatorio == 9)
item = "Corona del alto y bajo Egipto";

if (aleatorio == 10)
item = "Corona de Wotan";

if (aleatorio == 11)
item = "Espada flamigera de Belenos";

if (aleatorio == 12)
item = "Yelmo de Moloch";

if (aleatorio == 13)
item = "Aro de los reyes";

if (.FindItem("NO4").IsValid()){
Sleep(1000000);
.ExchangeItem((.FindItem("NO4")), item);}


}

//prevent behavior script from terminating (this will lockup the game)
while(true) Sleep(50000);

