using BusinessAccessLayer.IRepositories;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ProjectSecurity.Models.Planning;
using ProjectSecurity.Tools;

namespace ProjectSecurity.Controllers;

[Route("api/[controller]")]
[ApiController]
public class PlanningController : ControllerBase
{
    private readonly IPlanningServices _planningServices;

    public PlanningController(IPlanningServices planningServices)
    {
        _planningServices = planningServices;
    }
    /// <summary>
    /// Récupération des jours de travail par client
    /// </summary>
    
    [HttpGet("ByCustomer/{Id}")]
    public IActionResult GetPlanningCustomer(int Id)
    {
        try
        {
            return Ok(_planningServices.GetByDay(Id));
        }
        catch (Exception)
        {
            return BadRequest();
        }
    }
    /// <summary>
    /// Récupération des jours de travail par employee
    /// </summary>

    [HttpGet("ByEmployee/{Id}")]
    public IActionResult GetByEmployee(int Id)
    {
        try
        {
            return Ok(_planningServices.GetByemplo(Id));
        }
        catch (Exception)
        {
            return BadRequest();
        }
    }
    /// <summary>
    /// Création d'une journée sur le planning
    /// </summary>
    [HttpPost]
    public IActionResult PostPlanning(Planning form)
    {
        try
        {
            _planningServices.PostPlanning(form.ASPTOBLLPlanning());
            return StatusCode(StatusCodes.Status201Created); 
        }
        catch (Exception)
        {
            return BadRequest();
        }
    }
    /// <summary>
    /// Modifcation du planning
    /// </summary>
    [HttpPut]
    public IActionResult PutPlanning(Planning form)
    {
        try
        {
            _planningServices.PutPlanning(form.ASPTOBLLPlanning());
            return StatusCode(StatusCodes.Status201Created);
        }
        catch (Exception)
        {
            return BadRequest();
        }
    }
}
