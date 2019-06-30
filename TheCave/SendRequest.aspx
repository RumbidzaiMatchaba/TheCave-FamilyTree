<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SendRequest.aspx.cs" Inherits="TheCave.SendRequest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <h2 class="text-center">
 <asp:Label ID="Label1" runat="server" Text="Send Requests"></asp:Label>
  </h2>
   <h4> Please enter your relative&#39;s email address to send a request to your relative if you wish to view the private section of their profile.</h4>
    <p>



    </p>
    <table style="width: 109%;">
    
        <tr>
            <td style="height: 24px">
                <h3><strong><asp:Label ID="Label4" runat="server" Text="To:" style="font-size: medium"></asp:Label>
                
                    </strong></h3>
                
            </td>
              
            <td style="width: 194px; height: 24px;"> <asp:TextBox ID="To" runat="server" Width="213px" AutoCompleteType="Disabled" AutoPostBack="True"></asp:TextBox></td>
          <td style="height: 24px">
              <asp:RegularExpressionValidator ID="RegularExpressionValidator1" causevalidation="False" runat="server" ErrorMessage="Enter Correct Email Format" ControlToValidate="To" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" causevalidation="False" ControlToValidate="To" runat="server" ErrorMessage="Enter an email address" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        <td style="height: 24px">
        </td>
        </tr>
       
         <tr>
           
            <td style="height: 35px">
               
              </td>
 <td colspan="2" style="width: 194px; height: 35px;">
                <asp:Button ID="Cancel" runat="server" Text="Cancel" OnClick="Cancel_Click" />
     
     <asp:Button ID="Send" runat="server" Text="Send " OnClick="Send_Click" Width="53px" style="margin-left: 38px" /></td>
           
        </tr>

       <tr>
            <td>
                <asp:Label ID="Label2" runat="server" ForeColor="Green" Font-Size="Large"></asp:Label></td>
        </tr>
    </table>
</asp:Content>
