using BusinessAccessLayer.Models.Employee;

namespace BusinessAccessLayer.Services
{
    public interface IEmployeeServices
    {
        bool DeleteEmployee(int Id);
        bool PutEmployee(PutEmployee form);
        bool AddEmployee(AddEmployee form);
        Employee GetOne(int Id);
        IEnumerable<Employee> GetAll();
        bool DepartementTo(Belongs form);
    }
}