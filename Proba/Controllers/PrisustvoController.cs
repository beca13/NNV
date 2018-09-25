using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Proba.Models;

namespace Proba.Controllers
{
    public class PrisustvoController : Controller
    {
        private NNVEntities db = new NNVEntities();

        // GET: Prisustvo
        public ActionResult Index(int? id)
        {
            
            var poslednjaSednica = db.Prisustvo.Include(s => s.Sednice).OrderByDescending(s => s.SednicaID).Where(s => (s.SednicaID==id) || (id == null));
            
            

            
            return View(poslednjaSednica);
        }

        // GET: Prisustvo/Details/5
        public ActionResult Details(int? SednicaID, int? ClanID)
        {
            if (SednicaID == null || ClanID == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Prisustvo prisustvo = db.Prisustvo.Find(ClanID,SednicaID);
            if (prisustvo == null)
            {
                return HttpNotFound();
            }
            return View(prisustvo);
        }


        //GET: Prisustvo/Create
        public ActionResult Create()
        {
            ViewBag.ClanID = new SelectList(db.Clanovi, "ClanID", "ImePrezime");
            ViewBag.SednicaID = new SelectList(db.Sednice, "SednicaID", "SednicaID");
            return View();
        }

        // POST: Prisustvo/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ClanID,SednicaID,Prisutan,Opravdano")] Prisustvo prisustvo)
        {
            if (ModelState.IsValid)
            {
                db.Prisustvo.Add(prisustvo);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ClanID = new SelectList(db.Clanovi, "ClanID", "Ime", prisustvo.ClanID);
            ViewBag.SednicaID = new SelectList(db.Sednice, "SednicaID", "VrstaSednice", prisustvo.SednicaID);
            return View(prisustvo);
        }



    

       

        // GET: Prisustvo/Edit/5
        public ActionResult Edit(int? SednicaID, int? ClanID)
        {
            if (SednicaID == null || ClanID == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Prisustvo prisustvo = db.Prisustvo.Find(ClanID,SednicaID);
            if (prisustvo == null)
            {
                return HttpNotFound();
            }
            ViewBag.ClanID = new SelectList(db.Clanovi, "ClanID", "Ime", prisustvo.ClanID);
            ViewBag.SednicaID = new SelectList(db.Sednice, "SednicaID", "VrstaSednice", prisustvo.SednicaID);
            return View(prisustvo);
        }

        // POST: Prisustvo/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ClanID,SednicaID,Prisutan,Opravdano")] Prisustvo prisustvo)
        {
            if (ModelState.IsValid)
            {
                db.Entry(prisustvo).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ClanID = new SelectList(db.Clanovi, "ClanID", "Ime", prisustvo.ClanID);
            ViewBag.SednicaID = new SelectList(db.Sednice, "SednicaID", "VrstaSednice", prisustvo.SednicaID);
            return View(prisustvo);
        }

        

        

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
