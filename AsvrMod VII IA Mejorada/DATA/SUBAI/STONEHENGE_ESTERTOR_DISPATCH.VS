//void, ObjList objs, point pt, Obj obj, bool bReplace, bool bModifier, int player

Building this;
int cost, segundos;
segundos = 59;
this = objs[0].AsBuilding();
if (!.IsValid()) return;

cost = GetCmdStaminaCost("estertor");
if (.stamina < cost) return;
.SetStamina(.stamina - cost);

.SetCommand("estertor");