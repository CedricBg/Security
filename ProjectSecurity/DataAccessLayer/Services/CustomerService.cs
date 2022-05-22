using AdoToolbox;
using DataAccessLayer.Tools;
using DataAccessLayer.Models;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Services
{
    public class CustomerService : ICustomerService
    {
        string _connectionString;

        public CustomerService(IConfiguration connectionString)
        {
            _connectionString = connectionString.GetConnectionString("ConnectionString");
        }

        public Customer CustomerById(int Id)
        {
            Connection cnx = new Connection(_connectionString);
            Command cmd = new Command("CustomerById", true);

            cmd.AddParameter("IDCustomer", Id);

            return cnx.ExecuteReader(cmd,dr => dr.ReadCustomerToBLL()).Single();
        }

        public bool AddCustomer(Customer form)
        {
            Connection cnx = new Connection(_connectionString);
            Command cmd = new Command("AddCustomer", true);
            cmd.AddParameter("Name", form.Name);
            cmd.AddParameter("GeneralPhone", form.GeneralPhone);
            cmd.AddParameter("EmergencyPhone", form.EmergencyPhone);
            cmd.AddParameter("EmergencyEmail", form.EmergencyEmail);
            cmd.AddParameter("Street", form.Street);
            cmd.AddParameter("PostCode", form.PostCode);
            cmd.AddParameter("StreetNumber", form.StreetNumber);
            cmd.AddParameter("IdCountry", form.IdCountry);
            cmd.AddParameter("Phone", form.Phone);
            cmd.AddParameter("Email", form.Email);

            return cnx.ExecuteNonQuery(cmd) == 1;

        }
    }
}
