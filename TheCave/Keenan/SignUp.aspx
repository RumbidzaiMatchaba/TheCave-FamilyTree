<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="TheCave.Keenan.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SignUpPage</title>
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
        .auto-style7 {
            font-size: 20px;
        }
        .auto-style8 {
            font-size: medium;
        }
    </style>
</head>
<body>
    <form id="form2" runat="server">
    <div>
    <nav class="custom-nav" id="Info">
        <div id="logo">
            <a id="logoLink" href="../Keenan/WebHomepage.aspx">The Cave</a>
        </div>

        <ul id="nav-links">
            <li><a id="JoinFamily" type="text/asp" href="JoinExistingFamily.aspx" style="color:white;">Join a Cave</a></li>
            <li><a id="loginButton" href="../Keenan/Login.aspx">Login</a></li>
            <li><a id="AboutUsLink" href="../Keenan/AboutUs.aspx">About Us</a></li>
        </ul>
    </nav>
        </div>

        <div class="heading" style="text-align:center;">
            <h1>
                Create Your Cave
                </h1>

        </div>
        <table class="auto-style2" style="color:white; align-content:center; padding-left: 30% ; padding-bottom: 10px; align-content:center;" border="0">
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label1" runat="server" Text="FAMILY SURNAME:" CssClass="auto-style8"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="FamilySurnametxt" runat="server" Width="180px"></asp:TextBox>
                </td>
                <td class="auto-style6">
                    <asp:RequiredFieldValidator ID="FamilySurnameFieldValidator1" runat="server" ControlToValidate="FamilySurnametxt" ErrorMessage="Please enter your Family's Surname." ForeColor="Red" CssClass="auto-style7"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">First Name:</td>
                <td class="auto-style4">
                    <asp:TextBox ID="FirstNametxt" runat="server" Width="180px"></asp:TextBox>
                </td>
                <td class="auto-style6">
                    <asp:RequiredFieldValidator ID="FirstNameFieldValidator1" runat="server" ControlToValidate="FirstNametxt" ErrorMessage="Please enter your First Name" ForeColor="Red" CssClass="auto-style7"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Surname:</td>
                <td class="auto-style4">
                    <asp:TextBox ID="Surnametxt" runat="server" Width="180px"></asp:TextBox>
                </td>
                <td class="auto-style6">
                    <asp:RequiredFieldValidator ID="SurnameFieldValidator2" runat="server" ControlToValidate="Surnametxt" ErrorMessage="Please enter your Surname" ForeColor="Red" CssClass="auto-style7"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3"><span class="auto-style8">Gender</span>:</td>
                <td class="auto-style4">
                    <asp:DropDownList ID="Gendertxt" runat="server" Width="180px">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                        <asp:ListItem>Gender Non-Conforming</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>
                        
                    </asp:DropDownList>
                </td>
                <td class="auto-style6">
                    <asp:RequiredFieldValidator ID="GenderFieldValidator1" runat="server" ControlToValidate="Gendertxt" ErrorMessage="Please select your Gender" ForeColor="Red" CssClass="auto-style7"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Date of Birth:</td>
                <td class="auto-style4">
                    <asp:TextBox ID="DOBtxt" runat="server" TextMode="Date" Width="180px"></asp:TextBox>
                </td>
                <td class="auto-style6">
                    <asp:RequiredFieldValidator ID="DOBFieldValidator2" runat="server" ControlToValidate="DOBtxt" ErrorMessage="Please enter Date Of Birth" ForeColor="Red" CssClass="auto-style7"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Nationality</td>
                <td class="auto-style4">
                    <asp:DropDownList ID="Nationalitytxt" runat="server" Width="180px">
                        <asp:ListItem Selected="True"></asp:ListItem>
                        <asp:ListItem >South African</asp:ListItem>
                        <asp:ListItem>Zimbabwean</asp:ListItem>
                        <asp:ListItem >American</asp:ListItem>
                        <asp:ListItem >British</asp:ListItem>
                        <asp:ListItem >Chinese</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style6">
                    <asp:RequiredFieldValidator ID="NationalityFieldValidator3" runat="server" ControlToValidate="Nationalitytxt" ErrorMessage="Please enter Nationality" ForeColor="Red" CssClass="auto-style7"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Email Address:</td>
                <td class="auto-style4">
                    <asp:TextBox ID="Emailtxt" runat="server" Width="180px"></asp:TextBox>
                </td>
                <td class="auto-style6">
                    <asp:RequiredFieldValidator ID="EmailFieldValidator4" runat="server" ControlToValidate="Emailtxt" ErrorMessage="Please enter your Email Address" ForeColor="Red" CssClass="auto-style7"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Password</td>
                <td class="auto-style4">
                    <asp:TextBox ID="Passwordtxt" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
                </td>
                <td class="auto-style6">
                    <asp:RequiredFieldValidator ID="PasswordFieldValidator5" runat="server" ControlToValidate="Passwordtxt" ErrorMessage="Please enter Password" ForeColor="Red" CssClass="auto-style7"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style5">
                    <asp:Button ID="SignUpBtn" runat="server" Text="Sign Up" Width="73px" OnClick="SignUpBtn_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="heading" colspan="3">
                    <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red" CssClass="auto-style7"></asp:Label>
                </td>
            </tr>
        </table>
    
    </form>
</body>
</html>
