namespace ProjectSecurity.Models.Ronde;

/// <summary>
/// Model pour affiche des rondes finies
/// </summary>

public class RondeFinish
{
    public DateTime Start { get; set; }
    public DateTime End { get; set; }
    public DateTime TimeCheck { get; set; }
    public string Location { get; set; }
    public string Name { get; set; }
    public string Customer { get; set; }
}
