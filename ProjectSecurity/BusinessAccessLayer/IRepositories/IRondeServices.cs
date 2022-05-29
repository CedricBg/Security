using BusinessAccessLayer.Models.Ronde;

namespace BusinessAccessLayer.IRepositories
{
    public interface IRondeServices
    {
        bool AddRonde(Addronde form);
        bool AddRfid(AddRfid form);
        bool AddRfidToRonde(RfidToRonde form);
        IEnumerable<GetRonde> GetRonde(int Id);
    }
}