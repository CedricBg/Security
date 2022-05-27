using BusinessAccessLayer.Models.Auth;

namespace BusinessAccessLayer.IRepositories
{
    public interface IAuthServices
    {
        bool UpdateAccessContractor(updateForm form);
        bool RegisterAccessCustomer(RegForm form);
        bool RegisterAccessContract(RegForm form);
        bool RegisterAccessEmployee(RegForm form);
        string Login(RegForm form);
        string LoginCust(RegForm form);
    }
}