<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Delade/Site.Master" AutoEventWireup="true" CodeBehind="Kontaktinfo.aspx.cs" Inherits="APM.Pages.MedlemsPages.Kontaktinfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleHolder" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainHolder" runat="server">
    
   
    <div id="KontakT1">
       <!-- läger till kontaktinfromation -->   
   
     Lägg till kontaktinformation
    </div>
    
     <div id="Kontak1">

          <!-- Visar text meddelande om man tagit bort medlem  -->

    <asp:Panel runat="server" ID="SuccessMessagePanel" Visible="false">
        <asp:Literal runat="server" ID="SuccessMessageLiteral" />
    </asp:Panel>
             
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

        </div>

    <div id="KontakT2">
      <!-- Redigerar till kontaktinfo -->
   kontaktinformation
</div>
    <!-- alla här upp funkar bra nu, vi fixar det här ner nu-->
    <div id="Kontak2">

    <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Följande fel inträffade:"  ValidationGroup="new"
            CssClass="validation-summary-errors"/>
     <asp:ValidationSummary ID="ValidationSummary2" runat="server" HeaderText="Följande fel inträffade"
                        CssClass="validation-summary-errors" ValidationGroup="oldKontakter" ShowModelStateErrors="False" />
    <br />
  
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
                                ErrorMessage="Kontaktuppgift får inte var tom" ControlToValidate="Kontaktuppgift" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    </div>
                   
                   <div ID="sight1">

                     <!-- Redigera knapp -->
                     <asp:LinkButton ID="LinkButton1"  runat="server" CommandName="Update" Text="Uppdatera"  CssClass="button lessMargin" ValidationGroup="oldKontakter" />  
                       </div>

                        <div ID="sight2">
                                  <asp:LinkButton ID="LinkButton2"  runat="server" CommandName="Delete" Text="Radera"  CssClass="button lessMargin" ValidationGroup="oldKontakter"
                                     OnClientClick='<%# String.Format("return confirm(\" VARNING: du kommer ta bort Kontaktuppgift {0}?\")", Item.Kontakttyp) %>'/>  
                    </div>

                    </div>
                        <br />

                    

                     </ItemTemplate>                 
            </asp:ListView>

        </div>

        <div id="Ktilbaka">
        <!-- Tillbakaknapp -->
    <asp:HyperLink ID="HyperLink2" runat="server" Text="Tillbaka till listan" 
                                   NavigateUrl="<%$ RouteUrl:routename=Default %>" CssClass="buttonBack" />
            </div>




</asp:Content>
