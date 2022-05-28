using BusinessAccessLayer.IRepositories;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ProjectSecurity.Models.Ronde;
using ProjectSecurity.Tools;

namespace ProjectSecurity.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RondeController : ControllerBase
    {
        private readonly IRondeServices _serviceRonde;

        public RondeController(IRondeServices serviceRonde)
        {
                _serviceRonde = serviceRonde;
        }

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
    }
}
