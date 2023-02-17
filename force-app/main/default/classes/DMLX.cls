public class DMLX {

    public static void recdel(String character)
    {
        character +='%';
         list<Contact> lstcon= [Select id,lastname,phone from contact where lastname like : character];
        
        if(!lstcon.isEmpty())
        {
            for(Contact c : lstcon)
            {
                delete c;
            }
        }
    }
}