using DataAccessLayer.Repository;
using BusinessAccessLayer.Tools;
using DataAccessLayer.Services;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessAccessLayer.IRepositories;
using BusinessAccessLayer.Models.Planning;

namespace BusinessAccessLayer.Services
{
    public class PlanningService : IPlanningServices
    {
        private readonly IPlanningService _planningService;

        public PlanningService(IPlanningService planningService)
        {
            _planningService = planningService;
        }

        public IPlanningService Get_planningService()
        {
            return _planningService;
        }

        public IEnumerable<Planning> getOneByCustomer(int IdCustomer)
        {
            return _planningService.getOneByCustomer(IdCustomer).Select(dr => dr.DataPlanningToBusi());

        }
    }
}
