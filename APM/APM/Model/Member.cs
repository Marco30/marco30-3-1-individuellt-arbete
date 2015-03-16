using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace APM.Model
{

    public class Member // En publik klass som innehåller samma parametrar som  i databasen.
    {

        public int MedID { get; set; }

        [Required(ErrorMessage = "Ett förnamn måste anges.")]
        [StringLength(20, ErrorMessage = "Förnamnet kan bestå av som mest 20 tecken.")]
        public string Fnamn { get; set; }

        [Required(ErrorMessage = "Ett efternamn måste anges.")]
        [StringLength(20, ErrorMessage = "Efternamnet kan bestå av som mest 20 tecken.")]
        public string Enamn { get; set; }

        [Required(ErrorMessage = "Ett personnummer måste anges.")]
        [StringLength(12, ErrorMessage = "Förnamnet måste innehålla 11 tecken enligt formatet ÅÅMMDD-XXXX.")]
        [RegularExpression(@"^\d{6}-\d{4}$", ErrorMessage = "Personnummret måste vara i formatet ÅÅMMDD-XXXX.")]
        public string PersNR { get; set; }

        public int BefID { get; set; }

        [Required(ErrorMessage = "En address måste anges.")]
        [StringLength(30, ErrorMessage = "Addressen kan bestå av som mest 30 tecken.")]
        public string Address { get; set; }

        /*[Required(ErrorMessage = "Ett postnummer måste anges.")]
        [StringLength(6, ErrorMessage = "Postnummret kan bestå av som mest 6 tecken.")]
        [RegularExpression(@"^\d{5}$", ErrorMessage = "Postnummret måste vara i formatet XXXXX.")]*/
        public int Arvode { get; set; }

        [Required(ErrorMessage = "En ort måste anges.")]
        [StringLength(25, ErrorMessage = "Orten kan bestå av som mest 25 tecken.")]
        public string Ort { get; set; }

        public string Befattningstyp { get; set; }

        public int BefattningstypEdit { get; set; }

        /*[Required(ErrorMessage = "En Blevmedlem måste anges.")]
        [StringLength(30, ErrorMessage = "Addressen kan bestå av som mest 30 tecken.")]*/
        public string Blevmedlem { get; set; }

        public string Kontaktuppgift { get; set; }
        public string Kontakttyp { get; set; }

        public int Kontakttypin { get; set; }




    }

}