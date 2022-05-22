using DATA = DataAccessLayer.Models;
using BusinessAccessLayer.Models;


namespace BusinessAccessLayer.Tools;

public static class Mapper
{
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

}
