using DataAccessLayer.Models;

namespace DataAccessLayer.Services
{
    public interface ICustomerService
    {
        bool AddCustomer(PostCustomer form);
        Customer CustomerById(int Id);
        bool PutCustomer(PutCustomer form);
        bool DeleteCustomer(int Id);
        IEnumerable<AllCustomer> GetAll();
    }
}