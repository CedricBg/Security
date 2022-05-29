namespace ProjectSecurity.Models.Auth;
/// <summary>
/// Class pour le login et activation de l'éspace de connexion 
/// </summary>
public class RegForm
{
    /// <summary>
    /// id de l'utilisateur pour activation de l'éspace de connexion
    /// </summary>
    public int Id { get; set; }
    public string Login { get; set; }
    public string Password { get; set; }
}
