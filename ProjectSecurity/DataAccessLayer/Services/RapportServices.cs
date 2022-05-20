using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Services
{
    public class RapportServices
    {
        string _connectionString;
        public RapportServices(IConfiguration config)
        {
            _connectionString = config.GetConnectionString("connectionString");
        }
    }
}
