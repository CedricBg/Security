using DATA = DataAccessLayer.Models;
using BUSI = BusinessAccessLayer.Models;


namespace BusinessAccessLayer.Tools;

public static class Mapper
{

    public static DATA.Employee BllToDataEmployee(this BUSI.Employee form)
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


    public static BUSI.Employee DataToBllEmployee(this DATA.Employee form)
    {
        return new BUSI.Employee
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

    public static DATA.RegForm BllToDataCustomer(this BUSI.RegForm form)
    {
        return new DATA.RegForm
        {
            Login = form.Login,
            Password = form.Password,
            Id = form.Id,
        };
    }
    public static DATA.FormUpdate BllToDataUpdate(this BUSI.updateForm form)
    {
        return new DATA.FormUpdate
        {
            Login = form.Login,
            Password = form.Password,
            PasswordNew = form.PasswordNew,
        };
    }
    public static DATA.PutEmployee BllPutEmployeeToData(this BUSI.PutEmployee form)
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

    public static BUSI.Planning DataPlanningToBusi(this DATA.Planning form)
    {
        return new BUSI.Planning
        {
            Id = form.Id,
            StartTime = form.StartTime,
            EndTime = form.EndTime,
            IdCustomer = form.IdCustomer,
            IdEmployee = form.IdEmployee
        };
    }
    public static DATA.Customer BusiCustomerToData(this BUSI.Customer form)
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

    public static BUSI.Customer DataCustomerToBll(this DATA.Customer form)
    {
        return new BUSI.Customer
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
    public static DATA.PutCustomer BllPutCustomerToData(this BUSI.PutCustomer form)
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
