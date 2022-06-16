using DataAccessLayer.Models.Town;

namespace DataAccessLayer.Repository;

public interface ITownService
{
    IEnumerable<Ville> getAll();
    IEnumerable<Pays> getAllCountry();
}