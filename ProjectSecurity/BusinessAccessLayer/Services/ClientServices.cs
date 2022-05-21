using DataAccessLayer.Models;
using DataAccessLayer.Services;
using BUSI = BusinessAccessLayer.Models;
using BusinessAccessLayer.Tools;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessAccessLayer.Services;

public class ClientServices : IClientServices
{
    private readonly ICustomerService _customerService;

    public ClientServices(ICustomerService customerService)
    {
        _customerService = customerService;
    }

    public bool AddCustomer(BUSI.Customer form)
    {
        return _customerService.AddCustomer(form.BusiCustomerToData());
    }

    public Customer CustomerById(int Id)
    {
        return _customerService.CustomerById(Id);
    }
}
