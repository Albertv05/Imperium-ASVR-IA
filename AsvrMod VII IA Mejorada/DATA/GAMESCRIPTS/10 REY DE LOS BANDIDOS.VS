//Teuton: cTTent
//void, int player
/*
	By El Jüsticiero Misteryoso
	No plagiar! Protegido por los derechos intelectuales.
*/

ObjList ol, t_ol;
Query q;
int teutones, t_teutones, comida;

ol = ObjsInRect(GetMapRect(), cTTent).GetObjList();
q = ClassPlayerObjs(cBaseTownhall, player);
if(q.count == 0) return;
EnvWriteInt("Jugs", EnvReadInt("Jugs") + 1);

teutones = ol.count;
if(teutones < 1){
	PrintMsg(player, "[Rey de los bandidos]: No hay bandidos en el mapa.");
	PrintMsg(player, "[Rey de los bandidos]: No se puede jugar en este modo.");
	PrintMsg(player, "[Rey de los bandidos]: Mas info en www.imperivmymas.es.kz");
	return;
}
while(true){
	Sleep(1000);
	t_ol = ol.ObjPlayer(player);
	t_teutones = t_ol.count;

	if(t_teutones == teutones - 1){
		ShowAnnouncement("An", "Al jugador " + player + " le falta");
		ShowAnnouncement("An2", "un solo bandido para la victoria.");
	}else{
		HideAnnouncement("An");
		HideAnnouncement("An2");
	}

	if(t_teutones == teutones)
		EnvWriteInt("Fin", player);

	if(EnvReadInt("Fin") != 0 && EnvReadInt("Fin") != player){
		SetPlayerStatus(player, 1, "Perdiste", true);
		SetPlayerStatus(player, 0, true);
		EndGame(player, true);
		return;
	}

	if(t_teutones == 0) continue;

	t_ol[0].AsBuilding.settlement.SetFood(t_ol[0].AsBuilding.settlement.food + 100);
}