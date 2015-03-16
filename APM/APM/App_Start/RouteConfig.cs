using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;

namespace APM.App_Start
{
    public class RouteConfig
    {
        // Bestämmer alla router för de olika sidorna.
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.MapPageRoute("Members", "medlemmar", "~/Pages/MedlemsPages/Lista.aspx");
            routes.MapPageRoute("MemberCreate", "medlemmar/ny", "~/Pages/MedlemsPages/NyMedlem.aspx");
            routes.MapPageRoute("MemberDetails", "medlemmar/{id}", "~/Pages/MedlemsPages/MedlemsInfo.aspx");

            
            //routes.MapPageRoute("MemberEdit", "medlemmar/{id}/redigera", "~/Pages/MemberPages/Edit.aspx");
            //routes.MapPageRoute("MemberDelete", "medlemmar/{id}/tabort", "~/Pages/MemberPages/Delete.aspx");

 

            routes.MapPageRoute("Error", "serverfel", "~/Pages/Delade/Error.html");

            routes.MapPageRoute("Default", "", "~/Pages/MedlemsPages/Lista.aspx");
        }
    }
}