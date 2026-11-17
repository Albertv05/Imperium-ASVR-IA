// void, Obj This

Unit newunit;
Barrack this;
point ptExit, punto;
int level,i,randheroe;
str heroe;
ObjList ol;

this = This.AsBuilding();


while(true){


randheroe = rand(50);

	if((randheroe == 0) || (randheroe == 49))
		heroe = "AHero1";
	if((randheroe == 1) || (randheroe == 48))
		heroe = "AHero2";
	if((randheroe == 2) || (randheroe == 47))
		heroe = "AHero3";
	if((randheroe == 3) || (randheroe == 46))
		heroe = "AHero4";
	if((randheroe == 4) || (randheroe == 45))           
		heroe = "AHero5";
	if((randheroe == 5) || (randheroe == 44))                   
		heroe = "AHero6";
	if((randheroe == 6) || (randheroe == 43))
		heroe = "AHero7";
	if((randheroe == 7) || (randheroe == 42))
		heroe = "AHero8";
	if((randheroe == 8) || (randheroe == 41))
		heroe = "AHero9";
	if((randheroe == 9) || (randheroe == 40))
		heroe = "AHero10";
	if((randheroe == 10) || (randheroe == 39))
		heroe = "AHero11";
	if((randheroe == 11) || (randheroe == 38))
		heroe = "AHero12";
	if((randheroe == 12) || (randheroe == 37))
		heroe = "AHero13";
	if((randheroe == 13) || (randheroe == 36))
		heroe = "AHero14";
	if((randheroe == 14) || (randheroe == 35))
		heroe = "AHero15";
	if((randheroe == 15) || (randheroe == 34))
		heroe = "AHero16";
	if((randheroe == 16) || (randheroe == 33))
		heroe = "AHero17";
	if((randheroe == 17) || (randheroe == 32))
		heroe = "AHero18";
	if((randheroe == 18) || (randheroe == 31))
		heroe = "AHero19";
	if((randheroe == 19) || (randheroe == 30))
		heroe = "AHero20";
	if((randheroe == 20) || (randheroe == 29))
		heroe = "AHero21"; 
	if((randheroe == 21) || (randheroe == 28))
		heroe = "AHero22"; 
	if((randheroe == 22) || (randheroe == 27))
		heroe = "AHero23"; 
	if((randheroe == 23) || (randheroe == 26))
		heroe = "AHero24"; 
	if((randheroe == 24) || (randheroe == 25))
		heroe = "AHero25";  
         
Sleep(rand(60000) + 20000);

if (EnvReadString(.settlement, "contratar") != "on")
return;


if ((.settlement.gold>=2000) && (Count(.player, heroe) == 0)){
  .settlement.SetGold(.settlement.gold - 2000);
	newunit = Place(heroe, .pos, .player);
	if(newunit.IsValid){
  	newunit.SetStamina(10);         
  	newunit.SetLevel(rand(20)+1);
	.settlement.ForceAddUnit(newunit);
	PlaySound("SOUNDS/NOTIFICATIONS/HEROE NEUTRAL.WAV");
if(EnvReadInt(this, "Punto") == 1){
		
punto = Point( EnvReadInt(this, "X") , EnvReadInt(this, "Y") );

newunit.SetCommand("move", punto);}

if((EnvReadInt(this, "Punto") == 0) && (.settlement.Units.count > 1 )){
newunit.SetCommand("move", .GetExitPoint(newunit, .pos) + Point(150, 200));}

			   }
												}


}