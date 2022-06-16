using Microsoft.AspNetCore.Mvc;
using BusinessAccessLayer.IRepositories;
using ProjectSecurity.Tools;
using ProjectSecurity.Models.Town;
// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ProjectSecurity.Controllers;

[Route("api/[controller]")]
[ApiController]
public class TownController : ControllerBase
{
    private readonly ITownServices _townServices;

    public TownController(ITownServices townServices)
    {
        _townServices = townServices;
    }

    /// <summary>
    /// Controlleur récuperation des villes et codes postaux
    /// </summary>
    [HttpGet]
    public IActionResult Get()
    {
        try
        {
            return  Ok(_townServices.GetAll());
        }
        catch (NullReferenceException ex)
        {
            return BadRequest(ex.Message);
        }
    }
    /// <summary>
    /// Fonction qui va chercher le nom et l'id de tout les pays pour les formulaires
    /// </summary>
    /// <returns></returns>
    [HttpGet("contrys")]
    public IActionResult GetAllCountrys()
    {
        try
        {
            return Ok(_townServices.GetCountrysAll());
        }
        catch (NullReferenceException ex)
        {
            return BadRequest(ex.Message);
        }
    }
}
