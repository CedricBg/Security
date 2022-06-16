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
        /// <summary>
        /// Ajout d'un nouvel employée
        /// </summary>
        /// <param name="form">totues les infos d'un employée</param>
        /// <returns>Le status 404 en cas d'erreur</returns>
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
        /// <summary>
        /// Renvoi un employé par rapport à son id
        /// </summary>
        /// <param name="Id">nr id de l'employée</param>
        /// <returns>Not found si existe pas</returns>
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
        /// <summary>
        /// Renvoir une liste de toutr les employées
        /// </summary>
        /// <returns>L'erreur en cas d'échec</returns>

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
        /// <summary>
        /// suppression de employee
        /// </summary>
        /// <param name="Id">nr de l'agent dans la db</param>
        /// <returns>message en cas d'erreur</returns>
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
        /// <summary>
        /// Mise à jouir d'un employee
        /// </summary>
        /// <param name="form">formulaire avec totues les infos de l'agent</param>
        /// <returns>le message d'erreur</returns>
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
        /// <summary>
        /// Retourne le departement pour lequel l'employée travail
        /// </summary>
        /// <param name="form">nr employee , nr du departement</param>
        /// <returns>Liste de departements possibles</returns>
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
