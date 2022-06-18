using BusinessAccessLayer.IRepositories;
using BusinessAccessLayer.Services;
using Microsoft.AspNetCore.Mvc;
using ProjectSecurity.Models.Auth;
using ProjectSecurity.Tools;
using System.Text.Json;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ProjectSecurity.Controllers;

/// <summary>
/// Controller pour l'authentification
/// </summary>
[Route("api/[controller]")]
[ApiController]

public class AuthController : ControllerBase
{
    private readonly IAuthServices _servicesAuth;
    

    public AuthController(IAuthServices servicesAuth)
    {
        _servicesAuth = servicesAuth; 
    }
    /// <summary>
    /// Activation de la connexion au site pour les employées
    /// </summary>
    /// <param name="form"></param>
    /// <returns>Code 201 ou Bad request</returns>
    /// 
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
    /// <summary>
    /// Activation de la connexion au site pour les clients
    /// </summary>
    /// <param name="form"></param>
    /// <returns>Token</returns>
    [HttpPost("customer/")]
    public IActionResult RegisterCustomer(RegForm form)
    {
        try
        {
             return Ok(_servicesAuth.RegisterAccessCustomer(form.AspToBllRegister()));
    
        }
        catch (Exception)
        {
            return StatusCode(StatusCodes.Status400BadRequest);
        }
    }

    /// <summary>
    /// Mise à jour du mot de passe de clients, employées ou sous-traitans
    /// </summary>

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

    /// <summary>
    /// Login pour les employées
    /// </summary>
    [HttpPost("Employee/Login/")]
    public IActionResult Login(RegForm form)
    {
        try
        {
            if (!ModelState.IsValid)
            {
                return BadRequest();
            }
            return Ok(JsonSerializer.Serialize(_servicesAuth.Login(form.AspToBllRegister())));
        }
        catch (Exception ex)
        {
            return BadRequest(ex.Message);
        }
    }
    /// <summary>
    /// Login pour les clients
    /// </summary>

    [HttpPost("Customer/Login/")]
    public IActionResult Logincust(RegForm form)
    {
        try
        {
            if (!ModelState.IsValid)
            {
                return BadRequest();
            }
             return Ok(JsonSerializer.Serialize(_servicesAuth.LoginCust(form.AspToBllRegister())));

            
        }
        catch (Exception ex)
        {
            return BadRequest(ex.Message);
        }
    }


}
