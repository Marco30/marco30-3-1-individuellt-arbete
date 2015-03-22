﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Delade/Site.Master" AutoEventWireup="true" CodeBehind="NyMedlem.aspx.cs" Inherits="APM.Pages.MedlemsPages.NyMedlem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainHolder" runat="server">



     <div id="TitleLabel">
               
             <h1>
       Medlemsregister 
    </h1>
            </div>

    <div id="Selected">

        <!--Meny länkar-->
    <div>
        <asp:HyperLink ID="HyperLink3" CssClass="alinks" runat="server" Text="Hem" NavigateUrl='<%$ RouteUrl:routename=Members %>' />
    </div>

        <!-- Visar fel medlande visas här -->
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Ett fel har inträffat. Korrigera felet och försök igen." />

        
    <!-- formview som visar formulär-->
    <asp:FormView ID="MemberFormView" runat="server"
        ItemType="APM.Model.Member"
        DefaultMode="Insert"
        RenderOuterTable="false"
        InsertMethod="MemberFormView_InsertItem">
        <InsertItemTemplate>
            <div>
                <label for="FirstName">Förnamn</label>
            </div>
            <div>
                <asp:TextBox ID="FirstName" runat="server" Text='<%# BindItem.Fnamn %>' MaxLength="20" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ErrorMessage="Förnamns fältet är tom!"
                    ControlToValidate="FirstName"
                    Display="None"></asp:RequiredFieldValidator>
            </div>
            <div>
                <label for="LastName">Efternamn</label>
            </div>
            <div>
                <asp:TextBox ID="LastName" runat="server" Text='<%# BindItem.Enamn %>' MaxLength="20" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ErrorMessage="Efternamn fältet är tom  !"
                    ControlToValidate="LastName"
                    Display="None"></asp:RequiredFieldValidator>
            </div>                
            <div>
                <label for="CivicRegistrationNumber">Personnummer</label>
            </div>
            <div>
                <asp:TextBox ID="CivicRegistrationNumber" runat="server" Text='<%# BindItem.PersNR %>' MaxLength="11" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                    ErrorMessage="Personnummr fältet är tomt!"
                    ControlToValidate="CivicRegistrationNumber"
                    Display="None"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                    ErrorMessage="Personnummret är inte giltig! Ange formatet ÅÅMMDD-XXXX"
                    ControlToValidate="CivicRegistrationNumber"
                    Display="None"
                    ValidationExpression="^\d{6}-\d{4}$"></asp:RegularExpressionValidator>
            </div>                
            <div>
                <label for="Address">Address</label>
            </div>
            <div>
                <asp:TextBox ID="Address" runat="server" Text='<%# BindItem.Address %>' MaxLength="30" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                    ErrorMessage="Address fältet ät tomt!"
                    ControlToValidate="Address"
                    Display="None"></asp:RequiredFieldValidator>
            </div>               
           
            <div>
                <label for="Region">Ort</label>
            </div>
            <div>
                <asp:TextBox ID="Region" runat="server" Text='<%# BindItem.Ort %>' MaxLength="25" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                    ErrorMessage="Ort fältet ät tomt!"
                    ControlToValidate="Region"
                    Display="None"></asp:RequiredFieldValidator>
            </div>


            <div><!-- Dropdownlist Kontakttyp -->
                <label for="AddTypeDropDownList">Kontakttyp</label>
                </div>
                <asp:DropDownList ID="AddTypeDropDownList" runat="server"                    
                    SelectMethod="KategoriTypeDropDownList_GetData"
                    DataTextField="Kontakttyp"
                    DataValueField="KontakttypID"
                    SelectedValue='<%# BindItem.Kontakttyp %>'/>



             <div>
                <label for="TextBox2">Kontaktuppgift</label>
            </div>

            <div>
                <asp:TextBox ID="TextBox2" runat="server" Text='<%# BindItem.Kontaktuppgift %>' MaxLength="25" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                    ErrorMessage="Kontaktuppgift fältet ät tomt!"
                    ControlToValidate="TextBox2"
                    Display="None"></asp:RequiredFieldValidator>
            </div>


 
               <div><!-- Dropdownlist Befattningstyp -->
                <label for="AddTypeDropDownList">Befattningstyp</label>
                </div>
                <asp:DropDownList ID="DropDownList2" runat="server"                    
                    SelectMethod="BefattningstypTypeDropDownList_GetData"
                    DataTextField="Befattningstyp"
                    DataValueField="BefattningID"
                    SelectedValue='<%# BindItem.Befattningstyp %>'/>


    
           
            <div>
                <!-- "Kommandknappar" för att skapa ny kontaktuppgift och rensa texfälten om man vill avrbryte -->
                <asp:LinkButton ID="LinkButton3" runat="server" CommandName="Insert" Text="Lägg till" />
                <asp:LinkButton ID="LinkButton4" runat="server" CommandName="Cancel" Text="Rensa" CausesValidation="false" />
                <asp:HyperLink ID="HyperLink1" runat="server" Text="Avbryt" NavigateUrl='<%# GetRouteUrl("Members", null) %>' />
            </div>
        </InsertItemTemplate>
    </asp:FormView>

        </div>

</asp:Content>
