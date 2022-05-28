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
