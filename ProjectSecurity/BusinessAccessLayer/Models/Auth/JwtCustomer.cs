using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessAccessLayer.Models.Auth
{
    public class JwtCustomer
    {
        public string Name { get; set; }
        public int IdCust { get; set; }
        public int IdLanguage { get; set; }
        public string Login { get; set; }
        public string Role { get; set; }
    }
}
