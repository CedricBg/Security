using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessAccessLayer.Models
{
    public class PutEmployee
    {
        public int IdEmployee { get; set; }
        public string Name { get; set; }
        public string FirstName { get; set; }
        public string BirthDate { get; set; }
        public bool Vehicle { get; set; }
        public int SecurityCard { get; set; }
        public string EmployeeCardNumber { get; set; }
        public string RegistreNational { get; set; }
        public int IdLanguage { get; set; }
        public int IdInformation { get; set; }
    }
}
