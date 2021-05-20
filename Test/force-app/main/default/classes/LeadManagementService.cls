public class LeadManagementService 
{ 
    public static void CreateLead()
    {
        Lead ld = new Lead();
        ld.FirstName='Chandhra';
        ld.LastName='Sekar';
        ld.Status='Open-Not contacted';
        ld.Email='rajeshm754@gmail.com';
        ld.Company='Oracle Inc';
        ld.Title='Project Manager';
        ld.Rating='Hot';
        ld.Industry='Technology';
        ld.Phone='8105207365';
        ld.Fax='8866445522';
        ld.Website='www.Salesforce.com';
        insert ld;
        if(ld.id!=null)
        {
            system.debug('Lead Record has been created with the id;'+ld.Id);

            Messaging.SingleEmailMessage email= new Messaging.SingleEmailMessage();
            string[]toAddress=new string[]{ld.Email,'shruthigodavarthi1208@gmail.com'};
                email.setToAddresses(toAddress);
            string[]ccAddress= new string[]{ld.Email,'shruthigodavarthi1208@gmail.com'};
                email.setCcAddresses(ccAddress);
            string[]bccAddress= new string[]{ld.Email,'shruthigodavarthi1208@gmail.com'};
                email.setBccAddresses(bccAddress);
            email.setReplyTo('Support@dell.com');
            email.setSenderDisplayName('Dell Customer Support');
            String emailSubject='Congratulations'+ld.FirstName+''+ld.LastName+'..!! Your Lead Record has been Created Successfully.';
            email.setSubject(emailSubject);
            string emailContent='Dear'+ld.FirstName+''+ld.LastName+',<br/><br/>'+
                'Thanks for showing interest in our organisation product/sercice.<br/><br/>'+
                'We are pleased to inform you, that your Lead record has been created in our dataBase.<br/><br/>'+
                'Here are your Lead Details...<br/><br/>'+
                'Lead Name is...:'+ld.Id+
                '<br/> company name is...:'+ld.Company +
                '<br/> Designation is...:'+ld.Title +
                '<br/> Lead status is...:'+ld.Status +
                '<br/> Rating value is...:'+ld.Rating +
                '<br/> Industry Name is...:'+ld.Industry +
                '<br/> Contact Number is...:'+ld.Phone +
                '<br/> Email id is...:'+ld.Email +
                '<br/><br/> One of our sales person will contact you Shortly.Please use the below address if any queries.<br/>'+
                '<br/> *** This is a system generated email. Please do not reply.<br/><br/>'+
                'Thanks and Regards,<br/> Dell Sales Team.';
             email.setHtmlBody(emailContent);

            List<Messaging.EmailFileAttachment> lstAttachments= new List<Messaging.EmailFileAttachment>();
            
                Messaging.EmailFileAttachment emailAttach= new Messaging.EmailFileAttachment();
                emailAttach.setContentType('Application/pdf');
                emailAttach.setFileName(ld.FirstName+''+ld.LastName+'.pdf');
                emailAttach.body=Blob.toPdf(emailContent);
                
            	lstAttachments.Add(emailAttach);
            
            email.setFileAttachments(lstAttachments);
            
            Messaging.sendEmail(new Messaging.SingleEmailMessage[]{email});
        }
                
     }

}