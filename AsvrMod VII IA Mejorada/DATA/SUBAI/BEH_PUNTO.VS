//void, Obj This

Building 
this;

point punto;



this = This.AsBuilding();



if(!.IsValid) return;



while(1){
	
Sleep(1000);
	
if(EnvReadInt(this, "Punto") == 1){
		
punto = Point( EnvReadInt(this, "X") , EnvReadInt(this, "Y") );
		
}
}