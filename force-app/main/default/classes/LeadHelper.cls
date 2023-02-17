public class LeadHelper {

    public void CreateNewLead(String lastname,string company,String phone,String website,Integer annualrevenue)
    {
        Lead l= new Lead();
        l.LastName=lastname;
        l.Company=company;
        l.Phone=phone;
        l.Website=website;
        l.AnnualRevenue=annualrevenue;
        insert l;
        if(l.Id!=null)
        {
            system.debug('created case id is'+' '+l.Id);
        }
    }
    
    
}