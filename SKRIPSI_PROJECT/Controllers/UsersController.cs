using SKRIPSI_PROJECT.Models;
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

        private UserRepository userRepository = new UserRepository();
        private static string path = "/views/master/";


        public ActionResult User()
        {
            if (Session["sessionUser"] == null)
            {
                return RedirectToAction("signout", "Home");
            }

            tn_u_login user = (tn_u_login)Session["sessionUser"];
            return View(path + "master_user.cshtml", user);
        }

        [HttpGet]
        public JsonResult GetListUser()
        {

            List<tn_u_login> listUser = userRepository.GetUserLogin();
            var jsonResult = Json(listUser, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;

        }

        [HttpPost]
        public ActionResult SaveUser(tn_u_login usr)
        {

            if (Session["sessionUser"] == null)
            {
                return Json("timeout", JsonRequestBehavior.AllowGet);
            }

            bool save = false;
            try
            {

                tn_u_login user = (tn_u_login)Session["sessionUser"];
                usr.created_by = user.u_id;
                save = userRepository.SaveUserLogin(usr);

            }
            catch (Exception e)
            {

                Console.WriteLine(e);
                return Json("error", JsonRequestBehavior.AllowGet);

            }

            return Json(save, JsonRequestBehavior.AllowGet);

        }

        [HttpPost]
        public ActionResult DeleteUser(int? id)
        {

            if (Session["sessionUser"] == null)
            {
                return Json("timeout", JsonRequestBehavior.AllowGet);
            }

            bool delete = false;
            try
            {
                delete = userRepository.DeleteUser(id);
            }
            catch (Exception e)
            {

                Console.WriteLine(e);
                return Json("error", JsonRequestBehavior.AllowGet);

            }

            return Json(delete, JsonRequestBehavior.AllowGet);

        }
    }
}