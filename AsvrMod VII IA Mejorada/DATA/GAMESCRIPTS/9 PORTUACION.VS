/*
	By El Jüsticiero Misteryoso
	Protegido por los derechos intelectuales
	Por favor: No plagiar!
**--**--**--**--**--**--**--**--**--**--**--**--**--**
	Objetivo del juego:
	Consiste en conquistar todos los puertos del mapa. El primero que lo logra gana, si pierdes todos tus pertos pierdes.
*/
int puertos, t_puertos, re, i;
ObjList ol, pp, t_pp;

ol = ClassPlayerObjs(cBaseTownhall, player).GetObjList();
if(ol.count == 0) return;
EnvWriteInt("Jugs", EnvReadInt("Jugs") + 1);

pp = ObjsInRect(GetMapRect(), cBaseShipyard).GetObjList();
puertos = pp.count;

Sleep(600);

if(puertos<EnvReadInt("Jugs")){
	if(EnvReadInt("DDD") != 1){
		pr("[Portuacion]: No hay suficientes puertos en el mapa");
		pr("[Portuacion]: Solo mapas con agua, por favor!");
		pr("[Portuacion]: Puertos: " + puertos +"/"+ EnvReadInt("Jugs"));
		EnvWriteInt("DDD", 1);
	}
	return;	
}

re = EnvReadInt("Puertos");
pp[re].SetPlayer(player);
EnvWriteInt("Puertos", re + 1);

while(1){
	Sleep(1000);
	ol[0].AsBuilding().settlement.SetLoyalty(100);
	t_pp = ClassPlayerObjs(cBaseShipyard, player).GetObjList();
	t_puertos = t_pp.count;
	if(t_puertos == puertos){
		for(i=1;i<=8;i+=1)
			if(i!=player && !DiplAreAllied(i, player)){
				SetPlayerStatus(i, 0, "Has perdido", true);
				SetPlayerStatus(i, 0, false);
				EndGame(i, true);
			}else{
				SetPlayerStatus(i, 0, "Has ganado", true);
				SetPlayerStatus(i, 0, false);
				EndGame(i, false);
			}
	}
	HideAnnouncement(player, "TP");
	HideAnnouncement(player, "TP2");

	if(t_puertos > 3) continue;
	ShowAnnouncement(player, "TP", "Te quedan " + t_puertos + " puertos.");
	ShowAnnouncement(player, "TP2", "Conquista mas.");


	if(t_puertos > 0) continue;
	SetPlayerStatus(player, 0, "Has perdido", true);
	SetPlayerStatus(player, 0, false);
	EndGame(player, true);
	return;
}