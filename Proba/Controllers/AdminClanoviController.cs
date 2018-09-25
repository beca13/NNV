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
    [Authorize(Roles = "Admin")]
    public class AdminClanoviController : Controller
    {
        private NNVEntities db = new NNVEntities();

        // GET: AdminClanovi
        public ActionResult Index()
        {
            return View(db.Clanovi.ToList());
        }

        // GET: AdminClanovi/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Clanovi clanovi = db.Clanovi.Find(id);
            if (clanovi == null)
            {
                return HttpNotFound();
            }
            return View(clanovi);
        }

        // GET: AdminClanovi/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: AdminClanovi/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ClanID,Ime,Prezime,ImePrezime,Email,Status,KorisnickoIme,Lozinka")] Clanovi clanovi)
        {
            if (ModelState.IsValid)
            {
                db.Clanovi.Add(clanovi);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(clanovi);
        }

        // GET: AdminClanovi/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Clanovi clanovi = db.Clanovi.Find(id);
            if (clanovi == null)
            {
                return HttpNotFound();
            }
            return View(clanovi);
        }

        // POST: AdminClanovi/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ClanID,Ime,Prezime,ImePrezime,Email,Status,KorisnickoIme,Lozinka")] Clanovi clanovi)
        {
            if (ModelState.IsValid)
            {
                db.Entry(clanovi).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(clanovi);
        }

        // GET: AdminClanovi/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Clanovi clanovi = db.Clanovi.Find(id);
            if (clanovi == null)
            {
                return HttpNotFound();
            }
            return View(clanovi);
        }

        // POST: AdminClanovi/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Clanovi clanovi = db.Clanovi.Find(id);
            db.Clanovi.Remove(clanovi);
            db.SaveChanges();
            return RedirectToAction("Index");
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
