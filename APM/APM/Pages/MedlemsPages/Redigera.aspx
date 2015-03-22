<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Delade/Site.Master" AutoEventWireup="true" CodeBehind="Redigera.aspx.cs" Inherits="APM.Pages.MedlemsPages.Redigera" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleHolder" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainHolder" runat="server">

    

    <div id="TitleLabelRedigera">
               
             <h1>
          Redigera medlem
    </h1>
            </div>
    <!--Meny länkar-->

    <div id="Selected">

    <div>
        <asp:HyperLink ID="HyperLink1" CssClass="alinks" runat="server" Text="Hem" NavigateUrl='<%$ RouteUrl:routename=Members %>' />
    </div>



    <!-- formview som visar medlem som ska redigeras-->

    <asp:FormView ID="MemberFormView" runat="server"
        ItemType="APM.Model.Member"
        DataKeyNames="MedID"
        DefaultMode="Edit"
        RenderOuterTable="false"
        SelectMethod="MemberFormView_GetItem"
        UpdateMethod="MemberFormView_UpdateItem">
        <EditItemTemplate>
            <div>
                <label for="FirstName">Förnamn</label>
            </div>
            <div>
                <asp:TextBox ID="FirstName" runat="server" Text='<%# BindItem.Fnamn %>' MaxLength="20" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ErrorMessage="förnamn får inte vara tomt!"
                    ControlToValidate="FirstName"
                    Display="None"></asp:RequiredFieldValidator>
            </div>
            <div>
                <label for="LastName">Efternamn</label>
            </div>
            <div>
                <asp:TextBox ID="LastName" runat="server" Text='<%# BindItem.Enamn %>' MaxLength="20" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ErrorMessage="Efternamn får inte vara tomt!"
                    ControlToValidate="LastName"
                    Display="None"></asp:RequiredFieldValidator>
            </div>                
            <div>
                <label for="CivicRegistrationNumber">Personnummer</label>
            </div>
            <div>
                <asp:TextBox ID="CivicRegistrationNumber" runat="server" Text='<%# BindItem.PersNR %>' MaxLength="11" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                    ErrorMessage="Personnummer får inte vara tomt!"
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
                    ErrorMessage="Address får inte vara tomt!"
                    ControlToValidate="Address"
                    Display="None"></asp:RequiredFieldValidator>
            </div>    


            <div>
                <label for="Region">Ort</label>
            </div>

            <div>
                <asp:TextBox ID="Region" runat="server" Text='<%# BindItem.Ort %>' MaxLength="25" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                    ErrorMessage="Ort får inte vara tomt!"
                    ControlToValidate="Region"
                    Display="None"></asp:RequiredFieldValidator>
            </div>

            <div>


         <div><!-- Dropdownlist Befattningstyp -->
                <label for="AddTypeDropDownList">Befattningstyp</label>
                </div>
   
                <asp:DropDownList ID="DropDownList1" runat="server" Enabled ="true"                 
                    SelectMethod="BefattningstypTypeDropDownList_GetData" AppendDataBoundItems ="true"
                    DataTextField="Befattningstyp"
                    DataValueField="BefattningID"
                    SelectedValue='<%# BindItem.BefattningID %>'>

                </asp:DropDownList>


                <div id="slut">
                <asp:LinkButton ID="LinkButton" runat="server" CommandName="Update" Text="Spara" />
                <asp:HyperLink ID="HyperLink" runat="server" Text="Avbryt" NavigateUrl='<%# GetRouteUrl("MemberDetails", new { id = Item.MedID }) %>' />

                      </div>
            </div>
        </EditItemTemplate>
    </asp:FormView>

          </div>

     <div id="ValT3">
        <!-- Visar fel medlande visas här -->
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Fel har inträffat"/>
          </div>

</asp:Content>
