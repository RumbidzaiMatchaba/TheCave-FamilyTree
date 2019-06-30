<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="View Requests.aspx.cs" Inherits="TheCave.View_Requests" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <h1> View Requests Sent to you</h1>
    <br />
    <asp:Button ID="Button1" runat="server" Text="View Requests" OnClick="Button1_Click" />
    <p></p>
    <asp:Label ID="Label1" runat="server" Text="" ForeColor="Red"></asp:Label>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="192px" Width="350px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="RequestSender" HeaderText="Sender Name" />
            <asp:TemplateField>
               <ItemTemplate>
                   <asp:LinkButton ID="lnkSelect" Text="Accept Request" runat="server" OnClick="lnkSelect_Click" ForeColor="red"></asp:LinkButton>
               </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />
    </asp:GridView>
</asp:Content>
