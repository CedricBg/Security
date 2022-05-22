
using BusinessAccessLayer.Services;
using Microsoft.AspNetCore.Mvc;
using ProjectSecurity.Models;
using ProjectSecurity.Tools;


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
    public void Post(Customer form)
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
        Customer customer = _customerService.CustomerById(Id).BusiCustomerToAsp();

        if (customer is not null)
        {
            return Ok(customer);
        }
        return NotFound();
    }


    [HttpPut]
    public IActionResult Put(PutCustomer form)
    {
       
        return Ok(_customerService.PutCustomer(form.AspPutCustomerToBll()));
    }

    // DELETE api/<CustomerController>/5
    [HttpDelete("{id}")]
    public IActionResult Delete(int id)
    {
        return Ok(_customerService.DeleteCustomer(id));
    }
}
