using BusinessAccessLayer.Models;

namespace BusinessAccessLayer.Services
{
    public interface IEmployeeServices
    {
        bool DeleteEmployee(int Id);
        bool PutEmployee(PutEmployee form);
    }
}