using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Models.Ronde
{
    public class AddRfid
    {
        public string Location { get; set; }
        public int IdCustomer { get; set; }
        public string RfidNumber { get; set; }
    }
}
