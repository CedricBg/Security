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
        try
        {
            return _employeeService.GetAll().Select(dr => dr.DataToBllEmployee());
        }
        catch (Exception)
        {
            return null;
        }
    }

    public bool DeleteEmployee(int Id)
    {
        try
        {
            return _employeeService.DeleteEmployee(Id);
        }
        catch(Exception)
        {
            return false;
        }
    }

    public bool PutEmployee(PutEmployee form)
    {
        try
        {
            return _employeeService.PutEmployee(form.BllPutEmployeeToData());
        }
        catch (Exception)
        {
            return false;
        }
    }

    public bool AddEmployee(AddEmployee form) 
    {
        try
        {
            return _employeeService.AddEmployee(form.BllToDataEmployee());
        }
        catch (Exception)
        {
            return false;
        }
    }

    public Employee GetOne(int Id)
    {
        try{
            Employee employee = _employeeService.GetOne(Id).DataToBllEmployee();
            return employee;
        }
        catch(Exception)
        {
            return null;
        }
    }
    public bool DepartementTo(Belongs form)
    {
        try
        {
            return _employeeService.DepartementTo(form.bllToDataBelongs());
        }
        catch (Exception)
        {
            return false;
        }
    }

}