<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Delade/Site.Master" AutoEventWireup="true" CodeBehind="Kontaktinfo.aspx.cs" Inherits="APM.Pages.MedlemsPages.Kontaktinfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleHolder" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainHolder" runat="server">
    <div id="Selected">

          <!-- Visar text meddelande om man tagit bort medlem  -->

    <asp:Panel runat="server" ID="SuccessMessagePanel" Visible="false">
        <asp:Literal runat="server" ID="SuccessMessageLiteral" />
    </asp:Panel>

   <!-- läger till kontaktinfromation -->   
   
     <h1>Lägg till kontaktinfromation</h1> <hr /> <br /> 
             
<asp:FormView ID="InstrumentFormView" runat="server"
    ItemType="APM.Model.KontaktTyp"
    DataKeyNames="MedID"
    DefaultMode="Insert"
    InsertMethod="kontaktFormView_Insert"
    RenderOuterTable="false" 
    ViewStateMode="Enabled">

    <InsertItemTemplate>

                <div><!-- Dropdownlist Kontakttyp -->
                <label for="AddTypeDropDownList">Kontakttyp</label>
                </div>
                <asp:DropDownList ID="AddTypeDropDownList" runat="server"                    
                    SelectMethod="KategoriTypeDropDownList_GetData"
                    DataTextField="Kontakttyp"
                    DataValueField="KontakttypID"
                    SelectedValue='<%# BindItem.KontakttypID %>'/>



             <div>
                <label for="TextBox2">Kontaktuppgift</label>
            </div>

            <div>
                <asp:TextBox ID="TextBox2" runat="server" Text='<%# BindItem.Kontaktuppgift %>' MaxLength="25" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                    ErrorMessage="Kontaktuppgift fältet ät tomt!"
                    ControlToValidate="TextBox2"
                    Display="None" ValidationGroup="new"></asp:RequiredFieldValidator>
            </div>



    <div class="bottom">
      <asp:Button ID="SaveButton" runat="server" Text="Lägg till" CommandName="Insert" ValidationGroup="new" CssClass="button lessMargin"/>
        </div>
        <br />

       </InsertItemTemplate>
      </asp:FormView>

    <!-- alla här upp funkar bra nu, vi fixar det här ner nu-->

    <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Följande fel inträffade:"  ValidationGroup="new"
            CssClass="validation-summary-errors"/>
     <asp:ValidationSummary ID="ValidationSummary2" runat="server" HeaderText="Följande fel inträffade"
                        CssClass="validation-summary-errors" ValidationGroup="oldKontakter" ShowModelStateErrors="False" />
    <br />
     <!-- Redigerar till kontaktinfo -->
    <h1>läg till Kontakt info</h1> <hr /> <br />

       <!-- ListView som presenterar alla Kontakter som kan redigeras. -->
         <!--DataKeyNames="KontaktID,MedID" används för att ta med ID som du hämtat ut frå databasen, in i C#-->
            <asp:ListView ID="kontaktListView" runat="server"
                ItemType="APM.Model.KontaktTyp"
                DataKeyNames="KontaktID,MedID"
                SelectMethod="kontaktListView_GetData"
                UpdateMethod="kontaktListView_Update"
                DeleteMethod="kontaktListView_Delete">
                
               

                <LayoutTemplate>
                    <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                    
                </LayoutTemplate>
                <EmptyDataTemplate>
                    <p>
                        Har ingen kontaktinfo
                    </p>
                </EmptyDataTemplate>

               <ItemTemplate>


               <%-- Namn --%>
                <div class="section" >
                    <div class="left">
                        <span class="title"><%#: Item.Kontakttyp %> </span>

                            <asp:TextBox ID="Kontaktuppgift" runat="server" Text='<%# BindItem.Kontaktuppgift %>'  MaxLength="60" Width="350px" />  
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="oldKontakter"
                                ErrorMessage="Ett låtnamn måste anges." ControlToValidate="Kontaktuppgift" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    </div>
                   
                   <div class="sRight">

                     <!-- Redigera knapp -->
                     <asp:LinkButton ID="LinkButton1"  runat="server" CommandName="Update" Text="Uppdatera"  CssClass="button lessMargin" ValidationGroup="oldKontakter" />  
                                 
                    </div>
                    </div>
                        <br />

                    

                     </ItemTemplate>                 
            </asp:ListView>

        <!-- Tillbakaknapp -->
    <asp:HyperLink ID="HyperLink2" runat="server" Text="Tillbaka till listan" 
                                   NavigateUrl="<%$ RouteUrl:routename=Default %>" CssClass="buttonBack" />


</div>
</asp:Content>
