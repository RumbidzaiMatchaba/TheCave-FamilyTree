<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewRelativeProfile.aspx.cs" Inherits="TheCave.ViewRelativeProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <p></p>
    <h1 class="text-center">  <asp:Label ID="Label1" runat="server" Text="Label"><b>View Relative Profile</b></asp:Label> </h1>
  
    <div>
<asp:HiddenField ID="HiddenField1" runat="server" />
            <table>
                <tr>
                    <td style="width: 101px; height: 24px">
                        <asp:Label ID="Label2" runat="server" Text="Name" Font-Bold="True"></asp:Label>
                        <strong>:</strong></td>
                    <td colspan="2" style="height: 24px">
                        <%--  <asp:Button ID="btnSave" runat="server" Text="View Private Section" OnClick="btnSave_Click" Font-Names="Arial" Width="153px" />--%>
                        <asp:Label ID="LblName" runat="server" Text=""></asp:Label>
                    </td>
                    

                </tr>
                <tr>
                    <td style="width: 101px">
                        <asp:Label ID="Label3" runat="server" Text="Surname" Font-Bold="True"></asp:Label>
                        <strong>:</strong></td>
                    <td colspan="2">
                        <%--  <asp:TextBox ID="txtReligion" runat="server" Width="261px"></asp:TextBox>--%>
                         <asp:Label ID="lblSurname" runat="server"></asp:Label>
                    </td>
                    <tr>
                    <td style="width: 101px">
                        <asp:Label ID="Label4" runat="server" Text="Gender" Font-Bold="True"></asp:Label>
                        <strong>:</strong></td>
                    <td>
                        <%--<asp:TextBox ID="txtOccupation" runat="server" Width="263px"></asp:TextBox>--%>
                         <asp:Label ID="lblGender" runat="server"></asp:Label>
                    </td>
                    <tr>
                    <td style="width: 101px">
                        <asp:Label ID="Label5" runat="server" Text="Date of Birth" Font-Bold="True"></asp:Label>
                        <strong>:</strong></td>
                    <td>
                        <%-- <asp:Button ID="btnViewPrivateProfile" runat="server" Text="View Private Section" OnClick="btnViewPrivateProfile_Click" Font-Names="Arial" Width="153px" />--%>
                         <asp:Label ID="lblDOB" runat="server"></asp:Label>
                    </td>
                    <td>  
                     

                    </tr>
                 <tr>
                    <td style="width: 101px; height: 22px;">
                        <asp:Label ID="Label6" runat="server" Text="EmailAddress" Font-Bold="True"></asp:Label>
                        <strong>:</strong></td>
                    <td style="height: 22px">
                      <%--  <asp:TextBox ID="txtReligion" runat="server" Width="261px"></asp:TextBox>--%>
                         <asp:Label ID="lblEmailAddress" runat="server" BorderColor="Black" BorderStyle="None"></asp:Label>
                    </td>
                    <td style="height: 22px">  
                     

                    </tr>
                 <tr>
                    <td style="width: 101px">
                        <asp:Label ID="Label7" runat="server" Text="Occupation" Font-Bold="True"></asp:Label>
                        <strong>:</strong></td>
                    <td>
                        <%--<asp:TextBox ID="txtOccupation" runat="server" Width="263px"></asp:TextBox>--%>
                         <asp:Label ID="lblOccupation" runat="server"></asp:Label>
                    </td>
                    <td>  
                     
                        
                    </tr>
                

                <tr>
                    <td style="width: 101px">
                       
                    </td>
                    <td colspan="2">
                        &nbsp;</td>

                </tr>

                <tr>
                    <td style="width: 101px">
                        <asp:Button ID="Button1" runat="server" Text="View Private Section" OnClick="Button1_Click" />
                    </td>
                    <td colspan="2">
                        &nbsp;</td>

                </tr>
                
            </table>
            <br />

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="497px">
                <AlternatingRowStyle BackColor="White" />

                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                <SortedDescendingHeaderStyle BackColor="#820000" />
                                <Columns>
                    <asp:BoundField DataField="FName" HeaderText="First Name"/>
                    <asp:BoundField DataField="LName" HeaderText="Last Name"/>
                    <asp:BoundField DataField="Gender" HeaderText="Gender"/>
                    <%-- <asp:BoundField DataField="DOB" HeaderText="Date Of Birth"/>
                     <asp:BoundField DataField ="EmailAddress" HeaderText="Email Address" />
                     <asp:BoundField DataField="Occupation" HeaderText="Occupation"/>--%>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkView" runat="server" CommandArgument='<%# Eval("MemberID") %>' OnClick="lnk_OnClick" ForeColor="#993300">View</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

            </asp:GridView>
          

        </div>
</asp:Content>
