using DataAccessLayer.Models;

namespace DataAccessLayer.Services
{
    public interface IEmployeeService
    {
        bool AddEmployee(AddEmployee employee);
        Employee GetOne(int id);
        IEnumerable<Employee> GetAll();
        bool DeleteEmployee(int Id);
        bool PutEmployee(PutEmployee form);
        bool DepartementTo(Belongs form);
    }
}