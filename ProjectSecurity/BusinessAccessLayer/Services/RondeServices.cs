﻿using BusinessAccessLayer.IRepositories;
using BusinessAccessLayer.Models.Ronde;
using BusinessAccessLayer.Tools.Ronde;
using DataAccessLayer.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessAccessLayer.Services
{
    public class RondeServices : IRondeServices
    {
        private readonly IRondeService _serviceRonde;

        public RondeServices(IRondeService rondeService)
        {
            _serviceRonde = rondeService;
        }

        public bool AddRonde(Addronde form)
        {
            return _serviceRonde.AddRonde(form.AddRonde());
        }
    }
}
