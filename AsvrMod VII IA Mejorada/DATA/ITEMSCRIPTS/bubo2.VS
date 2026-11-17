while(true){
Sleep(3000);
if (GetUseCount() < 100)
SetUseCount(GetUseCount() + 1);
}

