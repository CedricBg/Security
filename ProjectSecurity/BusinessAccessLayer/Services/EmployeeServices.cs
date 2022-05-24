using BusinessAccessLayer.Models.Employee;
using BusinessAccessLayer.Tools;
using DataAccessLayer.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessAccessLayer.Services;

public class EmployeeServices : IEmployeeServices
{
    private readonly IEmployeeService _employeeService;

    public EmployeeServices(IEmployeeService employeeService)
    {
        _employeeService = employeeService;
    }


    public IEnumerable<Employee> GetAll()
    {
        return _employeeService.GetAll().Select(dr => dr.DataToBllEmployee());
    }

    public bool DeleteEmployee(int Id)
    {
        return _employeeService.DeleteEmployee(Id);
    }

    public bool PutEmployee(PutEmployee form)
    {
        return _employeeService.PutEmployee(form.BllPutEmployeeToData());
    }

    public bool AddEmployee(Employee form) 
    {
        return _employeeService.AddEmployee(form.BllToDataEmployee());            
    }

    public Employee GetOne(int Id)
    {
        try{
            return _employeeService.GetOne(Id).DataToBllEmployee();
        }
        catch
        {
            return null;
        }
    }

}