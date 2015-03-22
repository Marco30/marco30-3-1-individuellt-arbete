<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Delade/Site.Master" AutoEventWireup="true" CodeBehind="Kontaktinfo.aspx.cs" Inherits="APM.Pages.MedlemsPages.Kontaktinfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleHolder" runat="server">

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainHolder" runat="server">
    
  

          <!-- Visar text meddelande om man lagg till medlem  -->
    <div id="text4">
    <asp:Panel runat="server" ID="SuccessMessagePanel" Visible="false">
        <asp:Literal runat="server" ID="SuccessMessageLiteral" />
        <asp:Button ID="Button1" CssClass="exit" runat="server" Text="Stäng" OnClientClick="exitbutton_OnClick" />
    </asp:Panel>
          </div>
   
      <div id="ValT2">

           <asp:ValidationSummary ID="ValidationSummary3" runat="server" HeaderText="Följande fel inträffade:"  ValidationGroup="new"
            CssClass="validation-summary-errors"/>
     <asp:ValidationSummary ID="ValidationSummary4" runat="server" HeaderText="Följande fel inträffade"
                        CssClass="validation-summary-errors" ValidationGroup="oldKontakter" ShowModelStateErrors="False" />
    <br />
</div>

       <!--Meny länkar-->
    <div id="Menykontakt">
        <asp:HyperLink ID="HyperLink3" CssClass="alinks" runat="server" Text="Hem" NavigateUrl='<%$ RouteUrl:routename=Members %>' />
    </div>

 
    <div id="KontakT1">
       <!-- läger till kontaktinfromation -->   
   
     Lägg till kontaktinformation
    </div>
    
     <div id="Kontak1">

 
             
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
                   
                   <div id="sight1">

                     <!-- Redigera knapp -->
                     <asp:LinkButton ID="LinkButton1"  runat="server" CommandName="Update" Text="Uppdatera"  CssClass="button lessMargin" ValidationGroup="oldKontakter" />  
                       </div>

                        <div id="sight2">
                                  <asp:LinkButton ID="LinkButton2"  runat="server" CommandName="Delete" Text="Radera"  CssClass="button lessMargin" 
                                     OnClientClick='<%# String.Format("return confirm(\" VARNING: du kommer ta bort Kontaktuppgift {0}!\")", Item.Kontakttyp) %>'/>  
                    </div>

                    </div>
                        <br />

                    

                     </ItemTemplate>                 
            </asp:ListView>

        </div>

        <div id="Ktilbaka">
        <!-- Tillbakaknapp -->
          
       <asp:FormView ID="MemberFormView" runat="server"
        ItemType="APM.Model.Member"
        SelectMethod="MemberFormView_GetItem"
        RenderOuterTable="false">

        <ItemTemplate>
              <asp:HyperLink ID="HyperLink" runat="server" Text="Tillbaka till Medlem" NavigateUrl='<%# GetRouteUrl("MemberDetails", new { id = Item.MedID }) %>' />
        </ItemTemplate>

        </asp:FormView>

      </div>


</asp:Content>

