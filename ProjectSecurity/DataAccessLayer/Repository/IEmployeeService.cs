using DataAccessLayer.Models;

namespace DataAccessLayer.Services
{
    public interface IEmployeeService
    {
        bool AddEmployee(Employee employee);
        Employee GetOne(int id);
    }
}