using AdoToolbox;
using DataAccessLayer.Models.Ronde;
using DataAccessLayer.Repository;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Services
{
    public class RondeService : IRondeService
    {
        private readonly string _connectionString;

        public RondeService(IConfiguration config)
        {
            _connectionString = config.GetConnectionString("ConnectionString");
        }

        public bool AddRonde(AddRonde form)
        {
            Connection cnx = new Connection(_connectionString);
            Command cmd = new Command("CreateRonde", true);
            cmd.AddParameter("NameRonde", form.NameRonde);
            cmd.AddParameter("IdCustomer", form.IdCustomer);

            return cnx.ExecuteNonQuery(cmd) == 1;
        }
    }
}
