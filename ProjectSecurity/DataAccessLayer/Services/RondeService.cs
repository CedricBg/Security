using AdoToolbox;
using DataAccessLayer.Models;
using DataAccessLayer.Models.Ronde;
using DataAccessLayer.Tools;
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
        public bool AddRfid(AddRfid form)
        {
            Connection cnx = new Connection(_connectionString);
            Command cmd = new Command("RfidRondes", true);

            cmd.AddParameter("RfidNumber", form.RfidNumber);
            cmd.AddParameter("IdCustomer", form.IdCustomer);
            cmd.AddParameter("Location",form.Location);

            return cnx.ExecuteNonQuery(cmd) == 1;
        }

        public bool AddRfidToRonde(RfidToRonde form)
        {
            Connection cnx = new Connection(_connectionString);
            Command cmd = new Command("AddPassage", true);

            cmd.AddParameter("IdRfid", form.IdRfid);
            cmd.AddParameter("IdRonde", form.IdRondes);

            return cnx.ExecuteNonQuery(cmd) == 1;
        }

        public IEnumerable<GetRonde> GetRonde(int Id)
        {
            Connection cnx = new Connection(_connectionString);
            Command cmd = new Command("GetRonde", true);

            cmd.AddParameter("IdCustomer", Id);

            return cnx.ExecuteReader(cmd, c => c.GetRonde());
        }
    }
}
