using BUSIAuth = BusinessAccessLayer.Models.Auth;
using BUSICust = BusinessAccessLayer.Models.Customer;
using BUSIEmplo = BusinessAccessLayer.Models.Employee;
using BUSIRonde = BusinessAccessLayer.Models.Ronde;
using BUSIWork = BusinessAccessLayer.Models.Work;
using BUSIPlan = BusinessAccessLayer.Models.Planning;
using BUSITown = BusinessAccessLayer.Models.Town;
using ASPRonde = ProjectSecurity.Models.Ronde;
using ASPCustomer = ProjectSecurity.Models.Customer;
using ASPEmplo = ProjectSecurity.Models.Employee;
using ASPAuth = ProjectSecurity.Models.Auth;
using ASPWork = ProjectSecurity.Models.Work;
using ASPPlan = ProjectSecurity.Models.Planning;
using ASPTown = ProjectSecurity.Models.Town;

namespace ProjectSecurity.Tools;

/// <summary>
/// Classe de mapper
/// </summary>
public static class Mapper
{

    public static ASPTown.Ville GetAll(this BUSITown.Ville ville)
    {
        return new ASPTown.Ville
        {
            ville = ville.ville,
            codePostal = ville.codePostal,
        };
    }

    /// <summary>
    /// Mapper pour l'affichage du planning 
    /// </summary>

    public static ASPPlan.Planning BllTOASPPlanning(this BUSIPlan.Planning form)
    {
        return new ASPPlan.Planning
        {
            EndTime = form.EndTime,
            StartTime = form.StartTime,
            Customer = form.Customer,
            IdEmployee = form.IdEmployee,
            
            
        };
    }

    /// <summary>
    /// Mapper pour l'envoi d'une date de planning planning
    /// </summary>

    public static BUSIPlan.Planning ASPTOBLLPlanning(this ASPPlan.Planning form)
    {
        return new BUSIPlan.Planning
        {
            EndTime = form.EndTime,
            StartTime = form.StartTime,
            Customer = form.Customer,
            IdEmployee = form.IdEmployee,
        };
    }

    /// <summary>
    /// Mapper pour le controle d'une pastille
    /// </summary>

    public static BUSIRonde.CheckPastille Check(this ASPRonde.CheckPastille form)
    {
        return new BUSIRonde.CheckPastille
        {
            RfidNbr = form.RfidNbr,
            IdTimeRomnde = form.IdTimeRomnde,
        };
    }

    /// <summary>
    /// Mapper pour le démarrage d'une ronde
    /// </summary>
    public static BUSIRonde.Start StartRonde(this ASPRonde.Start form)
    {
        return new BUSIRonde.Start
        {
            IdEmployee = form.IdEmployee,
            IdRonde = form.IdRonde,
        };
    }

    /// <summary>
    /// Mapper pour la récupération d'une ronde
    /// </summary>
    public static BUSIRonde.GetRonde GetRonde(ASPRonde.GetRonde form)
    {
        return new BUSIRonde.GetRonde
        {
            Location = form.Location,
            NameRonde = form.NameRonde,
        };
    }

    /// <summary>
    /// Mapper ajout d'une passtille à une ronde
    /// </summary>
    public static BUSIRonde.RfidToRonde RfidToRondeToBll(this ASPRonde.RfidToRonde form)
    {
        return new BUSIRonde.RfidToRonde
        {
            IdRfid = form.IdRfid,
            IdRondes = form.IdRondes,
        };
    }

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
            isActive = form.isActive,
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
            id = form.id,
            FirstName = form.FirstName,
            Name = form.Name,
            BirthDate = form.BirthDate,
            Vehicle = form.Vehicle,
            SecurityCard = form.SecurityCard,
            EmployeeCardNumber = form.EmployeeCardNumber,
            RegistreNational = form.RegistreNational,
            Language = form.Language,
            Departement = form.Departement,
            Email = form.Email,
            Street = form.Street,
            StreetNumber = form.StreetNumber,
            Phone = form.Phone,
            PostCode = form.PostCode,
            Country = form.Country,
            Role = form.Role,
            
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
            Country = form.Country,
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
            Country = form.Country,
            Phone = form.Phone,
            GeneralPhone = form.GeneralPhone,
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
            Country = form.Country,
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
