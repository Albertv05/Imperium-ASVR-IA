
if ( (owner.AsUnit.FindItem("Golden Ankh").IsValid()) && (owner.AsUnit.FindItem("Ankh de plata").IsValid()) && (owner.AsUnit.FindItem("Ankh de cobre").IsValid()) ){
owner.ExchangeItem(owner.FindItem("Ankh de cobre"),"Talisman de los tres Ankh");
owner.AsUnit().RemoveItem("Golden Ankh");
owner.AsUnit().RemoveItem("Ankh de plata");
}
