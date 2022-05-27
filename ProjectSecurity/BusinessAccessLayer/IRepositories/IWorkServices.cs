using BusinessAccessLayer.Models.Work;

namespace BusinessAccessLayer.IRepositories
{
    public interface IWorkServices
    {
        int StartWork(StartForm form);
        bool EndWork(int Id);
    }
}