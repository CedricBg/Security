using BusinessAccessLayer.Models;

namespace BusinessAccessLayer.Services
{
    public interface IClientServices
    {
        bool AddCustomer(Customer form);
        Customer CustomerById(int Id);
    }
}