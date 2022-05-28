using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessAccessLayer.Models.Employee
{
    public class AddEmployee
    {
        public string Name { get; set; }
        public string FirstName { get; set; }
        public string BirthDate { get; set; }
        public bool Vehicle { get; set; }
        public int SecurityCard { get; set; }
        public string EmployeeCardNumber { get; set; }
        public string EntryService { get; set; }
        public string RegistreNational { get; set; }
        public int IdLanguage { get; set; }
        public string IdInformation { get; set; }
        public int IdStatut { get; set; }
        public int IdDepartement { get; set; }
    }
}
