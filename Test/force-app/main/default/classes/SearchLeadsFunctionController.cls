public class SearchLeadsFunctionController 
{
   public string SearchText{get;set;}
   public List<Lead> lstLeads{get;set;}
   public void searchLeadRecordsByLastname()
   {
     if(SearchText!=null && SearchText!='')
     {
        SearchText +='%';
        lstLeads=new List<Lead>();
        lstLeads=[select id, firstname,lastname,email,company,title,industry,phone,fax,status
                              from Lead
                                where lastname like: SearchText];
     }
   }                             
}