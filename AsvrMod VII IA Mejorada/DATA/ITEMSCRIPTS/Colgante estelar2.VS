while(true){
Sleep(6000);
if (GetUseCount() < 100)
SetUseCount(GetUseCount() + 1);
}
