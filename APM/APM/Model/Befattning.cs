using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace APM.Model
{
    public class Befattning
    {
        public int BefattningID { get; set; }

        [StringLength(20, ErrorMessage = "Du kan inte ange mer än 20 tecken!")]
        public string Befattningstyp { get; set; }
    }
}