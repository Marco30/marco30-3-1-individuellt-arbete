<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Delade/Site.Master" AutoEventWireup="true" CodeBehind="Lista.aspx.cs" Inherits="APM.Pages.MedlemsPages.Lista" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleHolder" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainHolder" runat="server">

     <div id="TitleLabellist">
               
             <h1>
       Medlemsregister 
    </h1>
            </div>

         <!-- Visar text meddelande om man tagit bort medlem  -->
    <div id="text5">
    <asp:Panel runat="server" ID="SuccessMessagePanel" Visible="false">
        <asp:Literal runat="server" ID="SuccessMessageLiteral" />
        <asp:Button ID="Button1" CssClass="exit" runat="server" Text="Stäng" OnClientClick="exitbutton_OnClick" />
    </asp:Panel>
        </div>

    <div id="Selected">


        <!-- Visar fel medlande -->
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />

        <!--Meny länkar-->
    <div>
        <asp:HyperLink ID="HyperLink3" CssClass="alinks" runat="server" Text="Hem" NavigateUrl='<%$ RouteUrl:routename=Members %>' />
        <asp:HyperLink ID="HyperLink1" CssClass="alinks" runat="server" NavigateUrl='<%$ RouteUrl:routename=MemberCreate %>' Text="Lägg till ny medlem" />

    </div>

        <!-- listeview som visar alla medlemar i databasen-->
    <asp:ListView ID="MemberListView" runat="server"
        ItemType="APM.Model.Member"
        SelectMethod="MemberListView_GetData"
        DataKeyNames="MedID">

        <LayoutTemplate>
            <!-- Platshållare för medlemmar -->
            <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
        </LayoutTemplate>
        
      
        
        <ItemTemplate>
            <dl>
                <dt id="header">
              
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# GetRouteUrl("MemberDetails", new { id = Item.MedID })  %>' Text='<%# Item.Fnamn + " " + Item.Enamn %> ' /></dt>

                <dd id="content1">
                    <%#: Item.Blevmedlem %>
                </dd>
                <dd id="content2">
                    <%#: Item.Befattningstyp %> 
                </dd>
            </dl>
        </ItemTemplate>

        
        <EmptyDataTemplate>
            <!-- Detta visas då medlemmar saknas i databasen. -->
            <p>
                Medlemmar saknas.
            </p>
        </EmptyDataTemplate>

    </asp:ListView>

        </div>

</asp:Content>
