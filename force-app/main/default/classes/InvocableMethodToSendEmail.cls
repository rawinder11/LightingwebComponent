public class InvocableMethodToSendEmail {
    
    @invocableMethod(label='send email to contact'
                    description='send email to contact'
                    category='Contact')
    public static void sendEmailToContact(List<Requests> requestList){
        String contactid=requestList.get(0).ContactIds;
        String caseNumber=requestList.get(0).caseNumber;
        Messaging.SingleEmailMessage mail =  new Messaging.SingleEmailMessage();
        
        mail.toaddresses=new String[] {contactid};
        mail.subject='Your case has been received!'+caseNumber;
        mail.plaintextbody='Your case has been received!';
        mail.setSaveAsActivity(true); 
      
        Messaging.SingleEmailMessage[] messages=new List<Messaging.SingleEmailMessage>{mail};
        Messaging.SendEmailResult[] results=Messaging.sendEmail(messages);
        if(results[0].success){
            system.debug('email was sent successfully');
        }else{
              system.debug('email is failed due to'+results[0].errors[0].message);
        }
           
        
    }
    
    public class Requests{
        @InVocableVariable(label='Record Id' Description='The id of recdord' required=true)
   		Public String caseId;
		@inVocableVariable(label='case Number' Description='The Name of Record' required=true)
   		Public String caseNumber;    
        @inVocableVariable(label='Contact id' Description='contact id' required=true)
   		Public String ContactIds; 
    }

}