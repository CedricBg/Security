using BusinessAccessLayer.IRepositories;
using Microsoft.AspNetCore.Mvc;
using ProjectSecurity.Models.Work;
using ProjectSecurity.Tools;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ProjectSecurity.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class WorkController : ControllerBase
    {
        IWorkServices _workServices;
        /// <summary>
        /// Classe qui permet de réupérer l'heure d'arrivée et de départ de l'agent
        /// </summary>
        /// <param name="workServices"></param>
        public WorkController(IWorkServices workServices)
        {
            _workServices = workServices;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="id">Id de l'agent</param>
        /// <returns>heure</returns>
        [HttpPost("end/{id}")]
        public IActionResult End(int id)
        {
            try
            {
                return Ok(_workServices.EndWork(id));
            }
            catch(Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPost]
        public IActionResult Start(StartForm form)
        {
            try
            {
                return Ok(_workServices.StartWork(form.ASPTOBllWork()));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
