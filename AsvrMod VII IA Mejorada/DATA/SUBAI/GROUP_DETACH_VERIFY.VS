//bool, ObjList objs, str OUT reasonText
int i;

if (objs.count == 0) 
	return false;

for(i = 0; i < objs.count(); i += 1)
{
	if(objs[i].AsUnit.IsValid)
		if((objs[i].AsUnit.hero.IsValid) && (!objs[i].AsUnit.hero.HasItem("Aheroe21")))
			return true;
}

if ((objs[i].AsUnit.hero.IsValid) && (objs[i].AsUnit.hero.HasItem("Aheroe21"))){
reasonText = rollover(objs[0], true) + "\n<color 255 0 0>" + "Los aprendices no pueden separarse de Branh";}

if (!objs[i].AsUnit.hero.IsValid){
reasonText = rollover(objs[0], true) + "\n<color 255 0 0>" + Translate("Not attached to hero");}

return false;
