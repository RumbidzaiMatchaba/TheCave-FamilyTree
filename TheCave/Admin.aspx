<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="TheCave.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <br />
    <br />
    <h3>Steps to Add Administrator</h3>
     <h4>Please follow the following to add/remove a Family Administrator<br />
     </h4>
    <ol>
        <li> Click edit</li>
        <li> Change UserType to &quot;A&quot;</li>
        <li> Click update</li>
    </ol>
    <h3>Steps to remove Administrator</h3>
    <ol>
        <li> Click edit</li>
        <li> Change UserType to &quot;M&quot;</li>
        <li> Click update</li>
    </ol>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MemberID" DataSourceID="SqlDataSource1" AutoGenerateEditButton="True" CellPadding="4" ForeColor="#333333" GridLines="None" Width="462px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="MemberID" HeaderText="MemberID" InsertVisible="False" ReadOnly="True" SortExpression="MemberID" />
            <asp:BoundField DataField="FName" HeaderText="FName" SortExpression="FName" />
            <asp:BoundField DataField="LName" HeaderText="LName" SortExpression="LName" />
            <asp:TemplateField HeaderText="UserType" SortExpression="UserType">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("UserType") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("UserType") %>'></asp:Label>
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:JN10ConnectionString %>" SelectCommand="SELECT Member.MemberID, Member.FName, Member.LName, Member.UserType FROM Member INNER JOIN MemberFamilyTree ON Member.MemberID = MemberFamilyTree.MemberID AND Member.MemberID = MemberFamilyTree.MemberID INNER JOIN [Family Tree] ON MemberFamilyTree.TreeID = [Family Tree].TreeID AND [Family Tree].TreeID = MemberFamilyTree.TreeID INNER JOIN TreeAdmin ON [Family Tree].TreeID = TreeAdmin.TreeID INNER JOIN Family_Administrator ON TreeAdmin.AdminID = Family_Administrator.AdminID WHERE ([Family Tree].TreeID = @TreeID)" OnSelecting="SqlDataSource1_Selecting" UpdateCommand="UPDATE Member SET UserType = @UserType WHERE (MemberID = @MemberID)">
        <SelectParameters>
            <asp:Parameter DefaultValue="41" Name="TreeID" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="UserType" />
            <asp:Parameter Name="MemberID" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
