public class CaseManagerHelper 
{
     public static void createcase(Id accid,Id conid)
    {
        case cse=new case();
        cse.Type='Mechanical';
        cse.Reason='Performance';
        cse.Status='new';
        cse.Priority='high';
        cse.Origin='email';
        cse.AccountId=accid;
        cse.ContactId=conid;
        insert cse;
        if(cse.id!=Null)
        {
            system.debug('Case record id is...'+cse.id);
        }
    }

}