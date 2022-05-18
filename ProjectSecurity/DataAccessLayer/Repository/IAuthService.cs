using DataAccessLayer.Models;

namespace DataAccessLayer.Repository
{
    public interface IAuthService
    {
        bool RegisterAccessEmployee(RegisterForm form);
        bool RegisterAccessContract(RegisterForm form);
        bool RegisterAccessCustomer(RegisterForm form);
    }
}