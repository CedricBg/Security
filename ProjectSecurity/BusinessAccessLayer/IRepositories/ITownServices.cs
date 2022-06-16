using BusinessAccessLayer.Models.Town;

namespace BusinessAccessLayer.IRepositories;

public interface ITownServices
{
    IEnumerable<Ville> GetAll();
    IEnumerable<Pays> GetCountrysAll();
}