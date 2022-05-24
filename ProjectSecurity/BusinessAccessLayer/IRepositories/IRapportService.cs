using BusinessAccessLayer.Models.Rapport;

namespace BusinessAccessLayer.IRepositories
{
    public interface IRapportService
    {
        string PostRapport(RapportPost rapport);
        bool PutRapport(RapportPut rapport);
        bool SaveRapport(RapportPut rapport);
    }
}