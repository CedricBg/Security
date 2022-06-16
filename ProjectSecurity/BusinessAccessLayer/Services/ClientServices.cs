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

    public bool AddCustomer(BUSI.Customer.PostCustomer form)
    {
        try
        {
            return _customerService.AddCustomer(form.BllToDataPostCutomer());
        }
        catch (Exception)
        {
            return false;
        }
    }

    public BUSI.Customer.Customer CustomerById(int Id)
    {
        try
        {
            return _customerService.CustomerById(Id).DataCustomerToBll();
        }
        catch (Exception)
        {
            return null;
        }
    }

    public bool PutCustomer(BUSI.Customer.PutCustomer form)
    {
        try
        {
            return _customerService.PutCustomer(form.BllPutCustomerToData());
        }
        catch (Exception)
        {
            return false;
        }
    }

    public bool DeleteCustomer(int Id)
    {
        try
        {
            return _customerService.DeleteCustomer(Id);
        }
        catch (Exception)
        {
            return false;
        }
    }

    public IEnumerable<BUSI.Customer.AllCustomer> GetAll()
    {
        try
        {
            return _customerService.GetAll().Select(x => x.DataToBllAllCustomer());
        }
        catch (Exception)
        {
            return null;
        }
    }
}
