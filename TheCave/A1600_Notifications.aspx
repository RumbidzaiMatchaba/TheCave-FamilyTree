<%@ Page Title="Send Notifications" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="A1600_Notifications.aspx.cs" Inherits="TheCave.A1600_Notifications" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Send your Anniversary Events Notifications Here!</h2>
    <div>  
      
        <table style="width:100%;">  
            <tr>  
                <td class="style1" style="width: 270px">  
                     </td>  
                <td class="style2" style="font-weight: 700; text-decoration: underline; width: 250px;">  
                    &nbsp;</td>  
                <td>  
                     </td>  
            </tr>  
            <tr>  
                <td class="style1" style="width: 270px; height: 46px;">  
                     <h3>
                         R<span style="font-size: medium"><strong>eceiver&#39;s Name:</strong></span></h3>
                </td>  
                <td class="style3" style="width: 250px; height: 46px;">  
                     <asp:TextBox ID="TextBox3" runat="server" Width="214px"></asp:TextBox>
                     </td>  
                <td style="height: 46px">    
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3"   
                        ControlToValidate="TextBox2" runat="server"   
                        ErrorMessage="Please Enter Members Name" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                      
                     </td>  
            </tr>  
            <tr>  
                <td class="style1" style="width: 270px">  
                    <h3>
                    <span style="font-size: medium"><strong>Receiver&#39;s Email Address:</strong></span></h3>
                </td>  
                <td class="style3" style="width: 250px">  
                    <asp:TextBox ID="TextBox1" runat="server" Width="214px"></asp:TextBox>  
                </td>  
                <td>  
                     
              <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter Correct Email Format" ControlToValidate="TextBox1" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                  </td>  
            </tr>  
            <tr>  
                <td class="style1" style="width: 270px">  
                    <h3>
                        <span style="font-size: medium"><strong>Anniversary Notification Details:</strong></span></h3>
                </td>  
                <td class="style3" style="width: 250px">  
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" Width="214px"></asp:TextBox>  
                </td>  
                <td>  
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2"   
                        ControlToValidate="TextBox2" runat="server"   
                        ErrorMessage="Please Enter Details of Notification" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                     </td>  
            </tr>  
            <tr>  
                <td class="style1" style="width: 270px">  
                     </td>  
                <td class="style3" style="width: 250px">  
                     </td>  
                <td>  
                     </td>  
            </tr>  
            <tr>  
                <td class="style1" style="width: 270px">  
                    <asp:Label ID="lbmsg" runat="server"></asp:Label>  
                </td>  
                <td class="text-right" style="width: 250px">  
                             
                             <asp:Button ID="btnClear1" runat="server" Font-Names="Arial" OnClick="btnClear_Click" Text="Cancel" Width="77px" />
                             
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click"   
                        Text="Send" Width="77px" />  
                </td>  
                <td>  
                     </td>  
            </tr>  
                    <tr>
            <td style="width: 270px">
                <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label></td>
        </tr>

        </table>  
      
    </div>  



</asp:Content>
