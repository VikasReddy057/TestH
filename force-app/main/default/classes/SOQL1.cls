public class SOQL1 {
    
    public  void city(String cityname)
        
    {
        
        cityname+='%';
        
        list<Account> acclst = [select id,name,industry,rating from account where Industry like :cityname Order by industry];
       
        
        if(!acclst.isEmpty())
        {
            for(Account aa : acclst)
        {
            System.debug('accounts are'+aa);
        } 
        }
       
    }

}