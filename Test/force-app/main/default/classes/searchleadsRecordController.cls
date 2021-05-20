public class searchleadsRecordController
{
public string searchtext{get;set;}
public list<lead> lstleads{get;set;}
public void searchleads()
{
if(searchtext != null && searchtext != '')
{
string leadquery = 'select id,firstname,lastname,title,email,phone,fax from lead where ';
{
if(Pattern.matches('[a-zA-Z0-9._-]+@[a-zA-Z]+.[a-zA-Z]{2,4}',searchtext ))
 {
leadquery+='email =: searchtext';
}
else
{
searchtext +='%';
leadquery+= 'lastname like:searchtext order by lastname';
}

}   

lstleads = new list<lead>();
lstleads = Database.query(leadquery);
}
}
}