namespace ProjectSecurity.Models.Customer;

public class PostCustomer
{
    public string Name { get; set; }
    public string GeneralPhone { get; set; }
    public string EmergencyPhone { get; set; }
    public string EmergencyEmail { get; set; }
    public int? IdInformation { get; set; }
    public string Street { get; set; }
    public string PostCode { get; set; }
    public string StreetNumber { get; set; }
    public int? IdCountry { get; set; }
    public string Phone { get; set; }
    public string Email { get; set; }
    public int IdLanguage { get; set; }
    public int Role { get; set; }
}
