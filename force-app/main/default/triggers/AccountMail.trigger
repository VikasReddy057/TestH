trigger AccountMail on Account (after update) {
    
    list<Account> acclst = Trigger.new;
    
            String Street = '';
            String City = '';
            String State = '';
            String PostalCode = '';
            String Country = '';
    
    list<Contact> cc=new list<Contact>();
            
    
    for(Account acc : acclst)
    {
               Street = acc.BillingStreet;  
            City = acc.BillingCity;
               State = acc.BillingState;
            PostalCode = acc.BillingPostalCode;
            Country = acc.BillingCountry;
    }
     List<Contact> contactList =[select MailingStreet,MailingCity, MailingState,MailingPostalCode,MailingCountry 
                         from Contact where Account.ID IN : acclst];
    
    for(Contact con : contactList)
    {
           con.MailingStreet = Street;
             con.MailingCity =  City;
             con.MailingState = State;
             con.MailingPostalCode = PostalCode;
             con.MailingCountry = Country;
        cc.add(con);
    }
    update cc;
    
}