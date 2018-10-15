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
    public class SedniceController : Controller
    {
        private NNVEntities db = new NNVEntities();

        // GET: Sednice
        public ActionResult Index(string searchTerm = null)
        {
            var model =
                db.Sednice.OrderByDescending(s => s.SednicaID)
                .Where(s => searchTerm == null || s.Zapisnik.Contains(searchTerm))
                .Select(s => new SedniceListViewModel
                {
                    SednicaID = s.SednicaID,
                    Datum = s.Datum,
                    Ucionica = s.Ucionica,
                    Zapisnik = s.Zapisnik,
                    Poziv = s.Poziv
                });

            //var model = from s in db.Sednice
            //            orderby s.SednicaID ascending
            //            select new SedniceListViewModel { SednicaID = s.SednicaID,
            //                Datum = s.Datum, 
            //                Ucionica = s.Ucionica,
            //                Zapisnik = s.Zapisnik,
            //                Poziv = s.Poziv };
            return View(model);
        }

        // GET: Sednice/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Sednice sednice = db.Sednice.Find(id);
            if (sednice == null)
            {
                return HttpNotFound();
            }
            return View(sednice);
        }

        // GET: Sednice/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Sednice/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "SednicaID,Datum,VrstaSednice,Ucionica,Zapisnik,Poziv")] Sednice sednice)
        {
            if (ModelState.IsValid)
            {
                db.Sednice.Add(sednice);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(sednice);
        }

        // GET: Sednice/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Sednice sednice = db.Sednice.Find(id);
            if (sednice == null)
            {
                return HttpNotFound();
            }
            return View(sednice);
        }

        // POST: Sednice/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "SednicaID,Datum,VrstaSednice,Ucionica,Zapisnik,Poziv")] Sednice sednice)
        {
            if (ModelState.IsValid)
            {
                db.Entry(sednice).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(sednice);
        }

        // GET: Sednice/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Sednice sednice = db.Sednice.Find(id);
            if (sednice == null)
            {
                return HttpNotFound();
            }
            return View(sednice);
        }

        // POST: Sednice/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Sednice sednice = db.Sednice.Find(id);
            db.Sednice.Remove(sednice);
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
