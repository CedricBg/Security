using BusinessAccessLayer.IRepositories;
using BusinessAccessLayer.Models.formulaire;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ProjectSecurity.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FormulaireController : ControllerBase
    {
        private readonly IformulaireServices _formulaireServices;

        public FormulaireController(IformulaireServices formulaireServices)
        {
            _formulaireServices = formulaireServices;
        }

        /// <summary>
        /// Réupération de la liste des Formulaires
        /// </summary>
        /// <returns></returns>

        [HttpGet("Departement")]
        public IActionResult GetDept()
        {
            try
            {
                return Ok(_formulaireServices.GetallDept());
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }   
        }

        /// <summary>
        /// Réupération de la liste des statuts
        /// </summary>
        /// <returns></returns>

        [HttpGet("Statut")]
        public IActionResult GetStat()
        {
            try
            {
                return Ok(_formulaireServices.GetAllStatut());
            }
            catch(Exception ex)
            {
                return BadRequest(ex.Message);
            }
            
        }


    }
}
