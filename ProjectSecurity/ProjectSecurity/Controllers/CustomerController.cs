
using BusinessAccessLayer.Services;
using Microsoft.AspNetCore.Mvc;
using ProjectSecurity.Models;
using ProjectSecurity.Tools;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

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



    //// PUT api/<CustomerController>/5
    //[HttpPut("{id}")]
    //public void Put(int id, [FromBody] string value)
    //{
    //}

    //// DELETE api/<CustomerController>/5
    //[HttpDelete("{id}")]
    //public void Delete(int id)
    //{
    //}
}
