using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessAccessLayer.Models.Employee
{
    public class PutEmployee
    {
        public int id { get; set; }
        public string Name { get; set; }
        public string FirstName { get; set; }
        public string BirthDate { get; set; }
        public bool Vehicle { get; set; }
        public int SecurityCard { get; set; }
        public string EmployeeCardNumber { get; set; }
        public string RegistreNational { get; set; }
        public string Language { get; set; }
        public string Departement { get; set; }
        public string Email { get; set; }
        public string PostCode { get; set; }
        public string Phone { get; set; }
        public string Street { get; set; }
        public string StreetNumber { get; set; }
        public string Country { get; set; }
        public string Role { get; set; }
    }
}
