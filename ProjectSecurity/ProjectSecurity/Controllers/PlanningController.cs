using BusinessAccessLayer.IRepositories;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace ProjectSecurity.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PlanningController : ControllerBase
    {
        private readonly IPlanningServices _planningServices;

        public PlanningController(IPlanningServices planningServices)
        {
            _planningServices = planningServices;
        }

        [HttpGet]
        public IActionResult GetOneById(int Id)
        {
            return Ok(_planningServices.getOneByCustomer(Id));
        }
    }
}
