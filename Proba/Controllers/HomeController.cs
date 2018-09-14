using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Proba.Controllers
{
    [Authorize]
    public class HomeController : Controller
    {
        
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Search()
        {
            ViewBag.Message = "Zdravo";

            return View();
        }

        public ActionResult Sednice()
        {
            ViewBag.Message = "Sednice lista";

            return View();
        }

        //public ActionResult Clanovi()
        //{
            

        //    return View();
        //}

        public ActionResult Prilozi()
        {
            ViewBag.Message = "d";

            return View();
        }
        [Authorize(Roles ="Admin")]
        public ActionResult Admin()
        {
            return View();
        }
    }
}