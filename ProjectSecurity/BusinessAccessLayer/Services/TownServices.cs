using BusinessAccessLayer.IRepositories;
using BusinessAccessLayer.Models.Town;
using BusinessAccessLayer.Tools.Town;
using DataAccessLayer.Repository;
using System.Data.SqlClient;

namespace BusinessAccessLayer.Services;

public class TownServices : ITownServices
{
    private readonly ITownService _townService;

    public TownServices(ITownService townService)
    {
        _townService = townService;
    }

    public IEnumerable<Ville> GetAll()
    {
        try
        {
            return _townService.getAll().Select(dr => dr.GetAll());
        }
        catch(Exception)
        {
            return null;
        } 
    }

    public IEnumerable<Pays> GetCountrysAll()
    {
        try
        {
            return _townService.getAllCountry().Select(dr => dr.GetAllCountrys());
        }
        catch (Exception)
        {
            return null;
        }
    }
}
