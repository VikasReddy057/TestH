trigger namecon on Contact (before insert,before update ) {
    
    
    string nam = 'harsha';
    
    list<Contact>  cc =new list<Contact>();
    
    for(Contact c : Trigger.new)
    {
        
        c.lastName = nam ;
        cc.add(c);
    }
    update cc;
}