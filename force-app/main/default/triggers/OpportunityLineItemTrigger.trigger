trigger OpportunityLineItemTrigger on OpportunityLineItem (before insert) {
    
    public static List<ID> opportunityIDs = new List<ID>();
    public static Map<Id,Id> productIDs = new Map<Id,Id>();
    public class MyException extends Exception {}
    if(Trigger.isInsert && Trigger.isBefore)
    {
        
        for (OpportunityLineItem product : Trigger.New) 
        {
            productIDs.put(product.Product2Id,product.Product2Id);
            opportunityIDs.add(product.opportunityId);
        }
        List<OpportunityLineItem> opportunityLineitems = [select id,OpportunityId,Product2Id,Quantity from OpportunityLineItem where OpportunityId In :opportunityIDs];
        for(OpportunityLineItem oppLine : opportunityLineitems)
        {
            if(productIDs.containsKey(oppLine.Product2Id))
            {
                throw new MyException('Already added this product. So use existing Opportunitylineitem to increase Quantity');
            }
        } 
    }  
    
    
    
}