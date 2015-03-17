<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Delade/Site.Master" AutoEventWireup="true" CodeBehind="Radera.aspx.cs" Inherits="APM.Pages.MedlemsPages.Radera" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleHolder" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainHolder" runat="server">
    
 
      <div id="TitleLabel">
               
             <h1>
       Ta bort medlem
    </h1>
            </div>

    <div>
        <asp:HyperLink ID="HyperLink3" CssClass="alinks" runat="server" Text="Hem" NavigateUrl='<%$ RouteUrl:routename=Members %>' />
    </div>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    <asp:PlaceHolder runat="server" ID="ConfirmationPlaceHolder">
        <p>
            Är du säker på att du vill ta bort <strong>
                <asp:Literal runat="server" ID="MemberName" ViewStateMode="Enabled" /></strong>?
        </p>
    </asp:PlaceHolder>
    <div>
        <asp:LinkButton runat="server" ID="DeleteLinkButton" Text="Ja, ta bort medlemmen"
            OnCommand="DeleteLinkButton_Command" CommandArgument='<%$ RouteValue:id %>' />
        <asp:HyperLink runat="server" ID="CancelHyperLink" Text="Avbryt" />
    </div>
</asp:Content>
