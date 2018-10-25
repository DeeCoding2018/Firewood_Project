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
        FirewoodEntities firewoodEntities;
        // GET: Registration
        public ActionResult Details()
        {
            return View();
        }

        public ActionResult Create()
        {
            var registration = new Registration();
            return View(registration);
        }
        
        // IDEA:
        // remake project entirely from scratch with MVC and use HTML from
        // FRONT-END team for formatting
        //[HttpPost]
        //public ActionResult Create(Registration registration)
        //{
        //    firewoodEntities.Customers.Add(registration);
        //}
    }
}