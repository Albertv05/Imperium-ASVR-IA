//void, Obj owner

ObjList ol;
Unit u, this;
int i, nCount;

this = owner.AsUnit();


if (rand(1000) > 500){
	


ol = ObjsInRange(this, "Unit", 300).GetObjList();
nCount=0;
if (ol.count>0)
for (i=0; ol.count!=0 && i<100 && nCount<1; i+=1) {
	u = ol[rand(ol.count)];
	if (u.IsDead()) continue;
	if (.IsEnemy(u)) {
		nCount+=1;
		CreateFeedback("Lightning2", u);
		u.Damage(100);
		u.SetStamina(0);
		ol.Remove(u);
				}
							}
return;

}
