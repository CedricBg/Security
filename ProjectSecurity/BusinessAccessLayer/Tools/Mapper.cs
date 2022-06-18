using DATA = DataAccessLayer.Models;
using BUSI = BusinessAccessLayer.Models;
using BusinessAccessLayer.Models.Employee;
using BusinessAccessLayer.Models.Auth;
using BusinessAccessLayer.Models.Customer;
using BusinessAccessLayer.Models.Planning;
using DATAauth = DataAccessLayer.Models.Auth;
using DataPl = DataAccessLayer.Models.Planning;

namespace BusinessAccessLayer.Tools;

public static class Mapper
{
    public static Planning DataToBllPlanning(this DataPl.Planning form)
    {
        return new Planning
        {
            EndTime = form.EndTime,
            StartTime = form.StartTime,
            Customer = form.Customer,
            IdEmployee = form.IdEmployee,
        };
    }

    public static DataPl.Planning BllToDataPlanning(this Planning form)
    {
        return new DataPl.Planning
        {
            EndTime = form.EndTime,
            StartTime = form.StartTime,
            Customer = form.Customer,
            IdEmployee = form.IdEmployee,
        };
    }

    public static DATA.PostCustomer BllToDataPostCutomer(this PostCustomer form)
    {
        return new DATA.PostCustomer
        {
            Email = form.Email,
            EmergencyEmail = form.EmergencyEmail,
            EmergencyPhone = form.EmergencyPhone,
            GeneralPhone = form.GeneralPhone,
            IdCountry = form.IdCountry,
            IdInformation = form.IdInformation,
            StreetNumber = form.StreetNumber,
            Street = form.Street,
            IdLanguage = form.IdLanguage,
            Name = form.Name,
            Phone = form.Phone,
            PostCode = form.PostCode,
            Role = form.Role,
            
        };
    }

    public static DATA.Belongs bllToDataBelongs(this Belongs form)
    {
        return new DATA.Belongs
        {
            IdDepartement = form.IdDepartement,
            IdEmployee = form.IdEmployee,
        };
    }

    public static JwtUser DataToBllJwtCustomer(this DATAauth.JwtCustomer form)
    {
        return new JwtUser
        {
            IdLanguage = form.IdLanguage,
            Name = form.Name,
            Login = form.Login,
            Role = form.Role,
            IdUser = form.IdCust,
            isActive = form.isActive
        };
    }

    public static JwtUser DataToBllJwtUser(this DATAauth.JwtUser form)
    {
        return new JwtUser
        {
            IdLanguage = form.IdLanguage,
            IdUser = form.IdUser,
            Name = form.Name,
            FirstName = form.FirstName,
            Login = form.Login,
            Role = form.Role,
            isActive = form.isActive
};
    }

    public static DATA.AddEmployee BllToDataEmployee(this AddEmployee form)
    {
        return new DATA.AddEmployee
        {
            Name = form.Name,
            BirthDate = form.BirthDate,
            SecurityCard = form.SecurityCard,
            IdDepartement = form.IdDepartement,
            EmployeeCardNumber = form.EmployeeCardNumber,
            EntryService = form.EntryService,
            FirstName = form.FirstName,
            IdInformation = form.IdInformation,
            IdLanguage = form.IdLanguage,
            IdStatut = form.IdStatut,
            RegistreNational = form.RegistreNational,
            Vehicle = form.Vehicle
            
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
            IdUsers = form.IdUsers,
            RegistreNational = form.RegistreNational,
            EntryService = form.EntryService,
            street = form.street,
            Postcode=form.Postcode,
            Phone = form.Phone,
            StreetNumber=form.StreetNumber,
            Country = form.Country,
            Departement =form.Departement,
            Email = form.Email,
            Language = form.Language,
            Role = form.Role, 
        };
    }

    public static AllCustomer DataToBllAllCustomer(this DATA.AllCustomer form)
    {
        return new AllCustomer
        {
            IdCustomer = form.IdCustomer,
            Name = form.Name,
            EmergencyEmail = form.EmergencyEmail,
            EmergencyPhone = form.EmergencyPhone,
            GeneralPhone = form.GeneralPhone,
            Email = form.Email,
            Phone = form.Phone,
            PostCode = form.PostCode,
            Street= form.Street,
            StreetNumber = form.StreetNumber,
            Language = form.Language,
            Country = form.Country,
            Role = form.Role,
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
            id = form.id,
            FirstName = form.FirstName,
            Name = form.Name,
            BirthDate = form.BirthDate,
            Vehicle = form.Vehicle,
            SecurityCard = form.SecurityCard,
            EmployeeCardNumber = form.EmployeeCardNumber,
            RegistreNational = form.RegistreNational,
            Language = form.Language,
            Email = form.Email,
            Departement = form.Departement,
            Street = form.Street,
            StreetNumber = form.StreetNumber,
            Phone = form.Phone,
            PostCode = form.PostCode,
            Country = form.Country,
            Role = form.Role,
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
            IdLanguage = form.IdLanguage,

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
            IdInformation = form.IdInformation,
            IdLanguage = form.IdLanguage,
            Role= form.Role,
            Language= form.Language,
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
            Country = form.Country,
            Phone = form.Phone,
            GeneralPhone = form.GeneralPhone,
            IdInformation = form.IdInformation,
            Role = form.Role,
            IdLanguage = form.IdLanguage
            
        };
    }

}
