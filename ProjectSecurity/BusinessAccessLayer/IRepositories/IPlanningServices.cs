using BusinessAccessLayer.Models.Planning;

namespace BusinessAccessLayer.IRepositories
{
    public interface IPlanningServices
    {
        IEnumerable<Planning> getOneByCustomer(int IdCustomer);
    }
}