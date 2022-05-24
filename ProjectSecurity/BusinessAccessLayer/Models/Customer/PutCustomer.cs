using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessAccessLayer.Models.Customer
{
    public class PutCustomer
    {
        public int IdCustomer { get; set; }
        public string Name { get; set; }
        public string GeneralPhone { get; set; }
        public string EmergencyPhone { get; set; }
        public string EmergencyEmail { get; set; }
        public int IdInformation { get; set; }
        public string Street { get; set; }
        public string PostCode { get; set; }
        public string StreetNumber { get; set; }
        public int IdCountry { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
    }
}
