<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebHomepage.aspx.cs" Inherits="TheCave.WebHomepage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="WebHomepage.css" rel="stylesheet" />
    <title>Web Homepage</title>
    <style type="text/css">
        
        .auto-style6 {
            font-size: larger;
        }
        .auto-style7 {
            font-size: x-large;
        }
    </style>
</head>
<body>
    
    <nav class="custom-nav" id="Info">
        
        <ul id="nav-links">
            <li><a id="JoinFamily" type="text/asp" href="JoinExistingFamily.aspx" style="color:white;">Join a Cave</a></li>
            <li><a href="../Keenan/Login.aspx" id="loginBut" style="color:white;">Login</a></li> <%--used to be id="loginButton" and href="#" for pop up login page--%>
            <li><a id="AboutUsLink" type="text/asp" href="../Keenan/AboutUs.aspx">About Us</a></li>
        </ul>
    </nav>
    
    <div class="heading" style="text-align:center;margin-top:160px;">
       <h1> 
            <span class="auto-style6">Welcome to </span> <em><span class="auto-style6">The Cave</span></em>

        </h1>
        </div>

    <div id="learn">
        
        <p id="homeParagraph"><a id="Infolink" href="../Keenan/InformationPage.aspx">Click here</a> to learn more.</p>
    </div>
    
    <form runat="server">
    <div id="signUp">
        <strong>
        <asp:LinkButton ID="signlink" runat="server" href="../Keenan/SignUp.aspx" CssClass="auto-style7">Create Your Cave Here!</asp:LinkButton>
        </strong>
    </div>
       
        </form>
    
</body>
</html>
