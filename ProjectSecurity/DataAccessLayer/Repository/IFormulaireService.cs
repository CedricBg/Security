using DataAccessLayer.Models.Formulaire;

namespace DataAccessLayer.Repository
{
    public interface IFormulaireService
    {
        IEnumerable<Departement> GetAllDept();
        IEnumerable<Statut> GetAllStatut();
    }
}