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

   

    public static busi.RegForm AspToBllRegister(this ASP.RegForm form)
    {
        return new busi.RegForm
        {
            Login = form.Login,
            Password = form.Password,
            Id = form.Id,
        };
    }
   
    public static busi.Employee AspToBllEmployee(this ASP.Employee form)
    {
        return new busi.Employee
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
            EntryService = form.EntryService
        };
    }

    public static ASP.Employee BllToAspEmployee(this busi.Employee form)
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
    public static busi.updateForm AspToBLLUpdate(this ASP.UpdateForm form)
    {
        return new busi.updateForm
        {
            Login = form.Login,
            Password = form.Password,
            PasswordNew = form.PasswordNew,
        };
    }

}
