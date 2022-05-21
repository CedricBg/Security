using DATA = DataAccessLayer.Models;
using ASP = ProjectSecurity.Models;
using busi = BusinessAccessLayer.Models;

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
    public static DATA.Employee AspToDataCustomer(this ASP.Employee form)
    {
        return new DATA.Employee
        {
            Id = form.Id,
            Name = form.Name,
            FirstName = form.FirstName,
            Vehicle = form.Vehicle,
            BirthDate = form.BirthDate,
            EmployeeCardNumber = form.EmployeeCardNumber,
            SecurityCard = form.SecurityCard,
            IdStatut = form.IdStatut,
            IdInformation = form.IdInformation,
            IdLanguage = form.IdLanguage,
            IdUsers = form.IdUsers,
            RegistreNational = form.RegistreNational,
            EntryService = form.EntryService,
        };
    }

    public static ASP.Employee DataToAspEmployee(this DATA.Employee form)
    {
        return new ASP.Employee
        {
            Id = form.Id,
            Name = form.Name,
            FirstName = form.FirstName,
            BirthDate = form.BirthDate,
            Vehicle = form.Vehicle,
            SecurityCard = form.SecurityCard,
            EntryService = form.EntryService,
            RegistreNational = form.RegistreNational,
            EmployeeCardNumber = form.EmployeeCardNumber,
            IdStatut = form.IdStatut,
            IdInformation = form.IdInformation,
            IdLanguage = form.IdLanguage,
            IdUsers = form.IdUsers


        };
    }
    public static DATA.FormUpdate AspToDataUpdate(this ASP.UpdateForm form)
    {
        return new DATA.FormUpdate
        {
            Login = form.Login,
            Password = form.Password,
            PasswordNew = form.PasswordNew,
        };
    }

}
