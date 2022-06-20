using BusinessAccessLayer.IRepositories;
using DataAccessLayer.Models;
using FakeItEasy;
using FluentAssertions;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ProjectSecurity.Controllers;
using ProjectSecurity.Models.Auth;
using ProjectSecurity.Tools;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UnitTest.Controller
{

    [TestClass]
    public class AuthControllerTests
    {

        private IAuthServices _authServices;
        private IHttpContextAccessor _httpContextAccessor;
        private AuthController _authController;
        public RegForm form = new RegForm()
        {
            Login = "ced",
            Id = 1,
            Password = "123"
        };

        public AuthControllerTests()
        {
            _authServices = A.Fake<IAuthServices>();

            _httpContextAccessor = A.Fake <HttpContextAccessor>();
            _authController = new AuthController(_authServices);
        }
            [TestMethod]
            public void AuthController_Post_returnSuccess()
            {
            var token = A.Fake<RegForm>();
                A.CallTo(() => _authServices.Login(form.AspToBllRegister()));

                var result = _authController.Post(form);
                result.Should().BeOfType<StatusCodeResult>();
                
            }
    }
}
