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
        Connection cnx = new Connection(_connectionString);
        Command cmd = new Command("Loginemployee", true);

        cmd.AddParameter("Login", form.Login);
        cmd.AddParameter("Password", form.Password);

        return cnx.ExecuteReader(cmd, dr => dr.ReadJwtUserToBll()).Single();
    }

    public bool RegisterAccessEmployee(RegForm form)
    {
        Connection cnx = new Connection(_connectionString);

        Command cmd = new Command("RegisterAccessEmployee", true);

        cmd.AddParameter("Login", form.Login);
        cmd.AddParameter("Password", form.Password);
        cmd.AddParameter("Id", form.Id);

        return cnx.ExecuteNonQuery(cmd) == 1;
    }

    public bool RegisterAccessContract(RegForm form)
    {
        Connection cnx = new Connection(_connectionString);

        Command cmd = new Command("RegisterAccessContractor", true);

        cmd.AddParameter("Login", form.Login);
        cmd.AddParameter("Password", form.Password);
        cmd.AddParameter("Id", form.Id);

        return cnx.ExecuteNonQuery(cmd) == 1;
    }

    public bool RegisterAccessCustomer(RegForm form)
    {
        Connection cnx = new Connection(_connectionString);

        Command cmd = new Command("RegisterAccessCustomer", true);

        cmd.AddParameter("Login", form.Login);
        cmd.AddParameter("Password", form.Password);
        cmd.AddParameter("Id", form.Id);

        return cnx.ExecuteNonQuery(cmd) == 1;
    }

    public bool UpdateAccessContractor(FormUpdate form)
    {

        Connection cnx = new Connection(_connectionString);

        Command cmd = new Command("UpdateAccessContractor", true);
        cmd.AddParameter("Login", form.Login);
        cmd.AddParameter("Password", form.Password);
        cmd.AddParameter("New_Password", form.PasswordNew);

        return cnx.ExecuteNonQuery(cmd) == 1;
    }





}
