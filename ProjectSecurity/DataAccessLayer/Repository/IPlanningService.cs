using DataAccessLayer.Models;

namespace DataAccessLayer.Services
{
    public interface IPlanningService
    {
        IEnumerable<Planning> getOneByCustomer(int IdCustomer);
    }
}