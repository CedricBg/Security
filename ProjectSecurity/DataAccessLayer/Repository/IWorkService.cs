using DataAccessLayer.Models.Work;

namespace DataAccessLayer.Repository
{
    public interface IWorkService
    {
        bool EndWork(int IdStart);
        int StartWork(StartForm form);
    }
}