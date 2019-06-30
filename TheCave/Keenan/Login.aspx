<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TheCave.Keenan.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LoginPage</title>
    <link href="WebHomepage.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            width: 163px;
            text-align: right;
        }
        .auto-style4 {
            width: 180px;
        }
        .auto-style5 {
            width: 180px;
            text-align: right;
        }
        .auto-style6 {
            text-align: left;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
    <nav class="custom-nav" id="Info">
        <div id="logo">
            <a id="logoLink" href="WebHomepage.aspx">The Cave</a>
        </div>
        
        <ul id="nav-links">
            <%--<li><a href="../Keenan/SignUp.aspx" id="loginBut" style="color:white;">Sign Up</a></li> --%>
            <li><a id="JoinFamily" type="text/asp" href="JoinExistingFamily.aspx" style="color:white;">Join a Cave</a></li>
            <li><a id="AboutUsLink" type="text/asp" href="AboutUs.aspx">About Us</a></li>
        </ul>
    </nav>
       </div>
        
        <div class="heading" style="text-align:center">
            <h1>Login</h1>
        <table class="auto-style2" style="color:white; margin-left: 35%; font-size: 20px;">
            <tr>
                <td class="auto-style3">Email Address:</td>
                <td class="auto-style4">
                    <asp:TextBox ID="Emailtxt" runat="server" Width="180px"></asp:TextBox>
                </td>
                <td class="auto-style6">
                    <asp:RequiredFieldValidator ID="EmailFieldValidator1" runat="server" ControlToValidate="Emailtxt" ErrorMessage="Please enter your Username." ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Password:</td>
                <td class="auto-style4">
                    <asp:TextBox ID="Passwordtxt" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
                </td>
                <td class="auto-style6">
                    <asp:RequiredFieldValidator ID="PasswordFieldValidator2" runat="server" ControlToValidate="Passwordtxt" ErrorMessage="Please enter your Password" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style5" style="font-size:20px">
                    <asp:Button ID="loginButton2" runat="server" Text="Login" Width="78px" Height="25px" OnClick="loginButton2_Click1"/>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="heading" colspan="2">
                    <asp:Label ID="lblMessage" runat="server" ForeColor="Red" ></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="heading" colspan="2">
                    <a href="SignUp.aspx" style="color:white">Click here</a> to create your own Cave.</td>
                <td>&nbsp;</td>
            </tr>
        </table>
            </div>
    </form>
</body>
</html>
