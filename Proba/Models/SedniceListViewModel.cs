using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Proba.Models
{
    public class SedniceListViewModel
    {
        public int SednicaID { get; set; }
        public DateTime Datum { get; set; }
        //public string VrstaSednice { get; set; }
        public string Ucionica { get; set; }
        public string Zapisnik { get; set; }
        public string Poziv { get; set; }

    }
}