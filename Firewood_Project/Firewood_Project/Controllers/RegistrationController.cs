using Firewood_Project.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Firewood_Project.Controllers
{
    public class RegistrationController : Controller
    {
        // GET: Registration
        public ActionResult Details()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Details(Registration registration)
        {
            if (ModelState.IsValid)
            {
                //var dbRegistration = FirewoodEntities.

                return Redirect("/");
            }
            return View(registration);
        }
    }
}