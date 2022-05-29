using DataAccessLayer.Models;
using DataAccessLayer.Models.Ronde;

namespace DataAccessLayer.Repository
{
    public interface IRondeService
    {
        bool AddRonde(AddRonde form);
        bool AddRfid(AddRfid form);
        bool AddRfidToRonde(RfidToRonde form);
        IEnumerable<GetRonde> GetRonde(int Id);
    }
}