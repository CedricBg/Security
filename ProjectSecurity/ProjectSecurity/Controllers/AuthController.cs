using DataAccessLayer.Repository;
using DataAccessLayer.Services;
using Microsoft.AspNetCore.Mvc;
using ProjectSecurity.Models;
using ProjectSecurity.Tools;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ProjectSecurity.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly IAuthService _servicesAuth;

        public AuthController(IAuthService servicesAuth)
        {
            _servicesAuth = servicesAuth;
        }

        [HttpGet]
        public IActionResult Get()
        {
            return Ok();
        }


        [HttpPost("employee/")]
        public IActionResult Post(RegisterForm form)
        {
            _servicesAuth.RegisterAccessEmployee(form.AspToDataEmplo());
            return StatusCode(StatusCodes.Status201Created);
        }

        [HttpPost("contrator/")]
        public IActionResult Post(ContractorRegForm form)
        {
            _servicesAuth.RegisterAccessContract(form.AspToDataContrat());
            return StatusCode(StatusCodes.Status201Created);
        }

        [HttpPost("customer/")]
        public IActionResult Post(CustomerRegForm form)
        {
            _servicesAuth.RegisterAccessCustomer(form.AspToDataCustomer());
            return StatusCode(StatusCodes.Status201Created);
        }



    }
}
