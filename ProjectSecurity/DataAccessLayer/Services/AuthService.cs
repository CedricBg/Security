using AdoToolbox;
using DataAccessLayer.Models;
using DataAccessLayer.Tools;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Services;



public class AuthService
{
    private string _connectionString;
    Mapper mapper;

    public AuthService(IConfiguration config)
    {
        _connectionString = config.GetConnectionString("ConnectionString");
        mapper = new Mapper();
    }

    public bool Register(RegisterForm form)
    {
        Connection cnx = new Connection(_connectionString);

        Command cmd = new Command("Register", true);

        cmd.AddParameter("Login", form.Login);
        cmd.AddParameter("Password", form.Password);
        cmd.AddParameter("Statut", form.Statut);
        cmd.AddParameter("Id", form.Id);

        return cnx.ExecuteNonQuery(cmd) == 1;
    }

    public bool AddUser(Employee employee)
    {
        Connection cnx = new Connection(_connectionString);

        Command cmd = new Command("AddUser", true);

        cmd.AddParameter("Name", employee.Name);
        cmd.AddParameter("FirstName", employee.FirstName);
        cmd.AddParameter("BirthDate", employee.BirthDate);
        cmd.AddParameter("Vehicle", employee.Vehicle);
        cmd.AddParameter("SecurityCard", employee.SecurityCard);
        cmd.AddParameter("EmployeeCardNumber", employee.EmployeeCardNumber);
        cmd.AddParameter("EntryService", employee.EntryService); 
        cmd.AddParameter("RegistreNational", employee.RegistreNational);
        cmd.AddParameter("IdLanguage", employee.IdLanguage);
        cmd.AddParameter("IdInformation", employee.IdInformation);
        cmd.AddParameter("IdStatut", employee.IdStatut);

        return cnx.ExecuteNonQuery(cmd) == 1;
    }
}
