using AdoToolbox;
using DataAccessLayer.Models;
using DataAccessLayer.Tools;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Services
{
    public class PlanningService : IPlanningService
    {
        private string _connectionString;
        public PlanningService(IConfiguration config)
        {
            _connectionString = config.GetConnectionString("connectionString");
        }

        public IEnumerable<Planning> getOneByCustomer(int IdCustomer)
        {
            Connection cnx = new Connection(_connectionString);
            Command cmd = new Command("getOneByCustomer", true);

            cmd.AddParameter("Employee", IdCustomer);

            return cnx.ExecuteReader(cmd, dr => dr.ReadToAccessPlanning());

        }

    }

}
