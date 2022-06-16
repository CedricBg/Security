using BusinessAccessLayer.IRepositories;
using BusinessAccessLayer.Models.formulaire;
using BusinessAccessLayer.Tools.Formuliare;
using DataAccessLayer.Repository;

namespace BusinessAccessLayer.Services;

public class formulaireServices : IformulaireServices
{
    private readonly IFormulaireService _customerServices;

    public formulaireServices(IFormulaireService customerServices)
    {
        _customerServices = customerServices;
    }

    public IEnumerable<Departement> GetallDept()
    {
        try
        {
            return _customerServices.GetAllDept().Select(dr => dr.AllDept());
        }
        catch (Exception)
        {
            return null;
        }
    }

    public IEnumerable<Statut> GetAllStatut()
    {
        try
        {
            return _customerServices.GetAllStatut().Select(dr => dr.AllStatut());
        }
        catch(Exception)
        {
            return null;
        }
        
    }
}
