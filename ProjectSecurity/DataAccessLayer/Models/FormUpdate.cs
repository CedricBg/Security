using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Models
{
    public class FormUpdate
    {
        public string? Login { get; set; }
        public string? Password { get; set; }
        public string? PasswordNew { get; set; }
    }
}
