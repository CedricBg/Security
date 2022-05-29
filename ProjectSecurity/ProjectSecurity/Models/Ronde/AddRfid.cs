namespace ProjectSecurity.Models.Ronde;
/// <summary>
/// Info de la passtille Rfid 
/// </summary>
public class AddRfid
{
    public string Location { get; set; }
    public int IdCustomer { get; set; }
    public string RfidNumber { get; set; }
}
