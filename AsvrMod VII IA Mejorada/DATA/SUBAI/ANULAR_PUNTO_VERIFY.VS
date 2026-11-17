//bool, ObjList objs, str OUT reasonText
// cmdparam is like this ReqSet, <research>, <explanation>, ReqPlr, <research>, <explanation>, SetsPlr, <env>, <value>, SetsSet, <env>, <value>, NamePlr, <research>, NameSet, <research>

Building this;
str dest, name, names, token, value;
dest = cmdparam;
this = objs[0].AsBuilding();

if(!.IsValid()) return false;

if(EnvReadInt(this, "Punto") == 0)
	return false;
return true;