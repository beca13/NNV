using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;
using Proba.Models;

namespace Proba.Controllers
{
    public class PriloziController : Controller
    {        
            // GET: Home
            public ActionResult Index(int? id)
            {
                NNVEntities entities = new NNVEntities();

                //entities.Prilozi.ToList()
                PriloziLite priloziLite = new PriloziLite();
                priloziLite.SednicaID = id == null ? 0 : (int)id;

                return View(priloziLite);
            }

            [HttpPost]
            public ActionResult Index(HttpPostedFileBase postedFile, int? SednicaID) 
            {
                //Extract Image File Name.
                string fileName = System.IO.Path.GetFileName(postedFile.FileName);

                //Set the Image File Path.
                string filePath = "~/UploadDokumenata/" + Guid.NewGuid() + "_" + fileName;

                //Save the Image File in Folder.
                postedFile.SaveAs(Server.MapPath(filePath));

                //Insert the Image File details in Table.
                NNVEntities entities = new NNVEntities();
                entities.Prilozi.Add
                (new Prilozi
                {
                NazivPriloga = fileName,
                Putanja = filePath,
                
                }
                );
                entities.SaveChanges();

                //Redirect to Index Action.
                return RedirectToAction("Index");
            }
        

    }
}