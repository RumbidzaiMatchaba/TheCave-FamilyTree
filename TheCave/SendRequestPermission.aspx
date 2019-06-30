<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SendRequestPermission.aspx.cs" Inherits="TheCave.SendRequestPermission" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <h2 class="text-center">Send your request password to your Relative</h2>
    <p></p>
    <h4> By clicking <b>Send Details</b>, an email with your password will be sent allow your relative to view your private details.</h4>
    <p></p>
    <table>
        <tr>
            <td style="width: 166px; height: 42px;">
                <h3>
                <strong>
                <asp:Label ID="Label1" runat="server" Text="Enter email address : " style="font-size: medium"></asp:Label></strong></h3>
            </td>
            <td style="height: 42px" >
                <asp:TextBox ID="To" runat="server" Width="215px"></asp:TextBox> </td>
            <td style="height: 42px">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter Correct Email Address Format" ControlToValidate="To" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
        </tr>

        <tr>
            <td style="width: 166px">

            </td>

            <td colspan="2" style="height: 24px">
                <asp:Button ID="Cancel" runat="server" Text="Cancel" OnClick="Cancel_Click" Width="82px" />
                
            <asp:Button ID="Button1" runat="server" Text="Send " OnClick="Button1_Click" Width="85px" style="margin-left: 56px" /></td>
        </tr>

        
    </table>
    <p></p>
    <asp:Label ID="Label2" runat="server" ForeColor="Green" Font-Size="Large"></asp:Label>
    <p>





    </p>
    <table>
        
    </table>
</asp:Content>
