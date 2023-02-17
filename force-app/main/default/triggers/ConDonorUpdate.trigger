trigger ConDonorUpdate on Opportunity (After insert , After update )  {
    
    set<ID> conID = new set<ID>();
     
    
    List<contact> conList = new List <contact>();
   
     List<opportunity> opp2 = new List <opportunity>();
    
     List<Decimal> OppsAmount = new List <Decimal>();
    
         List<Date> OppsDate = new List <Date>();

    for (opportunity Opp: Trigger.new){
        
         if (Opp.StageName == 'Closed Won'){
             conID.add(opp.Contact__c);
             
              conList = [select Id, Lastname,Donor__c,GiftLargeAmount__c from contact where ID = : conID ];
               
             opp2 = [select id , name,Gift_Amount__c ,Gift_Date__c from opportunity  where Contact__c = : conID ORDER BY Gift_Amount__c DESC , Gift_Date__c ASC LIMIT 1] ;
           
               for(Opportunity O: opp2){
                
                OppsAmount.add(O.Gift_Amount__c);
                   OppsDate.add(O.Gift_Date__c);
                 }
                for (Contact c : conList)
                {
                    c.Donor__c = True ;
                
                 c.GiftLargeAmount__c   = OppsAmount[0];
                
                // c.FirstGiftDate__c = OppsDate[0] ;
                     
            }
          
                         
    }    
        else if( Opp.StageName <> 'Closed Won')
        {
             conID.add(opp.Contact__c);
             
              conList = [select Id, Lastname,Donor__c,GiftLargeAmount__c from contact where ID = : conID ];
               
             opp2 = [select id , name,Gift_Amount__c ,Gift_Date__c from opportunity  where Contact__c = : conID ORDER BY Gift_Amount__c DESC , Gift_Date__c ASC LIMIT 1] ;
           
               for(Opportunity O: opp2){
                
                OppsAmount.add(O.Gift_Amount__c);
                   OppsDate.add(O.Gift_Date__c);
                 }
                for (Contact c : conList)
                {
                    c.Donor__c = true ;
                
                 c.GiftLargeAmount__c   = OppsAmount[0];
                
              //   c.FirstGiftDate__c = OppsDate[0] ;
                     
            } 
            
        }
     
} 
     update(conList);
            
}