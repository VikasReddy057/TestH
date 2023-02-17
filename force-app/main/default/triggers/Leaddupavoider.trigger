trigger Leaddupavoider on Lead (before insert) {
 List<Lead> accObj = [Select id, Name from Lead]; 
    Map<string,Lead> accMap = new  Map<string,Lead>();
    
    for(Lead ac : accObj){
        accMap.put(ac.Name, ac);
    }
    
    for(Lead acc: Trigger.New){
        if(accMap.containsKey(acc.Name)){
            acc.addError('Duplicate Record Found'); 
        }
        
    } }