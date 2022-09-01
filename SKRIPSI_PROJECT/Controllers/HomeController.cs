using SKRIPSI_PROJECT.Models;
using SKRIPSI_PROJECT.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SKRIPSI_PROJECT.Controllers
{
    public class HomeController : Controller
    {
        private UserRepository _userRepository = new UserRepository();

        //public HomeController(IUserRepository userRepository)
        //{
        //    _userRepository = userRepository;
        //}

        public ActionResult Index()
        {
            if (Session["sessionUser"] == null)
            {
                return RedirectToAction("signout");
            }

            tn_u_login user = (tn_u_login)Session["sessionUser"];
            return View(user);
        }

        public ActionResult SignOut()
        {

            Session["sessionUser"] = null;
            return View("index", "login");

        }

        /* login member */
        [AllowAnonymous]
        [HttpPost]
        public ActionResult SignIn(tn_u_login u)
        {

            bool decrypt = false;
            //HttpClient client = webApi.Initial();
            try
            {
                tn_u_login user = _userRepository.GetUsers(u.u_name);
                if (user.u_id != 0)
                {
                    decrypt = _userRepository.DecryptPassword(user.u_password, u.u_password);
                    if (decrypt)
                    {
                        Session["sessionUser"] = user;
                    }

                }
                else
                {
                    return Json("Unregistered", JsonRequestBehavior.AllowGet);
                }

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                return Json("Error", JsonRequestBehavior.AllowGet);
            }

            return Json(decrypt, JsonRequestBehavior.AllowGet);

        }
    }
}