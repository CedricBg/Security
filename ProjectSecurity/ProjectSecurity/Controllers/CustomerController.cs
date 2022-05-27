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
    public void Post(ASP.Customer form)
    {
        Ok(_customerService.AddCustomer(form.AspCustomerToBll()));
    }

    [HttpGet]
    public IActionResult GetAll()
    {
        return Ok(_customerService.GetAll());
    }

    [HttpGet("{Id}")]
    public IActionResult Get(int Id)
    {
        ASP.Customer customer = _customerService.CustomerById(Id).BusiCustomerToAsp();

        if (customer is not null)
        {
            return Ok(customer);
        }
        return NotFound();
    }


    [HttpPut]
    public IActionResult Put(ASP.PutCustomer form)
    {
        return Ok(_customerService.PutCustomer(form.AspPutCustomerToBll()));
    }

    
    [HttpDelete("{id}")]
    public IActionResult Delete(int id)
    {
        return Ok(_customerService.DeleteCustomer(id));
    }
}
