﻿using BusinessAccessLayer.IRepositories;
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


        // POST api/<RapportController>
        [HttpPost]
        public IActionResult Post(RapportPost rapport)
        {
            return Ok(_rapportService.PostRapport(rapport.ASPToBllPost()));
        }

        [HttpPut]

        public IActionResult PutRapport(RapportPut rapport) 
        {
            return Ok(_rapportService.PutRapport(rapport.ASPToBllPut()));
        }
        //[HttpPut]

        //public IActionResult SaveRapport(RapportPut rapport)
        //{
        //    return Ok(_rapportService.SaveRapport(rapport.ASPToBllPut()));
        //}
    }
}
