using Bll = BusinessAccessLayer.Models.Ronde;
using DATA = DataAccessLayer.Models.Ronde;

namespace BusinessAccessLayer.Tools.Ronde;

public static class Mapper
{
    public static DATA.AddRonde AddRonde(this Bll.Addronde form)
    {
        return new DATA.AddRonde
        {
            IdCustomer = form.IdCustomer,
            NameRonde = form.NameRonde,
        };
    } 

    public static DATA.AddRfid AddRfid(this Bll.AddRfid form)
    {
        return new DATA.AddRfid
        {
            IdCustomer = form.IdCustomer,
            Location = form.Location,
            RfidNumber = form.RfidNumber,
        };
    }

    
}
