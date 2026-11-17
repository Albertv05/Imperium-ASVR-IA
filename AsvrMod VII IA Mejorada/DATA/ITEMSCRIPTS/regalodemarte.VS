//void, Obj owner, Obj victim


if (Count(owner.player, "MLider3") == 0){

if (owner.IsValid()) {
	owner.RemoveItem("Regalo de Marte");
	}
}

if (Count(owner.player, "MLider3") > 0){

if (owner.IsValid() && rand(1000) > 500) {
	owner.RemoveItem("Regalo de Marte");
	}
}