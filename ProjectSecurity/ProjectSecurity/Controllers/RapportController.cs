using BusinessAccessLayer.IRepositories;
using Microsoft.AspNetCore.Mvc;

namespace ProjectSecurity.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RapportController : ControllerBase
    {
        private readonly IRapportService _rapportService;

        public RapportController(IRapportService rapportService)
        {
            _rapportService = rapportService;
        }


        // POST api/<RapportController>
        [HttpPost("{Rapport}")]
        public IActionResult Post(string Rapport)
        {
            return Ok(_rapportService.PostRapport(Rapport));
        }

       
    }
}
