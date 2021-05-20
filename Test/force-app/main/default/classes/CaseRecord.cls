public class CaseRecord
{
    public static void CreateNewRecord(string csSubject,string csDescription,string csPriority,string csStatus,string csOrigin,string csType)
    {
        Case cs=new Case();
        cs.Subject=csSubject;
        cs.Description=csDescription;
        cs.Priority=csPriority;
        cs.Status=csStatus;
        cs.Origin=csOrigin;
        insert cs;
        if(cs.id!=null)
        {
            system.debug('Case record is created with the id:'+cs.Id);
        }
    }

}