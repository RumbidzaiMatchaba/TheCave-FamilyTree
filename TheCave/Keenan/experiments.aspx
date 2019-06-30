<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="experiments.aspx.cs" Inherits="TheCave.experiments" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Web Homepage</title>
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
                    <asp:Label ID="TreeIDlbl" runat="server" Text="TreeID:"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="TreeIDtxt" runat="server" Width="180px"></asp:TextBox>
                </td>
                <td class="auto-style6">
                    <asp:Button ID="SearchTreeID" runat="server" OnClick="SearchTreeID_Click" Text="Search TreeID" />
                    <asp:RequiredFieldValidator ID="TreeIDFieldValidator1" runat="server" ControlToValidate="TreeIDtxt" ErrorMessage="Please enter your TreeID." ForeColor="Blue" EnableTheming="True"></asp:RequiredFieldValidator>
                    <asp:Label ID="ErrorLabel1" runat="server" ForeColor="Blue"></asp:Label>
                </td>
            </tr>
            
        </table>
    
    </form>
</body>
</html>
