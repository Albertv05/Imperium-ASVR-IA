/*	+++++++++++++++++++++++++++++++++++++++++
	|	By El Jüsticiero Misteryoso	|
	+++++++++++++++++++++++++++++++++++++++++
No plagiar. Puedes estudiar mis códigos para aprender pero por favor, no los copies. Protegido por los derechos intelectuales.

*/

ObjList ol;
Query q;
int i, in, asal;
Settlement set;
Building b, original;

q = ClassPlayerObjs("BaseTownhall", player);

ShowTutorial("Destruccion", "El objetivo del modo de juego destrucción es destruir todos los edificios del enemigo. Dejar su vida por debajo de cien. Incluídas las puertas.", q.GetObjList()[0]);
original = q.GetObjList()[0].AsBuilding();

while(1){
	bool eliminado = true;

	Sleep(1000);
	original.SetPlayer(player);
	original.settlement.SetLoyalty(100);
	asal = 0;
	for(i=0;i<q.count;i+=1){
		set = q.GetObjList()[i].AsBuilding().settlement;
		ol = set.Buildings();
		for(in=0;in<ol.count;in+=1){
			b = ol[in].AsBuilding();
			if(!b.IsHeirOf("Wall") && !b.IsHeirOf("Tower")){
				if(b.health > 100){
					eliminado = false;
					asal = asal + 1;
				}
			}
		}
	}
	if(asal < 3 && asal > 0)
		SetPlayerStatus(player, 1, "Te quedan " + asal + " edificios.", true);

	if(!eliminado) continue;

	SetPlayerStatus(player, 1, "Eliminado", true);
	SetPlayerStatus(player, 0, false);
	EndGame(player, true);
	return;
}