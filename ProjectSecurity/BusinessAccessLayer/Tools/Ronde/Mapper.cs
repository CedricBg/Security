using DataAccessLayer.Models;
using Bll = BusinessAccessLayer.Models.Ronde;
using DATA = DataAccessLayer.Models.Ronde;

namespace BusinessAccessLayer.Tools.Ronde;

public static class Mapper
{

    public static DATA.CheckPastille Check(this Bll.CheckPastille form){
        return new DATA.CheckPastille
        {
            IdEmployee = form.IdEmployee,
            IdRfid = form.IdRfid,
        };
    }
    public static DATA.Start StartRonde(this Bll.Start form)
    {
        return new DATA.Start
        {
            IdEmployee = form.IdEmployee,
            IdRonde = form.IdRonde,
        };
    }
    public static Bll.GetRonde GetRonde(this DATA.GetRonde form)
    {
        return new Bll.GetRonde
        {
            NameRonde = form.NameRonde,
            Location = form.Location,
        };
    }

    public static RfidToRonde RfiToRondeToData(this Bll.RfidToRonde form)
    {
        return new RfidToRonde
        {
            IdRfid = form.IdRfid,
            IdRondes = form.IdRondes,
        };
    }

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
