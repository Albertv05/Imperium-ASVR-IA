//void, Obj owner
Unit this;
int deseo;
 
this = owner.AsUnit;
deseo = rand(4);

if (this.IsValid){

if (deseo == 0){
.ExchangeItem(.FindItem("Anillo misterioso"), "Snake skin");
			}
if (deseo == 1){
.ExchangeItem(.FindItem("Anillo misterioso"), "Belt of snakes");
			}
if (deseo == 2){
.ExchangeItem(.FindItem("Anillo misterioso"), "Eagle feather");
			}
if (deseo == 3){
.ExchangeItem(.FindItem("Anillo misterioso"), "Anillo de la sabiduria");
			}

		}