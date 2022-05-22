using BusinessAccessLayer.Services;
using DataAccessLayer.Services;
using Microsoft.AspNetCore.Mvc;
using ProjectSecurity.Models;
using ProjectSecurity.Tools;



namespace ProjectSecurity.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EmployeeController : ControllerBase
    {
        private readonly IEmployeeService _EmployeeService;
        private readonly IEmployeeServices _EmployeeServices;

        public EmployeeController(IEmployeeService EmployeeService, IEmployeeServices employeeServices)
        {
            _EmployeeService = EmployeeService;
            _EmployeeServices = employeeServices;
        }

        [HttpPost]
        public IActionResult Post(Employee form)
        {
            _EmployeeService.AddEmployee(form.AspToDataCustomer());
            return StatusCode(StatusCodes.Status201Created);
        }

        [HttpGet("{Id}")]
        public IActionResult GetById(int Id)
        {
            Employee employee = _EmployeeService.GetOne(Id).DataToAspEmployee();
            if(employee is not null)
            { 
                return Ok(employee);
            }
            return NotFound();
        }

        [HttpGet]
        public IActionResult GetAll()
        {
            return Ok(_EmployeeService.GetAll());
        }

        [HttpDelete("{Id}")]
        public IActionResult DeleteEmployee(int Id)
        {
            return Ok(_EmployeeService.DeleteEmployee(Id));
        }

        [HttpPut]
        public IActionResult PutEmployee(PutEmployee form)
        {
            return Ok(_EmployeeServices.PutEmployee(form.AspPutEmployeeToBusi()));
        }
    }
}
