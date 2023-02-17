trigger DonorUpdateCon on Contact (before insert ,before update) {
    
    for(Contact con: Trigger.new){
        If (con.firstname == null ){
           con.Donor__c = true;
        }
    }

}