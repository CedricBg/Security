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

        public EmployeeController(IEmployeeService EmployeeService)
        {
            _EmployeeService = EmployeeService;
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

    }
}
