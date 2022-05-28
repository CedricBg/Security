using DataAccessLayer.Repository;
using Data = DataAccessLayer.Models;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessAccessLayer.Tools;
using BusinessAccessLayer.IRepositories;
using BusinessAccessLayer.Models.Auth;

namespace BusinessAccessLayer.Services;

public class AuthServices : IAuthServices
{
    private readonly IAuthService _servicesAuth;
    private readonly TokenService _tokenService;

    public AuthServices(IAuthService autService, TokenService tokenService)
    {
        _servicesAuth = autService;
        _tokenService = tokenService;
    }

    public string LoginCust(RegForm form)
    {
        try
        {
            JwtUser user = _servicesAuth.LoginCust(form.BllToDataCustomer()).DataToBllJwtCustomer();
            string token = _tokenService.GenerateJwt(user);
            return token;
        }
        catch(Exception ex)
        {
            return ex.Message;
        }
    }

    public string Login(RegForm form)
    {
        try
        {
            JwtUser user = _servicesAuth.Login(form.BllToDataCustomer()).DataToBllJwtUser();
            string token = _tokenService.GenerateJwt(user);
            return token;
        }
        catch (Exception ex)
        {
            return ex.Message;
        }
    }

    public bool UpdateAccessContractor(updateForm form)
    {
        try
        {
            return _servicesAuth.UpdateAccessContractor(form.BllToDataUpdate());
        }
        catch (Exception)
        {
            return false;
        }
    }

    public bool RegisterAccessCustomer(RegForm form)
    {
        try 
        { 
            return _servicesAuth.RegisterAccessCustomer(form.BllToDataCustomer());
        }
        catch (Exception)
        {
            return false;
        }
    }

    public bool RegisterAccessContract(RegForm form)
    {
        try
        {
            return _servicesAuth.RegisterAccessContract(form.BllToDataCustomer());
        }
        catch (Exception)
        {
            return false;
        }
    }

    public bool RegisterAccessEmployee(RegForm form)
    {
        try 
        {
            return _servicesAuth.RegisterAccessEmployee(form.BllToDataCustomer());
        }
        catch (Exception)
        {
            return false;
        }
    }
}
