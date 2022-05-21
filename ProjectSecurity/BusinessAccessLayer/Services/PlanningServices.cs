using DataAccessLayer.Repository;
using BusinessAccessLayer.Models;
using BusinessAccessLayer.Tools;
using DataAccessLayer.Services;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessAccessLayer.IRepositories;

namespace BusinessAccessLayer.Services
{
    public class PlanningServices : IPlanningServices
    {
        private readonly IPlanningService _planningService;

        public PlanningServices(IPlanningService planningService)
        {
            _planningService = planningService;
        }

        public IPlanningService Get_planningService()
        {
            return _planningService;
        }

        public IEnumerable<Planning> getOneByCustomer(int IdCustomer)
        {

            IEnumerable<Planning> plan = _planningService.getOneByCustomer(IdCustomer).Select(dr => dr.DataPlanningToBusi());
            foreach(Planning planning in plan)
            {
                Console.WriteLine(planning.StartTime);

            }
            return plan;

        }
    }
}
