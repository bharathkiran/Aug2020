public class OwnerDisplayController {
	@AuraEnabled 
    public static user fetchOwnerDetail(string inId){
        User retUser = null;
        if(String.isNotBlank(inId)){
            Id recId = (Id)inId;
            String sObjName = recId.getSObjectType().getDescribe().getName(); 
            sObject obj = Database.query('Select OwnerId from '+sObjName+ ' WHERE id=: recId');
            String ownerId = (String)obj.get('OwnerId');
            retUser =  [Select id,Name,SmallPhotoUrl, FullPhotoUrl From User Where Id =: ownerId];
        }
        return retuser;
    }
}