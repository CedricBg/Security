
using AdoToolbox;
using DataAccessLayer.Models;
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

    public bool RegisterAccessEmployee(RegisterForm form)
    {
        Connection cnx = new Connection(_connectionString);

        Command cmd = new Command("RegisterAccessEmployee", true);

        cmd.AddParameter("Login", form.Login);
        cmd.AddParameter("Password", form.Password);
        cmd.AddParameter("Id", form.Id);

        return cnx.ExecuteNonQuery(cmd) == 1;
    }

    public bool RegisterAccessContract(RegisterForm form)
    {
        Connection cnx = new Connection(_connectionString);

        Command cmd = new Command("RegisterAccessContractor", true);

        cmd.AddParameter("Login", form.Login);
        cmd.AddParameter("Password", form.Password);
        cmd.AddParameter("Id", form.Id);

        return cnx.ExecuteNonQuery(cmd) == 1;
    }

    public bool RegisterAccessCustomer(RegisterForm form)
    {
        Connection cnx = new Connection(_connectionString);

        Command cmd = new Command("RegisterAccessCustomer", true);

        cmd.AddParameter("Login", form.Login);
        cmd.AddParameter("Password", form.Password);
        cmd.AddParameter("Id", form.Id);

        return cnx.ExecuteNonQuery(cmd) == 1;
    }

    




}
