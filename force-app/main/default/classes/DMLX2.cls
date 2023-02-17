public class DMLX2 {
    
    public static void recordstoupdate(String name)
    {
        list<Account> lstacc=[select id,name,rating,industry from account where industry=:name];
        
        if(!lstacc.isEmpty())
        {
            for(Account aa: lstacc)
            {
               aa.Rating='Hot';
               aa.Ownership='Manager';
            }
           Account a= new Account();
            
            a.Name='senapthiconn';
            a.Industry='Banking';
            a.Active__c='yes';
            
            insert a;
            
            update lstacc;
        }
    }

}