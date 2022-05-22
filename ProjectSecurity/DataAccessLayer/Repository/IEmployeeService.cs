using DataAccessLayer.Models;

namespace DataAccessLayer.Services
{
    public interface IEmployeeService
    {
        bool AddEmployee(Employee employee);
        Employee GetOne(int id);
        IEnumerable<Employee> GetAll();
        bool DeleteEmployee(int Id);
        bool PutEmployee(PutEmployee form);
    }
}