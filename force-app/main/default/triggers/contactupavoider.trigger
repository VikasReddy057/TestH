trigger contactupavoider on Contact (before insert) {
 List<Contact> accObj = [Select id, Lastname from Contact]; 
    list<String> str=new list<String>();
    Map<string,Contact> accMap = new  Map<string,Contact>();
    
    for(Contact ac : accObj){
        accMap.put(ac.Lastname, ac);
        str.add(ac.Lastname);
    }
     List<String> duplicateRemoveList = new List<String>();
    for(String ss : str)
    {
        duplicateRemoveList=ss.split('');
    }
      system.debug('sasd'+duplicateRemoveList);
    for(Contact acc: Trigger.New){
        system.debug('loop');
        for(string str1:duplicateRemoveList)
        {
            system.debug('loop1');
           if(acc.LastName.contains(str1)){
               system.debug('loop2');
            acc.addError('Duplicate Record Found'); 
            }
  
        }
             
    }

}