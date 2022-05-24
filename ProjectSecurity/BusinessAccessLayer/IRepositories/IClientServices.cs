using BusinessAccessLayer.Models.Customer;

namespace BusinessAccessLayer.Services
{
    public interface IClientServices
    {
        bool AddCustomer(Customer form);
        Customer CustomerById(int Id);
        bool PutCustomer(PutCustomer form);
        bool DeleteCustomer(int Id);
        IEnumerable<Customer> GetAll();
    }
}