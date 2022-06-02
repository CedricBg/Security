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

        public WorkController(IWorkServices workServices)
        {
            _workServices = workServices;
        }
        /// <summary>
        /// 
        /// </summary>
        [HttpGet("{id}")]
        public IActionResult Get(int id)
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
        public IActionResult Post(StartForm form)
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
