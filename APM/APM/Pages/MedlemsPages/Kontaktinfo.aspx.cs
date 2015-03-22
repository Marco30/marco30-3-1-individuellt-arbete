using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.ModelBinding;
using System.Data.SqlClient;
using System.Configuration;
using APM.Model;

namespace APM.Pages.MedlemsPages
{
    public partial class Kontaktinfo : System.Web.UI.Page
    {
        #region Service-objekt

        private Service _service;
        private Service Service
        {
            get { return _service ?? (_service = new Service()); }
        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            //Om genomförd handling lyckades av klienten och meddelande finns så visas det
            SuccessMessageLiteral.Text = Page.GetTempData("SuccessMessage") as string;
            SuccessMessagePanel.Visible = !String.IsNullOrWhiteSpace(SuccessMessageLiteral.Text);
        }

        // får drop down box info
        public IEnumerable<KontaktTyp> KategoriTypeDropDownList_GetData()
        {
            Service service1 = new Service();
            return service1.GetKontaktTypes();
        }

        // lägger till kontaktinfo
        #region CREATE

        public void kontaktFormView_Insert([RouteData] int id, KontaktTyp K)
        {
            try
            {
                K.MedID = id;
                Service service1 = new Service();
             service1.AddKontaktInfo(K);

             //Laddar om sidan
             Response.RedirectToRoute("Memberkontakt", false);
             Context.ApplicationInstance.CompleteRequest();

            }
            catch (Exception)
            {
                ModelState.AddModelError(String.Empty, "Fel inträffade då medlemmarna skulle hämtas från databasen.");
            }

        }
        #endregion

        // Ladar ner alla info 
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
       
  // updaterar kontakt
        public void kontaktListView_Update(KontaktTyp K)
        {
            if (ModelState.IsValid)
            {

                    try
                    {
                        
                        Service service2 = new Service();
                        service2.UpdateKontaktInfo(K);

                        //Laddar om sidan
                        Response.RedirectToRoute("Memberkontakt", false);
                        Context.ApplicationInstance.CompleteRequest();

                    }
                    catch (Exception)
                    {
                        ModelState.AddModelError(String.Empty, "Fel inträffade då kontak skulle uppdateras ");
                    }
        
            }
        }
    



    }
}