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
        try
        {
            _servicesAuth.RegisterAccessEmployee(form.AspToBllRegister());
            return StatusCode(StatusCodes.Status201Created);
        }
        catch (Exception)
        {
            return StatusCode(StatusCodes.Status400BadRequest);
        } 
    }

    [HttpPost("contrator/")]
    public IActionResult RegisterContractor(RegForm form)
    {
        try
        {
            _servicesAuth.RegisterAccessContract(form.AspToBllRegister());
            return StatusCode(StatusCodes.Status201Created);
        }
        catch (Exception)
        {
            return StatusCode(StatusCodes.Status400BadRequest);
        }
    }

    [HttpPost("customer/")]
    public IActionResult RegisterCustomer(RegForm form)
    {
        try
        {
            _servicesAuth.RegisterAccessCustomer(form.AspToBllRegister());
            return StatusCode(StatusCodes.Status201Created);
        }
        catch (Exception)
        {
            return StatusCode(StatusCodes.Status400BadRequest);
        }
    }

    [HttpPut]
    public IActionResult Post(UpdateForm form)
    {
        try
        {
            return Ok(_servicesAuth.UpdateAccessContractor(form.AspToBLLUpdate()));
        }
        catch (Exception)
        {
            return BadRequest();
        }
    }

   
    [HttpPost("Employee/Login/")]
    public IActionResult Login(RegForm form)
    {
        try
        {
            return Ok(_servicesAuth.Login(form.AspToBllRegister()));
        }
        catch (Exception)
        {
            return BadRequest();
        }
    }

    [HttpPost("Customer/Login/")]
    public IActionResult Logincust(RegForm form)
    {
        try
        {
            return Ok(_servicesAuth.LoginCust(form.AspToBllRegister()));
        }
        catch (Exception)
        {
            return BadRequest();
        }
    }


}
