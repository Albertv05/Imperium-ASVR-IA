if(owner.AsUnit().IsValid){
owner.AsUnit().SetExperience(owner.AsUnit().experience + 1);   
}

if( (owner.AsUnit.FindItem("Yelmo de fand").IsValid()) && owner.AsUnit.FindItem("Armadura de fand").IsValid() ){
owner.AsUnit().SetExperience(owner.AsUnit().experience + 1);  
}