
namespace DataAccessLayer.Models;

public class Employee
{
    public int? Id { get; set; }
    public string? Name { get; set; }
    public string? FirstName { get; set; }
    public string? BirthDate { get; set; }
    public bool Vehicle { get; set; }
    public int? SecurityCard { get; set; }
    public string? EntryService { get; set; }
    public string? EmployeeCardNumber { get; set; }
    public string? RegistreNational { get; set; }
    public int IdStatut { get; set; }
    public int IdLanguage { get; set; }
    public int IdInformation { get; set; }
    public int? IdUsers { get; set; }
    public int IdDepartement { get; set; }
}
