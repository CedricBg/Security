
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

public class EmployeeService : IEmployeeService
{
    private string _connectionString;

    public EmployeeService(IConfiguration config)
    {
        _connectionString = config.GetConnectionString("ConnectionString");
    }

    public bool AddEmployee(Employee employee)
    {
        Connection cnx = new Connection(_connectionString);

        Command cmd = new Command("AddEmployee", true);

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

    public Employee GetOne(int id)
    {
        Connection cnx = new Connection(_connectionString);
        Command cmd = new Command("GetOneEmployee", true);
        cmd.AddParameter("Id", id);
        
        return cnx.ExecuteReader(cmd,dr => dr.ReadToAspData()).Single();
    }

    public IEnumerable<Employee> GetAll()
    {
        Connection cnx = new Connection(_connectionString);
        Command cmd = new Command("GatAllEmployee", true);

       return cnx.ExecuteReader(cmd, dr => dr.ReadToAspData());
    }

}
