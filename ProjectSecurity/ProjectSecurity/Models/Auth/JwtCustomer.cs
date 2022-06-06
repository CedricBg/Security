namespace ProjectSecurity.Models.Auth;

public class JwtCustomer
{
    public string Name { get; set; }
    public int IdCust { get; set; }
    public int IdLanguage { get; set; }
    public string Login { get; set; }
    public string Role { get; set; }
    public bool isActive { get; set; }
}
