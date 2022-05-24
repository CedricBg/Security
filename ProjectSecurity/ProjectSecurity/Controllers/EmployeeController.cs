using BusinessAccessLayer.Services;
using DataAccessLayer.Services;
using Microsoft.AspNetCore.Mvc;
using ProjectSecurity.Models.Employee;
using ProjectSecurity.Tools;



namespace ProjectSecurity.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EmployeeController : ControllerBase
    {
        private readonly IEmployeeServices _EmployeeServices;

        public EmployeeController(IEmployeeServices employeeServices)
        {
            _EmployeeServices = employeeServices;
        }

        [HttpPost]
        public IActionResult Post(Employee form)
        {
            _EmployeeServices.AddEmployee(form.AspToBllEmployee());
            return StatusCode(StatusCodes.Status201Created);
        }

        [HttpGet("{Id}")]
        public IActionResult GetById(int Id)
        {
            Employee employee = _EmployeeServices.GetOne(Id).BllToAspEmployee();
            if(employee is not null)
            { 
                return Ok(employee);
            }
            return NotFound();
        }

        [HttpGet]
        public IActionResult GetAll()
        {
            return Ok(_EmployeeServices.GetAll());
        }

        [HttpDelete("{Id}")]
        public IActionResult DeleteEmployee(int Id)
        {
            return Ok(_EmployeeServices.DeleteEmployee(Id));
        }

        [HttpPut]
        public IActionResult PutEmployee(PutEmployee form)
        {
            return Ok(_EmployeeServices.PutEmployee(form.AspPutEmployeeToBusi()));
        }
    }
}
