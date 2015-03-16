using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using APM.Model.DAL;
using System.ComponentModel.DataAnnotations;
using APM.App_Infrastructure;

namespace APM.Model
{

    public class Service
    {
        // Privata fält
        private MemberDAL _memberDAL;


   
        private MemberDAL MemberDAL// Egenskaper som skapar DAL-klasser om det inte redan finns någora.
        {
            get { return _memberDAL ?? (_memberDAL = new MemberDAL()); }
        }


        #region Member


      

        public void SaveMember(Member member) // Sparar en medlem i databasen.
        {
            // Uppfyller inte objektet affärsreglerna
            ICollection<ValidationResult> validationResults;
            if (!member.Validate(out validationResults))
            {
                // Klarar inte objektet valideringen så kastas ett undantag, samt en referens till valideringssamlingen.
                var ex = new ValidationException("klarade inte valideringen.");
                ex.Data.Add("ValidationResults", validationResults);
                throw ex;
            }


            if (member.MedID == 0) // om MedID är 0 så skpas en ny medlem
            {
                MemberDAL.InsertMember(member);
            }
            else //Sparar medlem med andra ord uppdateras en befintlig medlems infromation
            {
                //MemberDAL.UpdateMember(member);
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

        #endregion

    }

}