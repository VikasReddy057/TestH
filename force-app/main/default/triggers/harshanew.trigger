trigger harshanew on Account (before insert) {
    
    
    list<Account> acclst= Trigger.new;
    
    list<Case> cslst = new list<Case>();
    
    for(Account acc : acclst)
    {
        if(acc.AnnualRevenue >= 60000)
        {
           case c =  new case ();
          c.subject ='trouble of start';
          c.id=acc.id;
           c.priority='high';  
          cslst.add(c);
        }
        
    }
    insert cslst;

}