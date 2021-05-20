trigger AccountAnnualRevenueTrigger on Account (before insert,before update)
{
    if((trigger.isinsert|| trigger.isupdate)&& trigger.isbefore)
    {
        for(Account acc: trigger.new)
        {
            if(acc.industry=='Banking')
            {
                acc.AnnualRevenue=10000000;
            }
            else if(acc.industry=='finance')
            {
                acc.AnnualRevenue=8400000;
            }
            else if(acc.industry=='Education')
            {
                acc.AnnualRevenue=3900000;
            }
            else if(acc.industry=='Technology')
            {
                acc.AnnualRevenue=7000000;
            }
            else if(acc.industry=='Engineering')
            {
                acc.AnnualRevenue=9500000;
            }
        }
    }

}