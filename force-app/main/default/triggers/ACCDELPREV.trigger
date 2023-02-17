trigger ACCDELPREV on Account (before insert) {
    
    list<Account> a = trigger.old;
    
   list<Account> acc = [SELECT id,(SELECT id FROM Opportunities ) FROM account where Id=:a];
   
    for(Account aa : acc)
    {
    if(aa.Opportunities.size()>0){
           trigger.oldmap.get(aa.id).addError('Cant delete this account');
          // system.debug('total opprtunities are'+ aa.Opportunities.size());
        
    }
    }

}