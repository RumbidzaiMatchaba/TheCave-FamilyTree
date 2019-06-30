<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JoinExistingFamily.aspx.cs" Inherits="TheCave.Keenan.JoinExistingFamily" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>JoinFamily</title>
    <link href="WebHomepage.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            text-align: left;
            color:white; 
            align-content:center; 
            padding-left: 30% ; 
            padding-bottom: 10px; 
            align-content:center; 
            border:0;
        }
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <nav class="custom-nav" id="Info">
        <div id="logo">
            <a id="logoLink" href="../Keenan/WebHomepage.aspx">The Cave</a>
        </div>

        <ul id="nav-links">
            <li><a id="signlink" type="text/asp" href="../Keenan/SignUp.aspx">Create a Cave</a></li>
            <li><a id="loginButton" href="../Keenan/Login.aspx">Login</a></li>
            <li><a id="AboutUsLink" href="../Keenan/AboutUs.aspx">About Us</a></li>
        </ul>
    </nav>
        </div>

        <div class="heading" style="text-align:center;">
            <h1>
                Join Existing Cave
                </h1>

        </div>

        <%--<table class="auto-style2" style="color:white; align-content:center; padding-left: 30% ; padding-bottom: 10px; align-content:center;" border="0">
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label1" runat="server" Text="Enter TreeID:"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="TreeIDtxt" runat="server" Width="180px"></asp:TextBox>
                </td>
                <td class="auto-style6">
                    <asp:Button ID="Button1" runat="server" Text="Search" Height="30px" OnClick="Button1_Click" />
                    <asp:Label ID="Label2ErrorMessage" runat="server" ForeColor="Blue"></asp:Label>
                    <asp:RequiredFieldValidator ID="TreeIDFieldValidator1" runat="server" ControlToValidate="TreeIDtxt" ErrorMessage="Please enter your Family's TreeID emailed to you." ForeColor="Blue"></asp:RequiredFieldValidator>
                </td>
            </tr> 
        </table>

        <table class="auto-style2" style="color:white; align-content:center; padding-left: 30% ; padding-bottom: 10px; align-content:center;" border="0">
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="namelbl" runat="server">First Name:</asp:Label></td>
                <td class="auto-style4">
                    <asp:TextBox ID="FirstNametxt" runat="server" Width="180px" ></asp:TextBox>
                </td>
                <td class="auto-style6">
                    <asp:RequiredFieldValidator ID="FirstNameFieldValidator1" runat="server" ControlToValidate="FirstNametxt" ErrorMessage="Please enter your First Name" ForeColor="Blue"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3"><asp:Label id="surnamelbl" runat="server" >Surname:</asp:Label></td>
                <td class="auto-style4">
                    <asp:TextBox ID="Surnametxt" runat="server" Width="180px" ></asp:TextBox>
                </td>
                <td class="auto-style6">
                    <asp:RequiredFieldValidator ID="SurnameFieldValidator2" runat="server" ControlToValidate="Surnametxt" ErrorMessage="Please enter your Surname" ForeColor="Blue"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3"><asp:Label id="genderlbl" runat="server" >Gender:</asp:Label></td>
                <td class="auto-style4">
                    <asp:DropDownList ID="Gendertxt" runat="server" Width="180px" >
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                        <asp:ListItem>Gender Non-Conforming</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>
                        
                    </asp:DropDownList>
                </td>
                <td class="auto-style6">
                    <asp:RequiredFieldValidator ID="GenderFieldValidator1" runat="server" ControlToValidate="Gendertxt" ErrorMessage="Please select your Gender" ForeColor="Blue"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3"><asp:Label id="DOBlbl" runat="server" >Date of Birth:</asp:Label></td>
                <td class="auto-style4">
                    <asp:TextBox ID="DOBtxt" runat="server" TextMode="Date" Width="180px" ></asp:TextBox>
                </td>
                <td class="auto-style6">
                    <asp:RequiredFieldValidator ID="DOBFieldValidator2" runat="server" ControlToValidate="DOBtxt" ErrorMessage="Please enter Date Of Birth" ForeColor="Blue"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3"><asp:Label ID="nationlbl" runat="server" >Nationality</asp:Label></td>
                <td class="auto-style4">
                    <asp:DropDownList ID="Nationalitytxt" runat="server" Width="180px" >
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
                    <asp:RequiredFieldValidator ID="NationalityFieldValidator3" runat="server" ControlToValidate="Nationalitytxt" ErrorMessage="Please enter Nationality" ForeColor="Blue"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3"><asp:Label ID="emaillbl" runat="server" >Email Address:</asp:Label></td>
                <td class="auto-style4">
                    <asp:TextBox ID="Emailtxt" runat="server" Width="180px" ></asp:TextBox>
                </td>
                <td class="auto-style6">
                    <asp:RequiredFieldValidator ID="EmailFieldValidator4" runat="server" ControlToValidate="Emailtxt" ErrorMessage="Please enter your Email Address" ForeColor="Blue"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3"><asp:Label id="passwordlbl" runat="server" >Password</asp:Label></td>
                <td class="auto-style4">
                    <asp:TextBox ID="Passwordtxt" runat="server" TextMode="Password" Width="180px" ></asp:TextBox>
                </td>
                <td class="auto-style6">
                    <asp:RequiredFieldValidator ID="PasswordFieldValidator5" runat="server" ControlToValidate="Passwordtxt" ErrorMessage="Please enter Password" ForeColor="Blue"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style5">
                    <asp:Button ID="SignUpBtn" runat="server" Text="Sign Up" Width="73px"  OnClick="SignUpBtn_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="heading" colspan="3">
                    <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Blue"></asp:Label>
                </td>
            </tr>
        </table>--%>
        
        <div class="auto-style1">
        
        <asp:Table CssClass="auto-style2" ID="Table1" runat="server" Height="123px" Width="589px" >
            <asp:TableRow runat="server">
                <asp:TableCell runat="server" Width="100px">
                    <asp:Label ID="Label1" runat="server" Font-Size="14pt" >Enter TreeID:</asp:Label>
                </asp:TableCell>
                <asp:TableCell runat="server"><asp:TextBox ID="TreeIDtxt" runat="server" Width="180px"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell runat="server">
                    <asp:Button ID="Button1" runat="server" Text="Search" Height="30px" OnClick="Button1_Click" />
                    
                </asp:TableCell >
                <asp:TableCell runat="server" Width="250px"><asp:Label ID="Label2ErrorMessage" runat="server" ForeColor="Red"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Font-Size="20px" runat="server" ControlToValidate="TreeIDtxt" ErrorMessage="Please enter your Family's TreeID emailed to you." ForeColor="Red"></asp:RequiredFieldValidator></asp:TableCell>
            </asp:TableRow>
            </asp:Table>

        <asp:Table CssClass="auto-style2" ID="Table2" runat="server" Height="123px" Width="589px">
            <asp:TableRow runat="server">
                <asp:TableCell runat="server" HorizontalAlign="Right">
                    <asp:Label ID="namelbl" runat="server" Font-Size="14pt">First Name:</asp:Label>
                </asp:TableCell>
                <asp:TableCell runat="server"><asp:TextBox ID="FirstNametxt" runat="server" Width="180px" ></asp:TextBox></asp:TableCell>
                <asp:TableCell runat="server"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" Font-Size="20px" runat="server" ControlToValidate="FirstNametxt" ErrorMessage="Please enter your First Name" ForeColor="Red"></asp:RequiredFieldValidator></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server" HorizontalAlign="Right">
                    <asp:Label ID="surnamelbl" runat="server" Font-Size="14pt">Surname:</asp:Label>
                </asp:TableCell>
                <asp:TableCell runat="server"><asp:TextBox ID="Surnametxt" runat="server" Width="180px" ></asp:TextBox></asp:TableCell>
                <asp:TableCell runat="server"><asp:RequiredFieldValidator ID="RequiredFieldValidator3" Font-Size="20px" runat="server" ControlToValidate="Surnametxt" ErrorMessage="Please enter your Surname" ForeColor="Red"></asp:RequiredFieldValidator></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server" HorizontalAlign="Right">
                    <asp:Label ID="genderlbl" runat="server" Font-Size="14pt">Gender:</asp:Label>
                </asp:TableCell>
                <asp:TableCell runat="server"><asp:DropDownList ID="Gendertxt" runat="server" Width="180px" >
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                        <asp:ListItem>Gender Non-Conforming</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>
                        
                    </asp:DropDownList></asp:TableCell>
                <asp:TableCell runat="server"><asp:RequiredFieldValidator ID="RequiredFieldValidator5" Font-Size="20px" runat="server" ControlToValidate="Gendertxt" ErrorMessage="Please select your Gender" ForeColor="Red"></asp:RequiredFieldValidator></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server" HorizontalAlign="Right">
                    <asp:Label ID="DOBlbl" runat="server" Font-Size="14pt">Date of Birth:</asp:Label>
                </asp:TableCell>
                <asp:TableCell runat="server"><asp:TextBox ID="DOBtxt" runat="server" TextMode="Date" Width="180px" ></asp:TextBox></asp:TableCell>
                <asp:TableCell runat="server"><asp:RequiredFieldValidator ID="RequiredFieldValidator4" Font-Size="20px" runat="server" ControlToValidate="DOBtxt" ErrorMessage="Please enter Date Of Birth" ForeColor="Red"></asp:RequiredFieldValidator></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server" HorizontalAlign="Right">
                    <asp:Label ID="nationlbl" runat="server" Font-Size="14pt">Nationality:</asp:Label>
                </asp:TableCell>
                <asp:TableCell runat="server"><asp:DropDownList ID="Nationalitytxt" runat="server" Width="180px" >
                        <asp:ListItem Selected="True"></asp:ListItem>
                        <asp:ListItem >South African</asp:ListItem>
                        <asp:ListItem>Zimbabwean</asp:ListItem>
                        <asp:ListItem >American</asp:ListItem>
                        <asp:ListItem >British</asp:ListItem>
                        <asp:ListItem >Chinese</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>
                    </asp:DropDownList></asp:TableCell>
                <asp:TableCell runat="server"><asp:RequiredFieldValidator ID="RequiredFieldValidator6" Font-Size="20px" runat="server" ControlToValidate="Nationalitytxt" ErrorMessage="Please enter Nationality" ForeColor="Red"></asp:RequiredFieldValidator></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server" HorizontalAlign="Right">
                    <asp:Label ID="emaillbl" runat="server" Font-Size="14pt" Width="120px">Email Address:</asp:Label>
                </asp:TableCell>
                <asp:TableCell runat="server"><asp:TextBox ID="Emailtxt" runat="server" Width="180px" ></asp:TextBox></asp:TableCell>
                <asp:TableCell runat="server"><asp:RequiredFieldValidator ID="RequiredFieldValidator7" Font-Size="20px" runat="server" ControlToValidate="Emailtxt" ErrorMessage="Please enter your Email Address" ForeColor="Red"></asp:RequiredFieldValidator></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server" HorizontalAlign="Right">
                    <asp:Label ID="passwordlbl" runat="server" Font-Size="14pt">Password:</asp:Label>
                </asp:TableCell>
                <asp:TableCell runat="server"><asp:TextBox ID="Passwordtxt" runat="server" TextMode="Password" Width="180px" ></asp:TextBox></asp:TableCell>
                <asp:TableCell runat="server"><asp:RequiredFieldValidator ID="RequiredFieldValidator8" Font-Size="20px" runat="server" ControlToValidate="Passwordtxt" ErrorMessage="Please enter Password" ForeColor="Red"></asp:RequiredFieldValidator></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server" HorizontalAlign="Right"><asp:Button ID="SignUpBtn" runat="server" Text="Sign Up" Width="73px" OnClick="SignUpBtn_Click" /></asp:TableCell>
                <asp:TableCell runat="server"><asp:Label ID="lblErrorMessage" runat="server" Font-Size="20px" ForeColor="Red"></asp:Label></asp:TableCell>
            </asp:TableRow>
        </asp:Table>
       
        </div>
       
    </form>
</body>
</html>
