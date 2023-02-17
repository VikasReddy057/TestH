public class AccountHelperClass {
    
    public void AccountHelper()
    {
        account acc = new account();
            
        acc.Name='DHONI';
        acc.AnnualRevenue=50000;
        acc.Active__c='Yes';
        acc.Industry='Banking';
        insert acc;
        
       if(acc.id !=null)
       {
           System.debug('id is'+acc.id);
           createNewCase(acc.id);
       }
    }
           public void createNewCase(ID accId)
           {
           Case cs=new Case();
               cs.AccountId=accId;
           cs.Subject='Radio is not Working Fine';
           cs.Priority='High';
           cs.Origin='phone';
           
           insert cs;
           
           if(cs.Id!=null)
           {
               System.debug('case id is'+cs.Id);
           }
           
       }
           
}