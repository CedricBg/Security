

using DataAccessLayer.Models.Formulaire;
using BUSI = BusinessAccessLayer.Models.formulaire;

namespace BusinessAccessLayer.Tools.Formuliare;

public static class Mapper
{
    public static BUSI.Departement AllDept(this Departement dept)
    {
        return new BUSI.Departement
        {
            IdDepartement = dept.IdDepartement,
            Name = dept.Name,

        };
    }

    public static BUSI.Statut AllStatut(this Statut stat)
    {
        return new BUSI.Statut
        {
            Id = stat.Id,
            Classe = stat.Classe,
            ClasseName = stat.ClasseName,
        };
    }
}
