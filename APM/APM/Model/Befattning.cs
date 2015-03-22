using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace APM.Model// Marco Villegas
{
    public class Befattning
    {
        public int MedID { get; set; }
        public int BefattningID { get; set; }
        public string Befattningstyp { get; set; }

        public int Arvode { get; set; }

    }
}