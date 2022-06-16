using BusinessAccessLayer.IRepositories;
using BusinessAccessLayer.Models.Town;
using BusinessAccessLayer.Tools.Town;
using DataAccessLayer.Repository;

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
}
