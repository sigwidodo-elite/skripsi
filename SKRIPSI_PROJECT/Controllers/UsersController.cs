using SKRIPSI_PROJECT.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SKRIPSI_PROJECT.Controllers
{
    public class UsersController : Controller
    {

        private readonly IUserRepository _userRepository;

        public UsersController(IUserRepository userRepository)
        {
            _userRepository = userRepository;
        }

        // GET: Users
        public ActionResult Index()
        {
            return View();
        }
    }
}