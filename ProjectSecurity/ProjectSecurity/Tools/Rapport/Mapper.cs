using ASP = ProjectSecurity.Models.Rapport;
using Bll = BusinessAccessLayer.Models.Rapport;

namespace ProjectSecurity.Tools.Rapport;

public static class Mapper
{
    public static Bll.RapportPost ASPToBllPost(this ASP.RapportPost form)
    {
        return new Bll.RapportPost
        {
            rapport = form.rapport,
            NameCustomer = form.NameCustomer,
        };
    }

    public static Bll.RapportPut ASPToBllPut(this ASP.RapportPut form)
    {
        return new Bll.RapportPut
        {
            RapportName = form.RapportName,
            Text = form.Text,
        };
    }
}
