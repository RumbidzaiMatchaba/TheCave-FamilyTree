<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="View_events.aspx.cs" Inherits="TheCave.View_events" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <h1 class="text-center" >These are the Upcoming Events!</h1>
    <asp:Label ID="Label1" runat="server" Text="" ForeColor="Red"></asp:Label>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="616px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="EVENT_NAME" HeaderText="Event Name"/>
                    <asp:BoundField DataField="EVENT_TIME" HeaderText="Date"/>
                    <asp:BoundField DataField="EVENT_PLACE" HeaderText="Event Place"/>
                    <asp:BoundField DataField="EVENT_DESCRIPTION" HeaderText="Description"/>
                   <%-- <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkView" runat="server" CommandArgument='<%# Eval("EVENT_ID") %>' OnClick="lnk_OnClick" ForeColor="#993300">View</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
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
    
    <br />
    
    <h4>To edit or add a new event, please click on the link:<a href="A1500_eventss2.aspx" style="color:red">Maintain Events</a></h4>
    

</asp:Content>
