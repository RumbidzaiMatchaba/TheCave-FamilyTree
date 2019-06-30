<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewRelativePrivateProfile.aspx.cs" Inherits="TheCave.ViewRelativePrivateProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <h2 class="text-center"> View Private Details of your Relative</h2>
    <h3> To view this section you must have received the following details from your Relative:</h3>
    <p> <b> 1.Your Relative username
        <br />
        2.Your Relative Password</b>
    </p>
    <table>
        <tr>
            <td style="width: 364px; height: 100px;">
                <h3><strong>
                <asp:Label ID="Label1" runat="server" Text="Enter Your Relatives Username:" ToolTip="Enter Your Relatives Username" style="font-size: medium"></asp:Label>

                    </strong></h3>

            </td>
            <td style="height: 100px">
                <asp:TextBox ID="txtUserName" runat="server" Width="168px"></asp:TextBox>

            </td>
            <td style="width: 398px; height: 100px"></td>
              <td style="height: 100px; width: 502px"> <b><h3 style="width: 331px"><span style="font-size: medium"><strong>If you do not have the access details to your relative's profile, click 'Send Request' to request their details</strong></span></h3></b>
                  <%--<asp:Label ID="Label3" runat="server" Text="If you do not have the access details to your relative's profile, click 'Send Request' to request their details"></asp:Label>--%></td>
            
        </tr>
        <tr>
            <td style="width: 364px">
                <h3><strong><asp:Label ID="Label2" runat="server" Text="Enter Your Relatives Password" ToolTip="Enter Your Relatives Password" style="font-size: medium"></asp:Label>

                    <span style="font-size: medium">:</span></strong></h3>

            </td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server" EnableViewState="False" TextMode="Password" Width="165px"></asp:TextBox> </td>
            <td style="width: 398px">
                </td>

            <td style="width: 502px"> <asp:Button ID="Button2" runat="server" Text="Send Request" OnClick="Button2_Click" Font-Size="Small" Width="100px"  /></td>
        </tr>
    </table>
    <p>  
        <asp:Label ID="Label4" runat="server" Text="" ForeColor="Red" Font-Bold="True" Font-Italic="True" Font-Size="Large"></asp:Label>
    </p>

    <asp:Button ID="Button1" runat="server" Text="View Private Profile" OnClick="Button1_Click" style="margin-left: 254px" Width="172px" />
    <br /><p>



    </p>
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="186px" CellPadding="3" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2">
        <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
    </asp:DetailsView>
</asp:Content>
