using DATA = DataAccessLayer.Models;
using BUSI = BusinessAccessLayer.Models;
using BusinessAccessLayer.Models.Employee;
using BusinessAccessLayer.Models.Auth;
using BusinessAccessLayer.Models.Customer;
using BusinessAccessLayer.Models.Planning;
using DATAauth = DataAccessLayer.Models.Auth; 


namespace BusinessAccessLayer.Tools;

public static class Mapper
{

    public static JwtUser DataToBllJwtUser(this DATAauth.JwtUser form)
    {
        return new JwtUser
        {
            IdLanguage = form.IdLanguage,
            IdUser = form.IdUser,
            Name = form.Name,
            FirstName = form.FirstName,
            Login = form.Login,
            Role = form.Role
        };
    }

    public static DATA.Employee BllToDataEmployee(this Employee form)
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
            EntryService = form.EntryService
        };
    }


    public static Employee DataToBllEmployee(this DATA.Employee form)
    {
        return new Employee
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

    public static DATAauth.RegForm BllToDataCustomer(this RegForm form)
    {
        return new DATAauth.RegForm
        {
            Login = form.Login,
            Password = form.Password,
            Id = form.Id,
        };
    }
    public static DATAauth.FormUpdate BllToDataUpdate(this updateForm form)
    {
        return new DATAauth.FormUpdate
        {
            Login = form.Login,
            Password = form.Password,
            PasswordNew = form.PasswordNew,
        };
    }
    public static DATA.PutEmployee BllPutEmployeeToData(this PutEmployee form)
    {
        return new DATA.PutEmployee
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

    public static Planning DataPlanningToBusi(this DATA.Planning form)
    {
        return new Planning
        {
            Id = form.Id,
            StartTime = form.StartTime,
            EndTime = form.EndTime,
            IdCustomer = form.IdCustomer,
            IdEmployee = form.IdEmployee
        };
    }
    public static DATA.Customer BusiCustomerToData(this Customer form)
    {
        return new DATA.Customer
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

    public static Customer DataCustomerToBll(this DATA.Customer form)
    {
        return new Customer
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
    public static DATA.PutCustomer BllPutCustomerToData(this PutCustomer form)
    {
        return new DATA.PutCustomer
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
            IdInformation = form.IdInformation
        };
    }

}
