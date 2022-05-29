using BusinessAccessLayer.IRepositories;
using BusinessAccessLayer.Models.Ronde;
using BusinessAccessLayer.Tools.Ronde;
using DataAccessLayer.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessAccessLayer.Services
{
    public class RondeServices : IRondeServices
    {
        private readonly IRondeService _serviceRonde;

        public RondeServices(IRondeService rondeService)
        {
            _serviceRonde = rondeService;
        }

        public IEnumerable<GetRonde> GetRonde(int Id)
        {
            try
            {
                return _serviceRonde.GetRonde(Id).Select(c => c.GetRonde());
            }
            catch (Exception)
            {
                return null;
            }
        }

        public bool AddRonde(Addronde form)
        {
            try
            {
                return _serviceRonde.AddRonde(form.AddRonde());
            }
            catch (Exception)
            {
                return false;
            }
        }
        public bool AddRfid(AddRfid form)
        {
            try
            {
                return _serviceRonde.AddRfid(form.AddRfid());
            }
            catch (Exception)
            {
                return false;
            }
        }
        public bool AddRfidToRonde(RfidToRonde form)
        {
            try
            {
                return _serviceRonde.AddRfidToRonde(form.RfiToRondeToData());
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}
