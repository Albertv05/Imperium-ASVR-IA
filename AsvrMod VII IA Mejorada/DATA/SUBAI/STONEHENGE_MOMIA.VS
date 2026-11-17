// void, Obj This

Building this;
Unit u;
Query qSight, qEnemies;

this = This.AsBuilding();
if (!.IsValid()) return;


PlaySound("data/Sound Entities/StonehengeSpell.xml");
ShowAnnouncement("An", "Invocando Momia");
Sleep(10000);

u = Place("Momia", .pos+Point(rand(120)+20, rand(120)+20), 16);
        if(u.IsValid){
	qSight = VisibleObjsInSight(u, "Unit");
	qEnemies = Intersect(qSight, Union(EnemyObjs(u.player, "Military"),EnemyObjs(u.player, "BaseMage")));
        	u.SetLevel(rand(50) + 1);
		u.SetPlayer(qEnemies.GetObjList()[0].player);
                CreateFeedback("Lightning", u);
        }
HideAnnouncement("An");
