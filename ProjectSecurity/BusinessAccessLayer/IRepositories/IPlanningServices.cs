using BusinessAccessLayer.Models;

namespace BusinessAccessLayer.IRepositories
{
    public interface IPlanningServices
    {
        IEnumerable<Planning> getOneByCustomer(int IdCustomer);
    }
}