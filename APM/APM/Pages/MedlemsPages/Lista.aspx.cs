using System;
using System.Collections.Generic;
using System.Web.UI;
using APM.Model;

namespace APM.Pages.MedlemsPages
{
    public partial class Lista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Visar eventuella meddelanden lagrade i de temporära sessionsvariablerna.
            SuccessMessageLiteral.Text = Page.GetTempData("SuccessMessage") as string;
            SuccessMessagePanel.Visible = !String.IsNullOrWhiteSpace(SuccessMessageLiteral.Text);
        }

        // Hämtar alla kunde i databasen.
        public IEnumerable<APM.Model.Member> MemberListView_GetData()
        {
            try
            {
                Service service = new Service();
                return service.GetMembers();
            }
            catch (Exception)
            {
                ModelState.AddModelError(String.Empty, "Fel inträffade då medlemmarna skulle hämtas från databasen.");
                return null;
            }
        }
    }
}