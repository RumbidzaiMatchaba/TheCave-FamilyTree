<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Send Invites.aspx.cs" Inherits="TheCave.Send_Invites" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <h2 class="text-center">
 <asp:Label ID="Label1" runat="server" Text="Send Invites"></asp:Label>
  </h2>
     
    <table style="width: 100%;">
      <tr>
            <td style="width: 375px; height: 24px;">
                <h3><span style="font-size: medium"><strong>Name of Friend:</strong></span></h3>
            </td>
            <td style="height: 24px; width: 134px">
                <asp:TextBox ID="ReceiverName" runat="server" Width="214px"></asp:TextBox></td>
          <td style="width: 124px">
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name is Required" ControlToValidate="ReceiverName" ForeColor="Red"></asp:RequiredFieldValidator>
              </td>

            </tr>
       
       
        <tr>
            <td style="width: 375px">
                <h3 style="font-size: medium"><strong>Email Address:</strong></h3>
            </td>
              
            <td style="width: 134px"> <asp:TextBox ID="To" runat="server" Width="214px"></asp:TextBox></td>
         <td style="width: 124px">
             <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter Correct Email Formart" ControlToValidate="To" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>  
               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="To" ForeColor="Red"  ErrorMessage="Enter Email"></asp:RequiredFieldValidator>
          
         </td>
            </tr>
       <tr>
           <td style="width: 375px"></td>
       </tr>
         <tr>
           
            <td style="width: 375px">
               </td> 
            <td colspan="2">&nbsp; <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />    
                <asp:Button ID="btnSend" runat="server" Text="Send" OnClick="Send_Click" Width="84px" style="margin-left: 64px" />    
 <td style="width: 134px">
                &nbsp;</td>


        </tr>
        <tr>
            <td style="width: 375px">
                </td>
           
        </tr>
        <tr>
            <td style="width: 375px"><asp:Label ID="lblStatus" runat="server" ForeColor ="Green" Font-Size="Large"></asp:Label></td>
        </tr>
    </table>
</asp:Content>
