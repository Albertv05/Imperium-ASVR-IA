// void, Obj This

Unit this, u;
Settlement sett;
Building bld;
int i;
point ptGo;

//Sleep(1120+rand(GetConst("RandTimeStart"))+GetConst("AddTimeStart"));

this = This.AsUnit;  

while(!.IsValid) Sleep(10000);

while(.IsValid){
	Sleep(2000);
	if(.InHolder){
		if(.health > 0){
			bld = .GetHolderSett.GetCentralBuilding;
			if(bld.IsHeirOf("BaseTownhall") ||
			   bld.IsHeirOf("Outpost")){
				sett = .GetHolderSett;
				
				for(i=0; i<sett.UnitsCount; i+=1){
					Unit u; u = sett.Units[i].AsUnit;
					
					if(u.IsHeirOf("TaxCollector"))
						if(u != this){
							//pr("in holder");
							ptGo.Set(bld.radius,bld.radius);
							u.SetCommand("move", u.posRH+ptGo);
							//u.SetEntering(false);
						}
					
				}
				sett.SetGold(sett.gold+2);
				sett.GoldConverted(2);
			}
		}
	}
}