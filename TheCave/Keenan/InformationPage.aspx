<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InformationPage.aspx.cs" Inherits="TheCave.Keenan.InformationPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>InformationPage</title>
    <link href="WebHomepage.css" rel="stylesheet" />
</head>
<body>
    <div>
    <nav class="custom-nav" id="Info">
        <div id="logo">
            <a id="logoLink" href="../Keenan/WebHomepage.aspx">The Cave</a>
        </div>

        <ul id="nav-links">
            <li><a id="signlink" type="text/asp" href="../Keenan/SignUp.aspx">Create a Cave</a></li>
            <li><a id="JoinFamily" type="text/asp" href="JoinExistingFamily.aspx" style="color:white;">Join a Cave</a></li>
            <li><a href="../Keenan/Login.aspx" id="loginButton">Login</a></li>
            <li><a id="AboutUsLink" href="../Keenan/AboutUs.aspx">About Us</a></li>
        </ul>
    </nav>
        </div>

    <div class="heading" style="text-align:center; margin-top:50px">
            <h1>
                What is <em>The Cave</em>?
            </h1>
    </div>
    <p id="InfoParagraph" style="margin-top:-20px;">
                    Everyone should always have access to their family history as this makes part of the foundation on which you start your journey of self-discovery in this day and age.<br />
                    That is why we at <b>The Cave</b> decided to create this platform for you to create <b>your very own family tree!</b><br /><br />
                    
                </p>
    <br />
    <div class="heading" style="text-align:center; margin-top:-100px; color: white">
        <h1>
                What features does <em>your Cave</em> have?
            </h1>
        <p style ="font-size:22px; text-align:left">The Cave is a web-based application which mainly allows you to, amongst other things:</p>
        <ul style="font-size:22px; text-align:left">
            <li>Keep record of your ever growing family through allowing you to add members to your existing <em>Cave</em>.</li>
            <li>Each member has access to their <b>own profile</b> which they can populate with their own personal information, <em>including thier pictures</em>.</li>
            <li>Our statistical algorithms gives you <b>access to a broad overview of your family statistics, such as: Number of male and female members, how many members are in your family tree thus far, and many more!</li>
        </ul>
    </div>
    
</body>
</html>
