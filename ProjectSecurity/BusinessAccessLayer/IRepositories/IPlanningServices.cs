using BusinessAccessLayer.Models.Planning;

namespace BusinessAccessLayer.IRepositories
{
    public interface IPlanningServices
    {
        public bool PutPlanning(Planning form);
        IEnumerable<Planning> GetByDay(int Id);
        bool PostPlanning(Planning form);

    }
}