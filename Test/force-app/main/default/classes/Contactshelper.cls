public class Contactshelper 
{
    public static void CreaterelatedContact(ID accid)
    {
       contact con=new contact();
        con.FirstName='Rajesh';
        con.LastName='Chowdary';
        con.Title='Queries';
        con.LeadSource='Web';
        con.Phone='9900990099';
        con.Fax='9900990099';
        con.Email='sai@gmail.com';
        con.AccountId=accid;
         
          insert con;
        if(con.Id!=null)
        {
            system.debug('Contact record id is...:'+con.id);
            CaseManagerHelper.createcase(accid,con.id);
        }
    }

}