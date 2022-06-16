using AdoToolbox;
using DataAccessLayer.Models.Town;
using DataAccessLayer.Repository;
using DataAccessLayer.Tools;
using Microsoft.Extensions.Configuration;
using System.Data.SqlClient;

namespace DataAccessLayer.Services;

public class TownService : ITownService
{
    private string _connectionString;

    public TownService(IConfiguration config)
    {
        _connectionString = config.GetConnectionString("ConnectionString");
    }

    public  IEnumerable<Ville> getAll()
    {
        try
        {
            Connection cnx = new Connection(_connectionString);
            Command cmd = new Command("GetTown", true);

            return cnx.ExecuteReader(cmd, dr => dr.AllTown());
        }
        catch (Exception)
        {
            return null;
        }
    }
    public IEnumerable<Pays> getAllCountry()
    {
        try
        {
            Connection cnx = new Connection(_connectionString);
            Command cmd = new Command("AllCountrys", true);

            return cnx.ExecuteReader(cmd, dr => dr.AllCountrys());
        }
        catch (SqlException)
        {
            return null;
        }
    }
}
