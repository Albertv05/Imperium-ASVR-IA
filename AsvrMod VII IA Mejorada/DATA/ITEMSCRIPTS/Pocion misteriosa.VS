//void, Obj owner
Unit this;
int deseo;
 
this = owner.AsUnit;
deseo = rand(6);

if (this.IsValid){

if (deseo == 0){
.ExchangeItem(.FindItem("Pocion misteriosa"), "Pocion venenosa");
			}
if (deseo == 1){
.ExchangeItem(.FindItem("Pocion misteriosa"), "Healing herbs");
			}
if (deseo == 2){
.ExchangeItem(.FindItem("Pocion misteriosa"), "Pocion energizante");
			}
if (deseo == 3){
.ExchangeItem(.FindItem("Pocion misteriosa"), "Pocion reveladora");
			}
if (deseo == 4){
.ExchangeItem(.FindItem("Pocion misteriosa"), "Pocion sombria");
			}
if (deseo == 5){
.ExchangeItem(.FindItem("Pocion misteriosa"), "Pocion extraordinaria");
			}


		}
