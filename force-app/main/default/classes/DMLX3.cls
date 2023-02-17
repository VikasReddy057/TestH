public class DMLX3 {
    
    public void harshaa()
    {
        list<list<Sobject>> lstresults= [FIND 'harsha*' IN ALL FIELDS RETURNING
                                             account(id,name,industry,rating),
                                              case(id,subject,status),
                                               contact(id,lastname,email),
                                                lead(id,firstname,lastname,company,status)];
        
        if(!lstresults.isEmpty())
        {
           
            list<Account> lstacc=(list<Account>) lstresults.get(0);
                 list<Case> lstcase=(list<Case>) lstresults.get(1);
            list<contact>lstcon=(list<contact>) lstresults.get(2);
            list<lead> lsrlead=(list<lead>)lstresults.get(3);
            
            
         
            for (Account aa : lstacc)
            {
                system.debug('account records are'+aa);
            }
            system.debug('--------------------------');
            
            for (case cc : lstcase)
            {
                system.debug('case records are'+cc);
            }
            system.debug('------------------------------');
            
            for(contact c:lstcon)
            {
                system.debug('contact records are'+c);
            }
            system.debug('------------------------');
            
            for (lead ll:lsrlead)
            {
                system.debug('lead records are'+ll);
            }
            
        }
    }

}