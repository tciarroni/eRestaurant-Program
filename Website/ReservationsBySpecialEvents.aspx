<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ReservationsBySpecialEvents.aspx.cs" Inherits="ReservationsBySpecialEvents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
      <div class="row col-md-12">
        <h1>Reservations By Special Event<span class="glyphicon glyphicon-glass"></span></h1>
    
  
            <asp:Label ID="Label1" runat="server" Text="Select Events" AssociatedControlID="ReservationsDropDown" />
            <asp:DropDownList ID="ReservationsDropDown" runat="server" DataSourceID="ReservationIDDataSource" 
                DataTextField="EventCode" DataValueField="EventCode"></asp:DropDownList>

         <asp:ObjectDataSource ID="ReservationIDDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
              SelectMethod="ListAllSpecialEvents" TypeName="eRestaurant.BLL.RestaurantAdminController"></asp:ObjectDataSource>
         <asp:LinkButton ID="ShowReservations" runat="server" Text="Show Reservations" />
   
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SpecialEventDataSource" AutoGenerateColumns="True">
        <Columns>
            <asp:BoundField DataField="ReservationID" HeaderText="ReservationID" SortExpression="ReservationID"></asp:BoundField>
            <asp:BoundField DataField="CustomerName" HeaderText="CustomerName" SortExpression="CustomerName" />
            <asp:BoundField DataField="ReservationDate" HeaderText="ReservationDate" SortExpression="ReservationDate" />
            <asp:BoundField DataField="NumberInParty" HeaderText="NumberInParty" SortExpression="NumberInParty" />
            <asp:BoundField DataField="ContactPhone" HeaderText="ContactPhone" SortExpression="ContactPhone" />
            <asp:BoundField DataField="ReservationStatus" HeaderText="ReservationStatus" SortExpression="ReservationStatus" />
            <asp:BoundField DataField="EventCode" HeaderText="EventCode" SortExpression="EventCode"></asp:BoundField>
        </Columns>
    </asp:GridView>
           
          <asp:ObjectDataSource ID="SpecialEventDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="ReservationsBySpecialEvent" TypeName="eRestaurant.BLL.RestaurantAdminController">
              <SelectParameters>
                  <asp:ControlParameter ControlID="ReservationsDropDown" Name="EventCode" PropertyName="SelectedValue" Type="String" />
              </SelectParameters>
          </asp:ObjectDataSource>
           
     </div>
</asp:Content>

