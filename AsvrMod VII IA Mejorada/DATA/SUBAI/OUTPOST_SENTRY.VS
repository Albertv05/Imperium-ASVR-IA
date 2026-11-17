// void, Obj This

Building this;
Query q;
str class_unit;
int i, new_level, old_player, r;
ObjList listInHolder, listSentry, listTown;
Obj new_sentry;
Unit u; 

this = This.AsBuilding();

if (!.IsValid()) return;
//pr("outpost sentry dziala");
Sleep(rand(7000) + 7000);
old_player = .player;
//sentry_class_name = .GetSentryClassName();

listInHolder = .settlement.Units();
if(listInHolder.count > 0){
	if (.settlement.IsIndependent())
	{
		u = listInHolder[rand(listInHolder.count)].AsUnit(); 
	        if(u.IsValid){
	                if(u.AsUnit.race == Gaul)
	                        class_unit = "GSentry2";
	                if(u.AsUnit.race == Britain)
	                        class_unit = "BSentry2";
	                if(u.AsUnit.race == Germany)
	                        class_unit = "TSentry2"; 
	                if(u.AsUnit.race == ImperialRome || u.race == RepublicanRome)
	                        class_unit = "RSentry2"; 
	                if(u.AsUnit.race == Carthage)
	                        class_unit = "CSentry2"; 
	                if(u.AsUnit.race == Iberia)
	                        class_unit = "ISentry2"; 
	                if(u.AsUnit.race == Egypt)
	                        class_unit = "ESentry2"; 
	        }                       
        } else {
        	r = EnvReadInt(.player, "RACE");               
                       
                if (r==Carthage){
	               class_unit = "CSentry2";
	        } else if (r==Iberia){
	               class_unit = "ISentry2";
	        } else if (r==Britain){
	               class_unit = "BSentry2";
	        } else if (r==Germany){
	               class_unit = "TSentry2";
	        } else if (r==Egypt){
	               class_unit = "ESentry2";
	        } else if (r==Gaul){
	               class_unit = "GSentry2";
	        } else if(r == ImperialRome || r == RepublicanRome){
	               class_unit = "RSentry2"; 
	        }

        }       		

while(.player == old_player){
	Sleep(30000);
        if(.player != old_player) break;
        
        if (!.IsBroken()){

		if(listSentry.count == 0){
	                Sleep(5000);
	                if(.player != old_player) break;
	     
	                if(.class == "COutpost"){
	                        Sleep(rand(3000)+500);
	                        if(.player != old_player) break;
	                        new_sentry = Place("CSentry2", .pos+Point(-180, 20), .player);
	                        if(new_sentry.IsValid)
	                                listSentry.Add(new_sentry);
	                        Sleep(rand(3000)+500); 
	                        if(.player != old_player) break;
	                        new_sentry = Place("CSentry2", .pos+Point(-110, 80), .player);
	                        if(new_sentry.IsValid)   
	                                listSentry.Add(new_sentry);
	                        Sleep(rand(3000)+500); 
	                        if(.player != old_player) break;
	                        new_sentry = Place("CSentry2", .pos+Point(-100, -200), .player);
	                        if(new_sentry.IsValid) 
	                                listSentry.Add(new_sentry);
	                        Sleep(rand(3000)+500);
	                        if(.player != old_player) break; 
	                        new_sentry = Place("CSentry2", .pos+Point(170, -255), .player);
	                        if(new_sentry.IsValid)  
	                                listSentry.Add(new_sentry);
	                } else if(.class == "BOutpost"){ 
	                        Sleep(rand(3000)+500);
	                        if(.player != old_player) break; 
	                        new_sentry = Place("BSentry2", .pos+Point(-180, 20), .player);
	                        if(new_sentry.IsValid) 
	                                listSentry.Add(new_sentry);
	                        Sleep(rand(3000)+500);
	                        if(.player != old_player) break; 
	                        new_sentry = Place("BSentry2", .pos+Point(-110, 80), .player); 
	                        if(new_sentry.IsValid) 
	                                listSentry.Add(new_sentry);
	                        Sleep(rand(3000)+500);
	                        if(.player != old_player) break; 
	                        new_sentry = Place("BSentry2", .pos+Point(-125, -200), .player);
	                        if(new_sentry.IsValid) 
	                                listSentry.Add(new_sentry);
	                        Sleep(rand(3000)+500); 
	                        if(.player != old_player) break;
	                        new_sentry = Place("BSentry2", .pos+Point(100, -150), .player); 
	                        if(new_sentry.IsValid)  
	                                listSentry.Add(new_sentry);
	                } else if(.class == "IOutpost"){ 
	                        Sleep(rand(3000)+500);
	                        if(.player != old_player) break; 
	                        new_sentry = Place("ISentry2", .pos+Point(-210, -10), .player);
	                        if(new_sentry.IsValid) 
	                                listSentry.Add(new_sentry);
	                        Sleep(rand(3000)+500); 
	                        if(.player != old_player) break;
	                        new_sentry = Place("ISentry2", .pos+Point(-150, 45), .player); 
	                        if(new_sentry.IsValid) 
	                                listSentry.Add(new_sentry);
	                        Sleep(rand(3000)+500);
	                        if(.player != old_player) break; 
	                        new_sentry = Place("ISentry2", .pos+Point(-160, -230), .player);
	                        if(new_sentry.IsValid) 
	                                listSentry.Add(new_sentry);
	                        Sleep(rand(3000)+500);
	                        if(.player != old_player) break; 
	                        new_sentry = Place("ISentry2", .pos+Point(150, -240), .player); 
	                        if(new_sentry.IsValid) 
	                                listSentry.Add(new_sentry);
	                } else if(.class == "ROutpost"){ 
	                        new_sentry = Place("RSentry2", .pos+Point(200, 30), .player);
	                        if(new_sentry.IsValid)  
	                                listSentry.Add(new_sentry);
	                        Sleep(rand(3000)+500); 
	                        if(.player != old_player) break;
	                        new_sentry = Place("RSentry2", .pos+Point(150, 85), .player); 
	                        if(new_sentry.IsValid)  
	                                listSentry.Add(new_sentry);
	                        Sleep(rand(3000)+500);
	                        if(.player != old_player) break; 
	                        new_sentry = Place("RSentry2", .pos+Point(-195, -260), .player);
	                        if(new_sentry.IsValid)  
	                                listSentry.Add(new_sentry);
	                        Sleep(rand(3000)+500);
	                        if(.player != old_player) break; 
	                        new_sentry = Place("RSentry2", .pos+Point(-135, -320), .player); 
	                        if(new_sentry.IsValid)  
	                                listSentry.Add(new_sentry);
	                        Sleep(rand(3000)+500); 
	                        if(.player != old_player) break;
	                } else if(.class == "EOutpost"){ 
	                        Sleep(rand(3000)+500); 
	                        if(.player != old_player) break;
	                        new_sentry = Place("ESentry2", .pos+Point(-40, 50), .player);
	                        if(new_sentry.IsValid)  
	                                listSentry.Add(new_sentry);
	                        Sleep(rand(3000)+500);
	                        if(.player != old_player) break; 
	                        new_sentry = Place("ESentry2", .pos+Point(175, -55), .player); 
	                        if(new_sentry.IsValid)  
	                                listSentry.Add(new_sentry);
	                        Sleep(rand(3000)+500);
	                        if(.player != old_player) break; 
	                        new_sentry = Place("ESentry2", .pos+Point(-185, -135), .player);
	                        if(new_sentry.IsValid)  
	                                listSentry.Add(new_sentry);
	                        Sleep(rand(3000)+500); 
	                        if(.player != old_player) break;
	                        new_sentry = Place("ESentry2", .pos+Point(100, -400), .player); 
	                        if(new_sentry.IsValid)  
	                                listSentry.Add(new_sentry);
	                } else if(.class == "GOutpost"){ 
	                        Sleep(rand(3000)+500);
	                        if(.player != old_player) break; 
	                        new_sentry = Place("GSentry2", .pos+Point(98, 36), .player);
	                        if(new_sentry.IsValid)  
	                                listSentry.Add(new_sentry);
	                        Sleep(rand(3000)+500);
	                        if(.player != old_player) break; 
	                        new_sentry = Place("GSentry2", .pos+Point(160, -25), .player); 
	                        if(new_sentry.IsValid)  
	                                listSentry.Add(new_sentry);
	                        Sleep(rand(3000)+500); 
	                        if(.player != old_player) break;
	                        new_sentry = Place("GSentry2", .pos+Point(-160, -100), .player);
	                        if(new_sentry.IsValid)  
	                                listSentry.Add(new_sentry);
	                        Sleep(rand(3000)+500);
	                        if(.player != old_player) break; 
	                        new_sentry = Place("GSentry2", .pos+Point(-85, -160), .player); 
	                        if(new_sentry.IsValid)  
	                                listSentry.Add(new_sentry);
	                } else if(.class == "TOutpost"){ 
	                        Sleep(rand(3000)+500);
	                        if(.player != old_player) break; 
	                        new_sentry = Place("TSentry2", .pos+Point(-170, 80), .player);
	                        if(new_sentry.IsValid)  
	                                listSentry.Add(new_sentry);
	                        Sleep(rand(3000)+500);
	                        if(.player != old_player) break; 
	                        new_sentry = Place("TSentry2", .pos+Point(-100, 130), .player); 
	                        if(new_sentry.IsValid)  
	                                listSentry.Add(new_sentry);
	                        Sleep(rand(3000)+500);
	                        if(.player != old_player) break; 
	                        new_sentry = Place("TSentry2", .pos+Point(75, 140), .player);
	                        if(new_sentry.IsValid)  
	                                listSentry.Add(new_sentry);
	                        Sleep(rand(3000)+500); 
	                        if(.player != old_player) break;
	                        new_sentry = Place("TSentry2", .pos+Point(-140, -80), .player); 
	                        if(new_sentry.IsValid)  
	                                listSentry.Add(new_sentry);
	                } 

	        }

        	q = ClassPlayerObjs("BaseTownhall", .player);
	        listTown = q.GetObjList();
	        new_level = EnvReadInt(listTown[0].AsBuilding.settlement, "SentriesLevel");
	        listSentry.ClearDead();
	        for(i=0; i<listSentry.count; i+=1) {

	                if(listSentry[i].AsUnit.IsValid){
	                        
	                        if(listSentry[i].AsUnit.level < new_level){
	                                listSentry[i].AsUnit().SetLevel(new_level);

	                        }                

	                        if(listSentry[i].AsUnit.command == "idle")
	                                listSentry[i].SetCommand("guard", This);
	                        
	                } else
	                        listSentry.Remove(listSentry[i]);    
	        }
        } else break;

} 

for(i=0; i<listSentry.count; i+=1) {
	Sleep(1000);
	if(listSentry[i].AsUnit.IsValid) 
		listSentry[i].Damage(10000);
	}
}


