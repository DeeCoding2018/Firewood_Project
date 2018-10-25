using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Firewood_Project.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Order()
        {
            ViewBag.Messsage = "Your order page";

            return View();
        }

        public ActionResult Login()
        {
            ViewBag.Messsage = "Your login page";

            return View();
        }

        public ActionResult Register()
        {
            ViewBag.Messsage = "Your registration page";

            return View();
        }
    }
}