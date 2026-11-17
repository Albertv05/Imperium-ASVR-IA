//void, Obj owner

ObjList ol;
Unit this, u;
Settlement sett;
Building bld;
int i;

this = owner.AsHero;
if (.AsUnit.IsValid){
while(true){

Sleep(1000);

if (!.InHolder){
if (GetUseCount() < 1000)
SetUseCount(GetUseCount() + 5);
		}


if(.InHolder){
		if(.health > 0){
			bld = .GetHolderSett.GetCentralBuilding;
			if(bld.IsHeirOf("BaseTownhall") || bld.IsHeirOf("Outpost") || bld.IsHeirOf("MercadoArcano")){
				sett = .GetHolderSett;
				sett.SetGold(sett.gold + 5);
				sett.GoldConverted(5);
			}
		}
	}





}
}

