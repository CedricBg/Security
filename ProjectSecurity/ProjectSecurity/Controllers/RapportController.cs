using BusinessAccessLayer.IRepositories;
using Microsoft.AspNetCore.Mvc;
using ProjectSecurity.Models.Rapport;
using ProjectSecurity.Tools.Rapport;

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

        /// <summary>
        /// Création de'un rapport
        /// </summary>

        [HttpPost]
        public IActionResult Post(RapportPost rapport)
        {
            try
            {
                return Ok(_rapportService.PostRapport(rapport.ASPToBllPost()));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        /// <summary>
        /// Ajout ou modification au rapport
        /// </summary>
        [HttpPut]
        public IActionResult PutRapport(RapportPut rapport)
        {
            try
            {
                return Ok(_rapportService.PutRapport(rapport.ASPToBllPut()));
            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }
        }
        /// <summary>
        /// Création d'un pdf à la fermeture d'un rapport
        /// </summary>

        [HttpPut("pdf/")]
        public IActionResult SaveRapport(RapportPut rapport)
        {
            try
            {
                return Ok(_rapportService.SaveRapport(rapport.ASPToBllPut()));
            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }
        }
    }
}
