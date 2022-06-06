using AdoToolbox;
using DataAccessLayer.Models.Auth;
using DataAccessLayer.Repository;
using DataAccessLayer.Tools;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Services;



public class AuthService : IAuthService
{
    private string _connectionString;


    public AuthService(IConfiguration config)
    {
        _connectionString = config.GetConnectionString("ConnectionString");
    }

    public JwtUser Login(RegForm form)
    {
        try
        {
            Connection cnx = new Connection(_connectionString);
            Command cmd = new Command("Loginemployee", true);

            cmd.AddParameter("Login", form.Login);
            cmd.AddParameter("Password", form.Password);
            JwtUser user = cnx.ExecuteReader(cmd, dr => dr.ReadJwtUserToBll()).Single();
            return user;
        }
        catch (Exception)
        {
            return null;
        }
    }
    public JwtCustomer LoginCust(RegForm form)
    {
         
        try
        {
            Connection cnx = new Connection(_connectionString);
            Command cmd = new Command("LoginCustomer", true);
            cmd.AddParameter("Login", form.Login);
            cmd.AddParameter("Password", form.Password);
            
            JwtCustomer retour = cnx.ExecuteReader(cmd, dr => dr.ReadToDataJwtCustomer()).Single();
           
            return retour;
        }
        catch (Exception)
        {
            return null;
        }
    }

    public bool RegisterAccessEmployee(RegForm form)
    {
        try
        {
            Connection cnx = new Connection(_connectionString);

            Command cmd = new Command("RegisterAccessEmployee", true);

            cmd.AddParameter("Login", form.Login);
            cmd.AddParameter("Password", form.Password);
            cmd.AddParameter("Id", form.Id);

            return cnx.ExecuteNonQuery(cmd) == 1;
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
            Connection cnx = new Connection(_connectionString);

            Command cmd = new Command("RegisterAccessContractor", true);

            cmd.AddParameter("Login", form.Login);
            cmd.AddParameter("Password", form.Password);
            cmd.AddParameter("Id", form.Id);

            return cnx.ExecuteNonQuery(cmd) == 1;
        }
        catch(Exception)
        {
            return false;
        }
    }

    public bool RegisterAccessCustomer(RegForm form)
    {
        try { 
        Connection cnx = new Connection(_connectionString);

        Command cmd = new Command("RegisterAccessCustomer", true);

        cmd.AddParameter("Login", form.Login);
        cmd.AddParameter("Password", form.Password);
        cmd.AddParameter("Id", form.Id);

        return cnx.ExecuteNonQuery(cmd) == 1;
        }
        catch (Exception)
        {
            return false;
        }
    }

    public bool UpdateAccessContractor(FormUpdate form)
    {
        try {
        Connection cnx = new Connection(_connectionString);

        Command cmd = new Command("UpdateAccessContractor", true);
        cmd.AddParameter("Login", form.Login);
        cmd.AddParameter("Password", form.Password);
        cmd.AddParameter("New_Password", form.PasswordNew);

        return cnx.ExecuteNonQuery(cmd) == 1;
    }
        catch(Exception)
        {
            return false;
        }
    }





}
