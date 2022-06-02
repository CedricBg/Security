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

        public IEnumerable<Planning> GetByDay(int Id)
        {
            return _planningService.getOneByCustomer(Id).Select(c => c.DataToBllPlanning());
        }

        public bool PostPlanning(Planning form)
        {
            return _planningService.AddADay(form.BllToDataPlanning());
        }
        
        public bool PutPlanning(Planning form)
        {
            return _planningService.PutPlanning(form.BllToDataPlanning());
        }

        
    }
}
