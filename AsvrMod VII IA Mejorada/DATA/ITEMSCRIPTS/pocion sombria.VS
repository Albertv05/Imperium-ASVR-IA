//void, Obj owner

if (owner.AsUnit.IsVisible){
CreateFeedback("Invisibility", owner.AsUnit());
owner.AsUnit.SetVisible(false);
ItemUsed(1);
}