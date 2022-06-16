using DATA = DataAccessLayer.Models.Town;
using BUSI = BusinessAccessLayer.Models.Town;

namespace BusinessAccessLayer.Tools.Town;

public static class Mapper
{
    public static BUSI.Ville GetAll(this DATA.Ville ville)
    {
        return new BUSI.Ville
        {
            ville = ville.ville,
            codePostal = ville.codePostal
        };
    }
}
