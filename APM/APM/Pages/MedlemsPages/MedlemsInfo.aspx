<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Delade/Site.Master" AutoEventWireup="true" CodeBehind="MedlemsInfo.aspx.cs" Inherits="APM.Pages.MedlemsPages.MedlemsInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainHolder" runat="server">


     <h1>
        Medlem
    </h1>
    <asp:Panel runat="server" ID="SuccessMessagePanel" Visible="false" CssClass="icon-ok">
        <asp:Literal runat="server" ID="SuccessMessageLiteral" />
    </asp:Panel>
    <div>
        <asp:HyperLink ID="HyperLink3" CssClass="alinks" runat="server" Text="Hem" NavigateUrl='<%$ RouteUrl:routename=Members %>' />
    </div>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    <asp:FormView ID="MemberFormView" runat="server"
        ItemType="APM.Model.Member"
        SelectMethod="MemberFormView_GetItem"
        RenderOuterTable="false">
        <ItemTemplate>
            <div class="header">
                <label for="Name">Namn</label>
            </div>
            <div class="content">
                <%#: Item.Fnamn + " " + Item.Enamn %>
            </div>
            <div class="header">
                <label for="CivicRegistrationNumber">Personnummer</label>
            </div>
            <div class="content">
                <%#: Item.PersNR %>
            </div>

            <div class="header">
                <label for="Region">Ort</label>
            </div>
            <div class="content">
                <%#: Item.Ort %>
            </div>

            <div class="header">
                <label for="Address">Adress</label>
            </div>
            <div class="content">
                <%#: Item.Address %>
            </div>

             <div class="header">
                <label for="Region">Befattningstyp</label>
            </div>
            <div class="content">
                <%#: Item.Befattningstyp %>
            </div>

            <div class="header">
                <label for="ZipCode">Arvode</label>
            </div>
            <div class="content">
                <%#: Item.Arvode %>
            </div>

            <div class="header">
                <label for="Region">Blevmedlem</label>
            </div>
            <div class="content">
                <%#: Item.Blevmedlem %>
            </div>

            <div class="header">
                <label for="ZipCode">Kontaktuppgift</label>
            </div>
            <div class="content">
                <%#: Item.Kontaktuppgift %>
            </div>

             <div class="header">
                <label for="ZipCode">Kontakttyp</label>
            </div>
            <div class="content">
                <%#: Item.Kontakttyp %>
            </div>


            <div>
                <asp:HyperLink ID="HyperLink1" runat="server" Text="Redigera" NavigateUrl='<%# GetRouteUrl("MemberEdit", new { id = Item.MedID }) %>' />
                <asp:HyperLink ID="HyperLink2" runat="server" Text="Ta bort" NavigateUrl='<%# GetRouteUrl("MemberDelete", new { id = Item.MedID }) %>' />
                <asp:HyperLink ID="HyperLink3" runat="server" Text="Hem" NavigateUrl='<%# GetRouteUrl("Members", null)%>' />
            </div>
        </ItemTemplate>
    </asp:FormView>
   

</asp:Content>
