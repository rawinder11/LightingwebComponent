public class InvocableClassExample {
    
    @invocableMethod(label='delete related Opportunity'
                    description='delete relted opportunity of given record id'
                    category='account')
    public static void deleteOpportunties(List<String> ids){
        List<Opportunity>oppList=[select id from Opportunity where AccountId=:ids And StageName='Closed Won'];
        delete oppList;
        
    }

}