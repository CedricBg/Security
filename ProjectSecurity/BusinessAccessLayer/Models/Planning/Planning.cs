using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessAccessLayer.Models.Planning
{
    public class Planning
    {
        public string StartTime { get; set; }
        public string EndTime { get; set; }
        public int? IdEmployee { get; set; }
        public string Customer { get; set; }
    }
}
