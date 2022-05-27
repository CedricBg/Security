using BusinessAccessLayer.IRepositories;
using BusinessAccessLayer.Models.Work;
using BusinessAccessLayer.Tools.Work;
using DataAccessLayer.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessAccessLayer.Services
{
    public class WorkServices : IWorkServices
    {
        private readonly IWorkService _workService;

        public WorkServices(IWorkService workService)
        {
            _workService = workService;
        }

        public int StartWork(StartForm form)
        {
            try
            {
                return _workService.StartWork(form.FromBllTOData());
            }
            catch
            {
                return 0;
            }
            
        }

        public bool EndWork(int Id)
        {
            return _workService.EndWork(Id);
        }

    }
}
