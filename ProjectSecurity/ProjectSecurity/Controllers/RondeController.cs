using BusinessAccessLayer.IRepositories;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ProjectSecurity.Models.Ronde;
using ProjectSecurity.Tools;

namespace ProjectSecurity.Controllers
{
    /// <summary>
    /// Controller pour la gestion des rondes
    /// </summary>

    [Route("api/[controller]")]
    [ApiController]
    public class RondeController : ControllerBase
    {
        private readonly IRondeServices _serviceRonde;

        public RondeController(IRondeServices serviceRonde)
        {
                _serviceRonde = serviceRonde;
        }
        /// <summary>
        /// Ajout du nom de la ronde lié à l'id du client
        /// </summary>

        [HttpPost]
        public IActionResult AddRonde(AddRonde form)
        {
            try
            {
                _serviceRonde.AddRonde(form.AdDRonde());
                return StatusCode(StatusCodes.Status201Created);
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }
        /// <summary>
        /// Ajout d'une pastille rfid chez les clients
        /// </summary>

        [HttpPost("rfid/")]
        public IActionResult AddRfid(AddRfid form)
        {
            try
            {
                _serviceRonde.AddRfid(form.AddRfid());
                return StatusCode(StatusCodes.Status201Created);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        /// <summary>
        /// Ajout d'une pastille à une ronde
        /// </summary>

        [HttpPost("AjoutRfid")]
        public IActionResult AddRfidToRonde(RfidToRonde form)
        {
            try
            {
                return Ok(_serviceRonde.AddRfidToRonde(form.RfidToRondeToBll()));
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }
        /// <summary>
        /// récupération des rondes par client
        /// </summary>
        /// 
        [HttpPost("GetRonde")]
        public IActionResult GetRonde(int Id)
        {
            try
            {
                return Ok(_serviceRonde.GetRonde(Id));
            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }
            
        }
    }
}
