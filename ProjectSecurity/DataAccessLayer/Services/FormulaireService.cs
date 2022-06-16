
using AdoToolbox;
using DataAccessLayer.Models.Formulaire;
using DataAccessLayer.Repository;
using DataAccessLayer.Tools;
using Microsoft.Extensions.Configuration;

namespace DataAccessLayer.Services;

public class FormulaireService : IFormulaireService
{
    string _connexinoString;

    public FormulaireService(IConfiguration connexionString)
    {
        _connexinoString = connexionString.GetConnectionString("ConnectionString");
    }


    public IEnumerable<Departement> GetAllDept()
    {
        try
        {
            Connection cnx = new Connection(_connexinoString);
            Command cmd = new Command("GetDepartement", true);

            return cnx.ExecuteReader(cmd, dr => dr.AllDept());
        }
        catch(Exception ex)
        {
            return null;
        }
    }

    public IEnumerable<Statut> GetAllStatut()
    {
        try
        {
            Connection cnx = new Connection(_connexinoString);
        Command cmd = new Command("GetStatut", true);

        return cnx.ExecuteReader(cmd, dr => dr.AllStatut());
    }
        catch(Exception ex)
        {
            return null;
        }
    }
}
