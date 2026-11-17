//void, Obj This

Unit this;
int i;

this = This.AsUnit;

Sleep(rand(1073) + 571);

if (!.IsValid) while(true) Sleep(50000);

while(.IsAlive) {

if (.IsVisible){
.RemoveBonus(600, 0, 0, 0 ,0);
Sleep(5000);}


if ((.TimeWithoutAttack >= 20000) && (.IsVisible)){
.RemoveBonus(600, 0, 0, 0 ,0);
.SetVisible(false);
Sleep(5000);
.AddBonus(600, 0, 0, 0 ,0);}

}

//prevent behavior script from terminating (this will lockup the game)
while(true) Sleep(50000);

