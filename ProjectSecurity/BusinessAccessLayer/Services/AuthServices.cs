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

    public string Login(RegForm form)
    {

        JwtUser user =  _servicesAuth.Login(form.BllToDataCustomer()).DataToBllJwtUser();
        string token = _tokenService.GenerateJwt(user);
        return token;
    }

    public bool UpdateAccessContractor(updateForm form)
    {
        return _servicesAuth.UpdateAccessContractor(form.BllToDataUpdate());
    }

    public bool RegisterAccessCustomer(RegForm form)
    {
        return _servicesAuth.RegisterAccessCustomer(form.BllToDataCustomer());
    }

    public bool RegisterAccessContract(RegForm form)
    {
        return _servicesAuth.RegisterAccessContract(form.BllToDataCustomer());
    }

    public bool RegisterAccessEmployee(RegForm form)
    {
        return _servicesAuth.RegisterAccessEmployee(form.BllToDataCustomer());
    }
}
