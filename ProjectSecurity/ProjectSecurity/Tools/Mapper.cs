using DATA = DataAccessLayer.Models;
using ASP = ProjectSecurity.Models;

namespace ProjectSecurity.Tools;


public static class Mapper
{
    public static DATA.RegisterForm AspToDataEmplo(this ASP.RegisterForm form)
    {
        return new DATA.RegisterForm
        {
            Login = form.Login,
            Password = form.Password,
            Id = form.Id,
        };
    }

    public static DATA.RegisterForm AspToDataContrat(this ASP.ContractorRegForm form)
    {
        return new DATA.RegisterForm
        {
            Login = form.Login,
            Password = form.Password,
            Id = form.Id,
        };
    }
    public static DATA.RegisterForm AspToDataCustomer(this ASP.CustomerRegForm form)
    {
        return new DATA.RegisterForm
        {
            Login = form.Login,
            Password = form.Password,
            Id = form.Id,
        };
    }
}
