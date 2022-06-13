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
    private readonly string _connectionString;

    public EmployeeService(IConfiguration config)
    {
        _connectionString = config.GetConnectionString("ConnectionString");
    }

    public bool AddEmployee(AddEmployee employee)
    {
        try
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
            cmd.AddParameter("IdStatut", employee.IdStatut);
            cmd.AddParameter("IdDepartement", employee.IdDepartement);

            return cnx.ExecuteNonQuery(cmd) == 1;
        }
        catch (Exception)
        {
            return false;
        }
    }

    public Employee GetOne(int id)
    {
        //try
        //{
            Connection cnx = new Connection(_connectionString);
            Command cmd = new Command("GetOneEmployee", true);
            cmd.AddParameter("Id", id);
            Employee employee = cnx.ExecuteReader(cmd, dr => dr.ReadToAspData()).Single();
        return employee;
        //}
        //catch (Exception)
        //{
        //    return null;
        //}
    }

    public IEnumerable<Employee> GetAll()
    {
        try
        {
            Connection cnx = new Connection(_connectionString);
            Command cmd = new Command("GatAllEmployee", true);
            IEnumerable<Employee> employees = cnx.ExecuteReader(cmd, dr => dr.ReadToAspData());

            return employees;
        }
        catch (Exception)
        {
            return null;
        }
    }

    public bool DeleteEmployee(int Id)
    {
        try
        {
            Connection cnx = new Connection(_connectionString);
            Command cmd = new Command("DeleteEmployee", true);

            cmd.AddParameter("IdEmployee", Id);
            return cnx.ExecuteNonQuery(cmd) == 1;
        }
        catch (Exception)
        {
            return false;
        }
    }

    public bool PutEmployee(PutEmployee form)
    {
        try
        {
            Connection cnx = new Connection(_connectionString);
            Command cmd = new Command("PutEmployee", true);

            cmd.AddParameter("Name", form.Name);
            cmd.AddParameter("firstName", form.FirstName);
            cmd.AddParameter("BirthDate", form.BirthDate);
            cmd.AddParameter("Vehicle", form.Vehicle);
            cmd.AddParameter("SecurityCard", form.SecurityCard);
            cmd.AddParameter("EmployeeCardNumber", form.EmployeeCardNumber);
            cmd.AddParameter("RegistreNational", form.RegistreNational);
            cmd.AddParameter("Language", form.Language);
            cmd.AddParameter("Departement", form.Departement);
            cmd.AddParameter("Phone", form.Phone);
            cmd.AddParameter("Street", form.Street);
            cmd.AddParameter("StreetNumber", form.StreetNbr);
            cmd.AddParameter("Email", form.Email);
            cmd.AddParameter("PostCode", form.PostCode);
            cmd.AddParameter("Country", form.Country);
            cmd.AddParameter("IdEmployee", form.IdEmployee);



            return cnx.ExecuteNonQuery(cmd) == 1;
        }
        catch (Exception)
        {
            return false;
        }
    }
    public bool DepartementTo(Belongs form)
    {
        try
        {
            Connection cnx = new Connection(_connectionString);
            Command cmd = new Command("DepartementOnEmployee", true);

            cmd.AddParameter("IdDepartement", form.IdDepartement);
            cmd.AddParameter("IdEmployee", form.IdEmployee);

            return cnx.ExecuteNonQuery(cmd) == 1;
        }
        catch (Exception)
        {
            return false;
        }
    }

}
