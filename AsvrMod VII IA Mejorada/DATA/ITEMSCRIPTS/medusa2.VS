while(true){
Sleep(9000);
if (GetUseCount() < 100)
SetUseCount(GetUseCount() + 1);

}
