<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InviteRelatives.aspx.cs" Inherits="TheCave.InviteRelatives" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
      <h2 class="text-center">Invite Your Relatives to The CAVE!</h2>
    <table style="width:100%;">  
            <tr>  
                <td colspan="2">  
                     <h3 style="font-size: medium">  
                    <strong>Enter the recepients details below:</strong></h3>
                     </td>  
                <td>  
                     </td>  
            </tr>  
            <tr>  
                <td class="style1" style="width: 178px">  
                     <h3 style="font-size: medium"><strong>Relative&#39;s Name:</strong></h3>
                </td>  
                <td class="style3" style="width: 233px">  
                     <asp:TextBox ID="TextBox3" runat="server" Width="200px"></asp:TextBox>
                     </td>  
                <td>  
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                         ControlToValidate ="Textbox3"
                         runat="server" ErrorMessage="Please enter recepient's full name" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                     </td>  
            </tr>  
            <tr>  
                <td class="style1" style="width: 178px">  
                    <h3 style="font-size: medium"><strong>Email:</strong></h3>
                </td>  
                <td class="style3" style="width: 233px">  
                    <asp:TextBox ID="TextBox1" runat="server" Width="200px"></asp:TextBox>  
                </td>  
                <td>  
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1"   
                        ControlToValidate="TextBox1" runat="server"   
                        ErrorMessage="Please Provide Email ID" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>  
                  </td>  
            </tr>  
            <tr>  
                <td class="style1" style="height: 26px; width: 178px;">  
                    &nbsp;</td>  
                <td class="style3" style="height: 26px; width: 233px;">  
                    &nbsp;</td>  
                <td style="height: 26px">  
                     </td>  
            </tr>  
            <tr>  
                <td class="style1" style="width: 178px">  
                    <asp:Label ID="lbmsg" runat="server" ForeColor="Green"></asp:Label>  
                </td>  
                <td class="text-right" style="width: 233px">  
                             
                             <asp:Button ID="btnClear1" runat="server" Font-Names="Arial" OnClick="btnClear_Click" Text="Cancel" Width="77px" style="margin-left: 5px" />
                             
                     <asp:Button ID="Button1" runat="server" Text="Send" OnClick="Button1_Click1" Width="60px" style="margin-left: 66px" />
                </td>  
                <td> 
                     </td>  
            </tr>  
        </table>  
      
    </div>  

</asp:Content>
