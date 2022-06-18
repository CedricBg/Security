using DataAccessLayer.Models.Planning;

namespace DataAccessLayer.Services
{
    public interface IPlanningService
    {
        IEnumerable<Planning> getOneByCustomer(int IdCustomer);
        bool AddADay(Planning form);
        public bool PutPlanning(Planning form);
        public IEnumerable<Planning> getByEmployee(int id);
    }
}