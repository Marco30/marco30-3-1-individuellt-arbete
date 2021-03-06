﻿using System;
using System.Web.ModelBinding;
using System.Web.UI;
using APM.Model;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;

namespace APM.Pages.MedlemsPages
{
    public partial class MedlemsInfo : System.Web.UI.Page
    {
       protected void Page_Load(object sender, EventArgs e)
        {
            // Visar eventuella meddelanden lagrade i de temporära sessionsvariablerna.
            SuccessMessageLiteral.Text = Page.GetTempData("SuccessMessage") as string;
            SuccessMessagePanel.Visible = !String.IsNullOrWhiteSpace(SuccessMessageLiteral.Text);
        }

        // Hämtar den valda medlemmen ur databasen.
        public APM.Model.Member MemberFormView_GetItem([RouteData] int id)
        {
            try
            {
                Service service = new Service();
                return service.GetMember(id);
            }
            catch (Exception)
            {
                ModelState.AddModelError(String.Empty, "Fel inträffade då medlemmen hämtades.");
                return null;
            }
        }

        public IEnumerable<APM.Model.KontaktTyp> kontaktListView_GetData([RouteData] int id)
        {
            try
            {
                Service service1 = new Service();
                return service1.GetMemberKontaktTinfo(id);
            }
            catch (Exception)
            {
                ModelState.AddModelError(String.Empty, "Fel inträffade då medlemmarna skulle hämtas från databasen.");
                return null;
            }

        }

        public IEnumerable<APM.Model.Befattning> BefattningListView_GetData([RouteData] int id)
        {
            try
            {
                Service service1 = new Service();
                return service1.GetBefattninginfo(id);
            }
            catch (Exception)
            {
                ModelState.AddModelError(String.Empty, "Fel inträffade då Befattning skulle hämtas från databasen.");
                return null;
            }

        }



    }
}