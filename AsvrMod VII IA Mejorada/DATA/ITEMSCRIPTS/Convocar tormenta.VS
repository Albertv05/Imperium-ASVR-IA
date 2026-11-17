//void, Obj owner

ObjList ol;
int i, nCount;
point pt;
Unit this, u;

this = owner.AsDruid();

if (!.IsValid) return;
if (.InHolder) return;

SetUseCount(5 + .inherentlevel);

while ((GetUseCount > 0) && (.IsAlive)){

Sleep(1000);
PlaySound("SOUNDS/NOTIFICATIONS/TRUENO.OGG");

pt = .pos+Point(-rand(400) + 200, -rand(400) + 200);

CreateFeedback("Lightning2", pt);

ol = ObjsInCircle(pt,(50),"Unit").GetObjList();

nCount=0;

if (ol.count>0)
   for (i=0; ol.count!=0 && i<100 && nCount<10; i+=1) {
       u = ol[rand(ol.count)];
       if (u.IsDead()) continue;
       if (u == this) continue;
           nCount+=1;
           u.Damage(100);
           ol.Remove(u);
   }
   ItemUsed(1);
 } 
.RemoveItem("Hechizo tormenta"); 

//prevent behavior script from terminating (this will lockup the game)
while(true) Sleep(50000);
