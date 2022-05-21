using DATA = DataAccessLayer.Models;
using BusinessAccessLayer.Models;


namespace BusinessAccessLayer.Tools;

public static class Mapper
{
    public static Planning DataPlanningToBusi(this DATA.Planning form)
    {
        return new Planning
        {
            Id = form.Id,
            StartTime = form.StartTime,
            EndTime = form.EndTime,
            IdCustomer = form.IdCustomer,
            IdEmployee = form.IdEmployee
        };
    }
}
