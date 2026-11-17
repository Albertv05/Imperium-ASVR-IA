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
ol = ObjsInCircle(this.pos, 500, cUnit).GetObjList();
  ol = ol.ObjPlayer(.player);
  if(ol.count == 0) return;
  for(i=0;i<ol.count;i+=1){
if ((ol[i].AsUnit().food) < (ol[i].AsUnit().maxfood)){
   ol[i].AsUnit().SetFood(ol[i].AsUnit().food+1);
						      }
  			   }
		}


if(.InHolder){
		if(.health > 0){
			bld = .GetHolderSett.GetCentralBuilding;
			if(bld.IsHeirOf("BaseTownhall") || bld.IsHeirOf("Outpost")){
				sett = .GetHolderSett;
				sett.SetFood(sett.food+10);
			}
		}
	}


}


}

//prevent behavior script from terminating (this will lockup the game)
while(true) Sleep(50000);