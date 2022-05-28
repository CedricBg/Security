using BUSIAuth = BusinessAccessLayer.Models.Auth;
using BUSICust = BusinessAccessLayer.Models.Customer;
using BUSIEmplo = BusinessAccessLayer.Models.Employee;
using BUSIRonde = BusinessAccessLayer.Models.Ronde;
using BUSIWork = BusinessAccessLayer.Models.Work;
using ASPRonde = ProjectSecurity.Models.Ronde;
using ASPCustomer = ProjectSecurity.Models.Customer;
using ASPEmplo = ProjectSecurity.Models.Employee;
using ASPAuth = ProjectSecurity.Models.Auth;
using ASPWork = ProjectSecurity.Models.Work;

namespace ProjectSecurity.Tools;


public static class Mapper
{
    public static BUSIRonde.AddRfid AddRfid(this ASPRonde.AddRfid form)
    {
        return new BUSIRonde.AddRfid
        {
            IdCustomer = form.IdCustomer,
            Location = form.Location,
            RfidNumber = form.RfidNumber,
        };
    }
    
    public static BUSICust.PostCustomer ASPToBllPostCustomer(this ASPCustomer.PostCustomer form)
    {
        return new BUSICust.PostCustomer
        {
            Email = form.Email,
            EmergencyEmail = form.EmergencyEmail,
            EmergencyPhone = form.EmergencyPhone,
            Street = form.Street,
            StreetNumber = form.StreetNumber,
            GeneralPhone = form.GeneralPhone,
            IdCountry = form.IdCountry,
            IdInformation = form.IdInformation,
            IdLanguage = form.IdLanguage,
            Name = form.Name,
            Phone = form.Phone,
            PostCode = form.PostCode,
            Role = form.Role,
        };
    }

    public static BUSIEmplo.Belongs ASPToBllBelongs(this ASPEmplo.Belongs form)
    {
        return new BUSIEmplo.Belongs
        {
            IdDepartement = form.IdDepartement,
            IdEmployee = form.IdEmployee,
        };
    }

    public static BUSIWork.StartForm ASPTOBllWork(this ASPWork.StartForm form) 
    {
        return new BUSIWork.StartForm
        {
            IdCustomer = form.IdCustomer,
            IdEmployee = form.IdEmployee
        };
    }

    public static ASPAuth.JwtUser BllToASPJwtUser(this BUSIAuth.JwtUser form)
    {
        return new ASPAuth.JwtUser
        {
            Login = form.Login,
            IdLanguage = form.IdLanguage,
            IdUser = form.IdUser,
            FirstName = form.FirstName,
            Name = form.Name,
            Role = form.Role,
        };
    }

    public static BUSIRonde.Addronde AdDRonde(this ASPRonde.AddRonde form)
    {
        return new BUSIRonde.Addronde
        {
            IdCustomer = form.IdCustomer,
            NameRonde = form.NameRonde,
        };
    }


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
            IdLanguage = form.IdLanguage,
            IdDepartement = form.IdDepartement
};
    }
    public static ASPCustomer.AllCustomer BLLToASPAllCustomer(this BUSICust.AllCustomer form)
    {
        return new ASPCustomer.AllCustomer
        {
            IdCustomer = form.IdCustomer,
            Name = form.Name,
            EmergencyEmail = form.EmergencyEmail,
            EmergencyPhone = form.EmergencyPhone,
            GeneralPhone = form.GeneralPhone,
            Email = form.Email,
            Phone = form.Phone,
            PostCode = form.PostCode,
            Street = form.Street,
            StreetNumber = form.StreetNumber,
            Language = form.Language,
            Country = form.Country,
            Role = form.Role,
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
            Email = form.Email,
            IdLanguage = form.IdLanguage,
            Role = form.Role,
            
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
            IdInformation = form.IdInformation,
            IdLanguage  = form.IdLanguage,
            Role =  form.Role,
            Language = form.Language,
            
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
            IdLanguage = form.IdLanguage
            
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
   
    public static BUSIEmplo.AddEmployee AspToBllEmployee(this ASPEmplo.AddEmployee form)
    {
        return new BUSIEmplo.AddEmployee
        {
            Name = form.Name,
            BirthDate = form.BirthDate,
            SecurityCard = form.SecurityCard,
            EntryService = form.EntryService,
            IdStatut = form.IdStatut,
            IdDepartement = form.IdDepartement,
            EmployeeCardNumber = form.EmployeeCardNumber,
            FirstName = form.FirstName,
            IdInformation = form.IdInformation,
            IdLanguage = form.IdLanguage,
            RegistreNational = form.RegistreNational,
            Vehicle = form.Vehicle

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
            Country = form.Country,
            street = form.street,
            Departement=form.Departement,
            Email = form.Email,
            StreetNumber=form.StreetNumber,
            Language=form.Language,
            Phone=form.Phone,
            Postcode=form.Postcode,
            Role=form.Role,
            
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
