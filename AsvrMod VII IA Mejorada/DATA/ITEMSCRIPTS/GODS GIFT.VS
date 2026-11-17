//void, Obj owner, Obj victim

if (Count(owner.player, "RLider3") == 0){

if (owner.IsValid()) {
	if (owner.health < owner.maxhealth) {
		owner.Heal(owner.maxhealth);
		owner.RemoveItem("Regalo de Jupiter");
					}
			}
					}


if (Count(owner.player, "RLider3") > 0){

if (owner.IsValid()) {
	if (owner.health < owner.maxhealth) {
		owner.Heal(owner.maxhealth);
		if (rand(1000) > 500){
		owner.RemoveItem("Regalo de Jupiter");}
					}
			}
					}