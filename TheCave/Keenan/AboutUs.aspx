<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="TheCave.Keenan.AboutUs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="WebHomepage.css" rel="stylesheet" />
</head>
<body>
    <nav class="custom-nav" id="Info">
        <div id="logo">
            <a id="logoLink" href="../Keenan/WebHomepage.aspx">The Cave</a>
        </div>

        <ul id="nav-links">
            <li><a id="JoinFamily" type="text/asp" href="JoinExistingFamily.aspx" style="color:white;">Join a Cave</a></li>
            <li><a id="signlink" type="text/asp" href="../Keenan/SignUp.aspx">Create a Cave</a></li>
             <li><a href="../Keenan/Login.aspx" id="loginButton">Login</a></li>
        </ul>
    </nav>

    <div class="heading" style="text-align:center;">
            <h1>
                A little bit about us:
            </h1>
        <p id="AboutUsParagraph" style="font-size: 22px">This project was created by 4 third-year students from the Nelson Mandela University in South Africa, as our Final Year Computer Science Project.</p>
    </div>
</body>
</html>
