public class Trailblazer1 {
    
    public static void harsha()
    {
           list< permissionset> p=[select permissionset.profile.name from permissionset];
        
           system.debug(''+ permissionset.profile.name);

    }

}