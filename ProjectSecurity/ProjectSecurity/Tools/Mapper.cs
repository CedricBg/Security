using DATA = DataAccessLayer.Models;
using ASP = ProjectSecurity.Models;
using busi = BusinessAccessLayer.Models;

namespace ProjectSecurity.Tools;


public static class Mapper
{
    public static busi.PutEmployee AspPutEmployeeToBusi(this ASP.PutEmployee form)
    {
        return new busi.PutEmployee
        {
            IdEmployee = form.IdEmployee,
            FirstName = form.FirstName,
            Name = form.Name,
            BirthDate = form.BirthDate,
            Vehicle = form.Vehicle,
            SecurityCard = form.SecurityCard,
            EmployeeCardNumber = form.EmployeeCardNumber,
            RegistreNational = form.RegistreNational,
            IdInformation = form.IdInformation,
            IdLanguage = form.IdLanguage
        };
    }


    public static busi.PutCustomer AspPutCustomerToBll(this ASP.PutCustomer form)
    {
        return new busi.PutCustomer
        {
            IdCustomer = form.IdCustomer,
            Name = form.Name,
            GeneralPhone = form.GeneralPhone,
            EmergencyPhone = form.EmergencyPhone,
            EmergencyEmail = form.EmergencyEmail,
            IdInformation = form.IdInformation,
            Street = form.Street,
            PostCode = form.PostCode,
            StreetNumber = form.StreetNumber,
            IdCountry = form.IdCountry,
            Phone = form.Phone,
            Email = form.Email
        };
    }

    public static ASP.Customer BusiCustomerToAsp(this busi.Customer form)
    {
        return new ASP.Customer
        {
            IdCustomer = form.IdCustomer,
            Name = form.Name,
            EmergencyEmail = form.EmergencyEmail,
            EmergencyPhone = form.EmergencyPhone,
            Email = form.Email,
            Street = form.Street,
            StreetNumber = form.StreetNumber,
            PostCode = form.PostCode,
            IdCountry = form.IdCountry,
            Phone = form.Phone,
            GeneralPhone = form.GeneralPhone,
            Country = form.Country,
            IdUsers = form.IdUsers,
            IdInformation = form.IdInformation
        };
    }

    public static busi.Customer AspCustomerToBll(this ASP.Customer form)
    {
        return new busi.Customer
        {
            Name = form.Name,
            EmergencyEmail = form.EmergencyEmail,
            EmergencyPhone = form.EmergencyPhone,
            Email = form.Email,
            Street = form.Street,
            StreetNumber = form.StreetNumber,
            PostCode = form.PostCode,
            IdCountry = form.IdCountry,
            Phone = form.Phone,
            GeneralPhone = form.GeneralPhone,
        };
    }

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
