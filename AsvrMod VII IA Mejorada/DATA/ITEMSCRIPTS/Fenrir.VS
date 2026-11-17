//void, Obj owner
Unit this, u;
int max;
this = owner.AsUnit();
max = 5;
if ((owner.AsUnit.FindItem("Colmillo de Fenrir").IsValid) && (owner.AsUnit.FindItem("Anillo de los aullidos").IsValid()) && (owner.AsUnit.FindItem("Fauces pavorosas").IsValid()))
max = 20;

if (rand(1000) > 250) return;
 
if (!.IsValid) return;

if ( (!.InHolder) && ( Count(owner.AsUnit().player, "Fenrir") < max) ){
u = Place("Fenrir", .pos+Point(rand(1000)-rand(2000), rand(1000)-rand(2000)), .player);
u.SetLevel(owner.AsUnit().inherentlevel);
u.SetCommand("spawn");
u.SetCommand("move", (.pos));
      }