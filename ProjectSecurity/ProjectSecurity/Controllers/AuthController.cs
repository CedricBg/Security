using BusinessAccessLayer.IRepositories;
using BusinessAccessLayer.Services;
using Microsoft.AspNetCore.Mvc;
using ProjectSecurity.Models.Auth;
using ProjectSecurity.Tools;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ProjectSecurity.Controllers;

[Route("api/[controller]")]
[ApiController]
public class AuthController : ControllerBase
{
    private readonly IAuthServices _servicesAuth;
    

    public AuthController(IAuthServices servicesAuth)
    {
        _servicesAuth = servicesAuth;
       
    }


    [HttpPost("employee/")]
    public IActionResult Post(RegForm form)
    {
        _servicesAuth.RegisterAccessEmployee(form.AspToBllRegister());
        return StatusCode(StatusCodes.Status201Created);
    }

    [HttpPost("contrator/")]
    public IActionResult RegisterContractor(RegForm form)
    {
        _servicesAuth.RegisterAccessContract(form.AspToBllRegister());
        return StatusCode(StatusCodes.Status201Created);
    }

    [HttpPost("customer/")]
    public IActionResult RegisterCustomer(RegForm form)
    {
        _servicesAuth.RegisterAccessCustomer(form.AspToBllRegister());
        return StatusCode(StatusCodes.Status201Created);
    }

    [HttpPut]
    public IActionResult Post(UpdateForm form)
    {
       return Ok(_servicesAuth.UpdateAccessContractor(form.AspToBLLUpdate())); 
    }

   
    [HttpPost("Login/")]
    public IActionResult Login(RegForm form)
    {
        return Ok(_servicesAuth.Login(form.AspToBllRegister()));
    }


}
