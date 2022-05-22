using BusinessAccessLayer.Models;
using BusinessAccessLayer.Tools;
using DataAccessLayer.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessAccessLayer.Services
{
    public class EmployeeServices : IEmployeeServices
    {
        private readonly IEmployeeService _employeeService;

        public EmployeeServices(IEmployeeService employeeService)
        {
            _employeeService = employeeService;
        }

        public bool DeleteEmployee(int Id)
        {
            return _employeeService.DeleteEmployee(Id);
        }

        public bool PutEmployee(PutEmployee form)
        {
            return _employeeService.PutEmployee(form.BllPutEmployeeToData());
        }
    }
}
