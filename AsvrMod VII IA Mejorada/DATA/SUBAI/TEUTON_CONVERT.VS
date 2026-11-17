// void, Obj This

Unit u, this;
this = This.AsUnit();


while (!.Stop(1000));

if (.IsHeirOf("RGladiator") && ( .HasItem("Elite") || .HasItem("Campeon") || .HasItem("Leyenda") ) ){ 
	if (.HasItem("Elite"))
	.ExchangeItem(.FindItem("Elite"),"Guerrero");
	if (.HasItem("Campeon"))
	.ExchangeItem(.FindItem("Campeon"),"Veterano");
	if (.HasItem("Leyenda"))
	.ExchangeItem(.FindItem("Leyenda"),"Elite"); 
 	.Mutate("RLiberatus");}

else if (.IsHeirOf("RHastatus") && ( .HasItem("Veterano") || .HasItem("Elite") || .HasItem("Campeon") || .HasItem("Leyenda") ) ){
	if (.HasItem("Veterano"))
	.ExchangeItem(.FindItem("Veterano"),"Guerrero");
	if (.HasItem("Elite"))
	.ExchangeItem(.FindItem("Elite"),"Veterano");
	if (.HasItem("Campeon"))
	.ExchangeItem(.FindItem("Campeon"),"Elite");
	if (.HasItem("Leyenda"))
	.ExchangeItem(.FindItem("Leyenda"),"Campeon"); 
 	.Mutate("RPrinciple");}

else if (.IsHeirOf("RPrinciple") && ( .HasItem("Elite") || .HasItem("Campeon") || .HasItem("Leyenda") ) ){
	if (.HasItem("Elite"))
	.ExchangeItem(.FindItem("Elite"),"Guerrero");
	if (.HasItem("Campeon"))
	.ExchangeItem(.FindItem("Campeon"),"Veterano");
	if (.HasItem("Leyenda"))
	.ExchangeItem(.FindItem("Leyenda"),"Elite");  
 	.Mutate("RPraetorian");}


else if (.IsHeirOf("NVAEL")){
	if(.hero.IsValid){
	.DetachFrom(.hero);}
	.AddBonus(140, 0, 0, 0, 0);
	.SetSpecial(22, false);
	.SetSpecial(6, false);
	.SetSpecial(30, true);
	.SetSpeedFactor(160);
	.SetPlayer(14);
				}
