// void, Obj This 

Druid this;
ObjList ol;
Unit u;
int i, k, nCount;
point pt, pt1;

this = This.AsDruid();

pt = This.pos;

if (!This.IsValid()) return;
if (.IsValid()){


.PlayAnim(19, .pos);
.Deselect(.player);
.SetNoselectFlag(true);

for(k=0;k<30;k+=1){
pt1 = pt+Point(-rand(400) + 200, -rand(400) + 200);

CreateFeedback("Lightning2", pt1);

ol = ObjsInCircle(pt1,(50),"Unit").GetObjList();

nCount=0;

if (ol.count>0)
   for (i=0; ol.count!=0 && i<100 && nCount<10; i+=1) {
       u = ol[rand(ol.count)];
       if (u.IsDead()) continue;
           nCount+=1;
           u.Damage(20 + .AsDruid().level);
           ol.Remove(u);
   }

PlaySound("SOUNDS/NOTIFICATIONS/TRUENO.OGG");
CreateFeedback("Parry", .AsDruid, 1000);
Sleep(rand(900)+100);

}
.Damage(.health);

}