using AdoToolbox;
using DataAccessLayer.Models.Planning;
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

        /// <summary>
        /// Récupération d'un id par employee ou client
        /// </summary>

        public IEnumerable<Planning> getOneByCustomer(int IdCustomer)
        {
            Connection cnx = new Connection(_connectionString);
            Command cmd = new Command("getOneByCustomer", true);

            cmd.AddParameter("Customer", IdCustomer);

            return cnx.ExecuteReader(cmd, dr => dr.ReadToAccessPlanning());

        }
        public bool AddADay(Planning form)
        {
            Connection cnx = new Connection(_connectionString);
            Command cmd = new Command("AddDayWork", true);

            cmd.AddParameter("IdEmployee", form.IdEmployee);
            cmd.AddParameter("IdCustomer", form.IdCustomer);
            cmd.AddParameter("End", form.EndTime);
            cmd.AddParameter("Start", form.StartTime);

            return cnx.ExecuteNonQuery(cmd) == 1;
        }

        public bool PutPlanning(Planning form)
        {
            Connection cnx = new Connection(_connectionString);
            Command cmd = new Command("PutPlanning", true);

            cmd.AddParameter("IdEmployee", form.IdEmployee);
            cmd.AddParameter("IdCustomer", form.IdCustomer);
            cmd.AddParameter("End", form.EndTime);
            cmd.AddParameter("Start", form.StartTime);

            return cnx.ExecuteNonQuery(cmd) == 1;
        }

    }
}
