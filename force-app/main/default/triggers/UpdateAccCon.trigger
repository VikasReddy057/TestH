trigger UpdateAccCon on Opportunity (before insert) {
set<Id> accIds = new set<Id>();
    list<Id> conIds= new list<Id>();
    set<Id>  camIds=new set<Id>();
    set<Id> sfcIds=new set<id>();
    list<campaign> cs=new list<campaign>();
    list<opportunity> cmps=new list<opportunity>();
    list<account> Accounts_DateUpdate = new list<account>();
    list<contact> contacts_DateUpdate=new list<contact>();
    list<account> Accounts_AmountUpdate = new list<account>();
    list<contact> contacts_AmountUpdate=new list<contact>();
    list<opportunity> OpplistToUpdate = new list<opportunity>();
    Id donorRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByDeveloperName().get('Donation').getRecordTypeId();
   if(trigger.isInsert || Trigger.isUpdate)
    {
    if(checkRecursive.run==true){
    for(opportunity o:trigger.new){
        accIds.add(o.accountId);
        conIds.add(o.contactId);
        camIds.add(o.campaignId);
    }
        
    Map<Id,contact> contactmap = new Map<Id,contact>([Select id,lastName, (Select id, closedate, amount,stageName,RecordType.Name From Opportunities
                                                                           WHERE RecordType.Name='Donation' and StageName='closed won' and Amount !=null) from contact
                                                                           where Id IN : conIds OR Id IN:sfcIds]);
                                                                           
                                                                            
         List<OpportunityWrapper> oppyListSortByAmount = new List<OpportunityWrapper>();
         List<OpportunityWrapper> oppyListSOrtByCloseDate = new List<OpportunityWrapper>();     
         Map<Id,Contact> conMap = new Map<Id,Contact>();         
        for(Opportunity opp :trigger.new){
            Id ProcessConId;
            oppyListSortByAmount = new List<OpportunityWrapper>();
            oppyListSOrtByCloseDate = new List<OpportunityWrapper>();   
            
            
            if(opp.ContactId!=null) ProcessConId = opp.ContactId;
            
            if(ProcessConId!=null){
                if(contactmap.containsKey(ProcessConId)){
                    Contact con = contactmap.get(ProcessConId);
                    
                        if(con.Opportunities!=null && con.Opportunities.size()>0){
                            oppyListSortByAmount = OpportunityTriggerUtility.sortbyAmount(con.Opportunities);
                            oppyListSOrtByCloseDate = OpportunityTriggerUtility.sortbyCloseDate(con.Opportunities);
                            con.First_Gift_Amount__c=  oppyListSOrtByCloseDate.get(0).oppy.Amount;
                            con.First_Gift_Date__c = oppyListSOrtByCloseDate.get(0).oppy.CloseDate;
                            con.Last_Gift_date__c= oppyListSOrtByCloseDate.get(oppyListSOrtByCloseDate.size()-1).oppy.CloseDate;
                            con.Last_Gift_Amount__c= oppyListSOrtByCloseDate.get(oppyListSOrtByCloseDate.size()-1).oppy.Amount;
                           // con.Largest_Gift_Date__c= oppyListSortByAmount.get(oppyListSortByAmount.size()-1).oppy.CloseDate;
                            con.Largest_gift_Amount__c=oppyListSortByAmount.get(oppyListSortByAmount.size()-1).oppy.Amount;
                            con.Average_Gift__c= OpportunityTriggerUtility.averageAmount(con.Opportunities);
                            con.Smallest_Gift__c=  oppyListSortByAmount.get(0).oppy.Amount;
                            con.Best_Gift_year__c= String.Valueof(oppyListSortByAmount.get(oppyListSortByAmount.size()-1).oppy.CloseDate.year());
                            conMap.put(con.Id,con);
                        }
                        
                    
               }
            }
            
                 

        }       
  
    if(conMap.size()>0){
        contacts_DateUpdate.AddAll(conMap.values());
        update contacts_DateUpdate;
    }
   
  
  
  
   
       //this is recursive update,  we have to use static boolean for avioding recursive
   checkRecursive.run = false;
     
       
    }
    
    // we dont need to update the campaign. we have to update contact and this was inside the FOR loop

}
    
}