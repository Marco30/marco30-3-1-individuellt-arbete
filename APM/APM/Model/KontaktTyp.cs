using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace APM.Model
{
    public class KontaktTyp
    {
        public int MedID { get; set; }
        public int KontakttypID { get; set; }

        [StringLength(20, ErrorMessage = "Du kan inte ange mer än 20 tecken!")]
        public string Kontakttyp { get; set; }

        [Required(ErrorMessage = "En Kontaktuppgift måste anges.")]
        [StringLength(30, ErrorMessage = "Kontaktuppgift kan bestå av som mest 20 tecken")]
        public string Kontaktuppgift { get; set; }

        public int KontaktID { get; set; }

    }
}