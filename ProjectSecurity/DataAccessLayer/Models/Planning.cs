namespace DataAccessLayer.Models;

public class Planning
{
    public int? Id { get; set; }
    public DateTime StartTime { get; set; }
    public DateTime EndTime { get; set; }
    public int? IdEmployee { get; set; }
    public int? IdCustomer { get; set; }
}
