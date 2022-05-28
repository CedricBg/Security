using BusinessAccessLayer.Services;
using DataAccessLayer.Services;
using Microsoft.AspNetCore.Authorization;
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
        public IActionResult Post(AddEmployee form)
        {
            try
            {
                _EmployeeServices.AddEmployee(form.AspToBllEmployee());
                return StatusCode(StatusCodes.Status201Created);
            }
            catch (Exception)
            {
                return StatusCode(StatusCodes.Status404NotFound);
            }
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
            try
            {
                return Ok(_EmployeeServices.GetAll());
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpDelete("{Id}")]
        public IActionResult DeleteEmployee(int Id)
        {
            try
            {
                return Ok(_EmployeeServices.DeleteEmployee(Id));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPut]
        public IActionResult PutEmployee(PutEmployee form)
        {
            try
            {
                return Ok(_EmployeeServices.PutEmployee(form.AspPutEmployeeToBusi()));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }

        }

        [HttpPost("Departement/")]
        public IActionResult DepartementTo(Belongs form)
        {
            try
            {
                return Ok(_EmployeeServices.DepartementTo(form.ASPToBllBelongs()));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
