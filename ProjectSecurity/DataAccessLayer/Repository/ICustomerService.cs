using DataAccessLayer.Models;

namespace DataAccessLayer.Services
{
    public interface ICustomerService
    {
        bool AddCustomer(Customer form);
    }
}