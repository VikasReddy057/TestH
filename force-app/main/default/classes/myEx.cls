public class myEx {
    
    public static void nameu(String nameuu)
    {
        
       nameuu += '%';   
        list<Account> acclst = [select id ,  name, industry from account where name like : nameuu];
       
        for(Account acc : acclst )
        {
            acc.AnnualRevenue=4525252;
            acc.Rating='hot';
        }
        
    }

}