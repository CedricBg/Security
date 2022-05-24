using BUSIAuth = BusinessAccessLayer.Models.Auth;
using BUSICust = BusinessAccessLayer.Models.Customer;
using BUSIEmplo = BusinessAccessLayer.Models.Employee;
using ASPCustomer = ProjectSecurity.Models.Customer;
using ASPEmplo = ProjectSecurity.Models.Employee;
using ASPAuth = ProjectSecurity.Models.Auth;

namespace ProjectSecurity.Tools;


public static class Mapper
{
    public static BUSIEmplo.PutEmployee AspPutEmployeeToBusi(this ASPEmplo.PutEmployee form)
    {
        return new BUSIEmplo.PutEmployee
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


    public static BUSICust.PutCustomer AspPutCustomerToBll(this ASPCustomer.PutCustomer form)
    {
        return new BUSICust.PutCustomer
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

    public static ASPCustomer.Customer BusiCustomerToAsp(this BUSICust.Customer form)
    {
        return new ASPCustomer.Customer
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

    public static BUSICust.Customer AspCustomerToBll(this ASPCustomer.Customer form)
    {
        return new BUSICust.Customer
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

   

    public static BUSIAuth.RegForm AspToBllRegister(this ASPAuth.RegForm form)
    {
        return new BUSIAuth.RegForm
        {
            Login = form.Login,
            Password = form.Password,
            Id = form.Id,
        };
    }
   
    public static BUSIEmplo.Employee AspToBllEmployee(this ASPEmplo.Employee form)
    {
        return new BUSIEmplo.Employee
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

    public static ASPEmplo.Employee BllToAspEmployee(this BUSIEmplo.Employee form)
    {
        return new ASPEmplo.Employee
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
    public static BUSIAuth.updateForm AspToBLLUpdate(this ASPAuth.UpdateForm form)
    {
        return new BUSIAuth.updateForm
        {
            Login = form.Login,
            Password = form.Password,
            PasswordNew = form.PasswordNew,
        };
    }

}
