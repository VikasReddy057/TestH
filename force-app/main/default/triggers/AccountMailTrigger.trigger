trigger AccountMailTrigger on Account (after update) {
    
    Map<Id,Account>  newmap = Trigger.newMap;
    Map<Id,Account>   oldmap =Trigger.oldmap;
    
    set<ID> lstkey = oldmap.keySet();
    
    for(ID keys : lstkey)
    {
        Account olddata= oldmap.get(keys);
        Account newdata= newmap.get(keys);
        
        if(olddata.BillingStreet != newdata.BillingStreet)
        {
            Contact c = new contact();
            c.MailingStreet =  newdata.BillingStreet;
                     
        }
        
    }
    

}