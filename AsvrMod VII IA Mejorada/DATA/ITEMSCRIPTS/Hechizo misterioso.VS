//void, Obj owner
Unit this;
int deseo;
 
this = owner.AsDruid;
deseo = rand(7);

if (this.IsValid){

if (deseo == 0){
.ExchangeItem(.FindItem("Hechizo misterioso"), "Hechizo convocar espiritus");
			}
if (deseo == 1){
.ExchangeItem(.FindItem("Hechizo misterioso"), "Hechizo tormenta");
			}
if (deseo == 2){
.ExchangeItem(.FindItem("Hechizo misterioso"), "Hechizo deflagracion");
			}
if (deseo == 3){
.ExchangeItem(.FindItem("Hechizo misterioso"), "Hechizo sanacion");
			}
if (deseo == 4){
.ExchangeItem(.FindItem("Hechizo misterioso"), "Hechizo corrupcion");
			}
if (deseo == 5){
.ExchangeItem(.FindItem("Hechizo misterioso"), "Hechizo proteccion arcana");
			}
if (deseo == 6){
.ExchangeItem(.FindItem("Hechizo misterioso"), "Hechizo iluminacion");
			}
		
		}