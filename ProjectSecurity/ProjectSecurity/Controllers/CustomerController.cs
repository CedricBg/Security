using BusinessAccessLayer.Services;
using Microsoft.AspNetCore.Mvc;
using ASP = ProjectSecurity.Models.Customer;
using ProjectSecurity.Tools;
using ProjectSecurity.Models.Employee;

namespace ProjectSecurity.Controllers;

[Route("api/[controller]")]
[ApiController]
public class CustomerController : ControllerBase
{
    private readonly IClientServices _customerService;

    public CustomerController(IClientServices customerService)
    {
        _customerService = customerService;
    }
    /// <summary>
    /// Ajout d'un nouveau client
    /// </summary>
    /// <param name="form">formulaire avec les infos du client</param>
    /// <returns>l'erreur ou status 201 </returns>

    [HttpPost]
    public IActionResult Post(ASP.PostCustomer form)
    {
        try
        {
            _customerService.AddCustomer(form.ASPToBllPostCustomer());
            return StatusCode(StatusCodes.Status201Created);
        }
        catch (Exception ex)
        {
            return BadRequest(ex.Message);
        }
    }
    /// <summary>
    /// Réupération de la liste des clients
    /// </summary>
    /// <returns></returns>
    [HttpGet]
    public IActionResult GetAll()
    {
        try
        {
            return Ok(_customerService.GetAll());
        }
        catch (Exception ex)
        {
            return BadRequest(ex.Message);
        }
    }
    /// <summary>
    /// Récupèration d'un client par son id
    /// </summary>
    /// <param name="Id">nr de client dans la db</param>
    /// <returns></returns>
    [HttpGet("{Id}")]
    public IActionResult Get(int Id)
    {
        try
        {
            ASP.Customer customer = _customerService.CustomerById(Id).BusiCustomerToAsp();

            if (customer is not null)
            {
                return Ok(customer);
            }
            return NotFound();
        }
        catch (Exception ex)
        {
            return BadRequest(ex.Message);
        }
    }
    /// <summary>
    /// Mise à jour d'un client
    /// </summary>
    /// <param name="form">formuliare de mise à jour d'un client</param>
    /// <returns>l'erreur ou le status code 201</returns>
    [HttpPut]
    public IActionResult Put(ASP.PutCustomer form)
    {
        try
        {
            _customerService.PutCustomer(form.AspPutCustomerToBll());
            return StatusCode(StatusCodes.Status201Created);
        }
        catch (Exception ex)
        {
            return BadRequest(ex.Message);
        }
    }

    /// <summary>
    /// Supression d'un client (Attention trigger en place il passe en InActive et n'est pluis affiché pour le reste de l'appli)
    /// </summary>
    /// <param name="id">Id du clinet dans la db</param>
    /// <returns></returns>
    [HttpDelete("{id}")]
    public IActionResult Delete(int id)
    {
        try
        {
            _customerService.DeleteCustomer(id);
            return StatusCode(StatusCodes.Status201Created);
        }
        catch (Exception ex)
        {
            return BadRequest(ex.Message);
        }
    }
}
