using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using APM.Model.DAL;
using System.ComponentModel.DataAnnotations;
using APM.App_Infrastructure;

namespace APM.Model// Marco Villegas
{

    public class Service
    {
        // Privata fält
        private MemberDAL _memberDAL;

        private KontaktDAL _kontaktDAL;

        private BefattningDAL _befattningDAL;
   
        private MemberDAL MemberDAL// Egenskaper som skapar DAL-klasser om det inte redan finns någora.
        {
            get { return _memberDAL ?? (_memberDAL = new MemberDAL()); }
        }


        private KontaktDAL KontaktDAL
        {
            //Om contactdal är null gör det till höger om ??
            get { return _kontaktDAL ?? (_kontaktDAL = new KontaktDAL()); }
        }

        private BefattningDAL BefattningDAL
        {
            //Om contactdal är null gör det till höger om ??
            get { return _befattningDAL ?? (_befattningDAL = new BefattningDAL()); }
        }
     

        public void DeleteMember(int memberId)// Tar bort spesifik medlem ur databasen.
        {
            MemberDAL.DeleteMember(memberId);
        }

        public void SaveMember(Member member) // Sparar en medlem i databasen.
        {
            // Uppfyller inte objektet affärsreglerna
            ICollection<ValidationResult> validationResults;
            if (!member.Validate(out validationResults))
            {
                // Klarar inte objektet valideringen så kastas ett undantag, samt en referens till valideringssamlingen.
                var ex = new ValidationException("klarade inte valideringen");
                ex.Data.Add("ValidationResults", validationResults);
                throw ex;
            }


            if (member.MedID == 0) // om MedID är 0 så skpas en ny medlem
            {
                MemberDAL.InsertMember(member);
            }
            else //Sparar medlem med andra ord uppdateras en befintlig medlems infromation
            {
                MemberDAL.UpdateMember(member);
            }
        }

  
        public Member GetMember(int memberId) // Hämtar en medlem med ett specifikt id från databasen
        {
            return MemberDAL.GetMemberById(memberId);
        }

 
        public IEnumerable<Member> GetMembers()    // Hämtar alla medlemmar ur databasen.
        {
            return MemberDAL.GetMembers();
        }

        //Hämtar alla kontakttyper returnernar ett List objekt innehållande referenser till ContactType objekt.
        public IEnumerable<KontaktTyp> GetKontaktTypes(bool refresh = false)
        {
            // Försöker hämta lista med kontakttyper från cachen.
            var kategoriTypes = HttpContext.Current.Cache["KategoriTypes"] as IEnumerable<KontaktTyp>;

            // Om det inte finns det en lista med kontakttyper
            if (kategoriTypes == null || refresh)
            {
                // ...hämtar då lista med kontakttyper
                kategoriTypes = KontaktDAL.GetKontakter();

                // ...och cachar dessa. List-objektet, inklusive alla ContactType-objekt, kommer att cachas 
                // under 5 minuter, varefter de automatiskt avallokeras från webbserverns primärminne.
                HttpContext.Current.Cache.Insert("KategoriTypes", kategoriTypes, null, DateTime.Now.AddMinutes(5), TimeSpan.Zero);
            }

            // Returnerar listan med kontakttyper.
            return kategoriTypes;
        }


        //Hämtar alla kontakttyper returnernar ett List objekt innehållande referenser till BefattningTypes objekt.
        public IEnumerable<Befattning> GetBefattningTypes(bool refresh = false)
        {
            // Försöker hämta lista med BefattningTyper från cachen.
            var BefattningTypes = HttpContext.Current.Cache["BefattningTypes"] as IEnumerable<Befattning>;

            // Om det inte finns det en lista med BefattningTyper 
            if (BefattningTypes == null || refresh)
            {
                // ...hämtar då lista med BefattningTyper 
                BefattningTypes = BefattningDAL.GetallaBefattning();

                // ...och cachar dessa. List-objektet, inklusive alla BefattningTyper -objekt, kommer att cachas 
                // under 5 minuter, varefter de automatiskt avallokeras från webbserverns primärminne.
                HttpContext.Current.Cache.Insert("BefattningTypes", BefattningTypes, null, DateTime.Now.AddMinutes(5), TimeSpan.Zero);
            }

            // Returnerar listan med kontakttyper.
            return BefattningTypes;
        }

        public IEnumerable<KontaktTyp> GetMemberKontaktTinfo(int memberId)
        {
            return KontaktDAL.GetMemberKontaktInfoById(memberId);
        }

        public void AddKontaktInfo(KontaktTyp K)
        {
            KontaktDAL.AddKontaktInfoById(K);
        }

        public void UpdateKontaktInfo(KontaktTyp K)
        {
            KontaktDAL.UpdateKontaktInfoById(K);
        }

        public void DeletKontaktInfo(KontaktTyp K)
        {
            KontaktDAL.DeletKontaktInfoById(K);
        }
   
    }

}