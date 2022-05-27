using DATA = DataAccessLayer.Models.Work;
using BLL = BusinessAccessLayer.Models.Work;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessAccessLayer.Tools.Work
{
    public static class Mapper
    {
        public static DATA.StartForm FromBllTOData(this BLL.StartForm form)
        {
            return new DATA.StartForm
            {
                IdCustomer = form.IdCustomer,
                IdEmployee = form.IdEmployee,
            };
        }
    }
}
