using BusinessAccessLayer.Models.formulaire;

namespace BusinessAccessLayer.IRepositories
{
    public interface IformulaireServices
    {
        IEnumerable<Departement> GetallDept();
        IEnumerable<Statut> GetAllStatut();
    }
}