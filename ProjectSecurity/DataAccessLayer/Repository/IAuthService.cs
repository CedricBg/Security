using DataAccessLayer.Models;

namespace DataAccessLayer.Repository
{
    public interface IAuthService
    {
        bool RegisterAccessEmployee(RegForm form);
        bool RegisterAccessContract(RegForm form);
        bool RegisterAccessCustomer(RegForm form);
        bool UpdateAccessContractor(FormUpdate form);
    }
}