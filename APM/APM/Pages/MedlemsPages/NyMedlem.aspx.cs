﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using APM.Model;

namespace APM.Pages.MedlemsPages
{
    public partial class NyMedlem : System.Web.UI.Page
    {
        // Lägger till en medlem.
        public void MemberFormView_InsertItem(Member member)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    Service service = new Service();
                    service.SaveMember(member);

                    // Sparar ett rättmeddelande i en temporär sessionsvariabel och dirigerar användaren till medlemsinfo
                    Page.SetTempData("SuccessMessage", " nya medlemmen lass till!!");
                    Response.RedirectToRoute("MemberDetails", new { id = member.MedID });
                    Context.ApplicationInstance.CompleteRequest();
                }
                catch (Exception)
                {
                    ModelState.AddModelError(String.Empty, "Ett fel inträffade då medlemmen skulle läggas till.");
                }
            }

        }


        public IEnumerable<KontaktTyp> KategoriTypeDropDownList_GetData()
        {
            Service service1 = new Service();
            return service1.GetKontaktTypes();
        }



        public IEnumerable<Befattning> BefattningstypTypeDropDownList_GetData()
        {
            Service service2 = new Service();
            return service2.GetBefattningTypes();
        }

    }

}