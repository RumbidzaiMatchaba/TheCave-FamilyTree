<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TheCave._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1 class="text-center">The
            <asp:Label ID="familynametxt" runat="server" Font-Bold="True"></asp:Label>
            Cave</h1>
        <h1 style="font-size: x-large">Welcome <asp:Label ID="CurFirstName" runat="server"></asp:Label>.</h1>
        <table class="nav-justified">
            <tr>
                <td class="text-left" style="font-size: x-large"><strong id="upcomingevents">Upcoming Events:</strong></td>
            </tr>
            <tr>
                <td class="text-left"><strong id="upcomingevents0">
                    <asp:Label ID="NoEvent" runat="server" ForeColor="Red"></asp:Label>
                    </strong></td>
                <asp:GridView ID="GridView7" runat="server" CellSpacing="20" CellPadding="5">
        </asp:GridView>
            </tr>
            </table>
        <table class="nav-justified">
        <tr>
                <td class="text-left" style="font-size: x-large"><strong>Brief Statistics:</strong></td>
            </tr>
            <tr class="text-center">
                <asp:GridView ID="GridView6" runat="server" CellPadding="0" CellSpacing="5">
        </asp:GridView>
            </tr>
            </table>
    </div>

   <div class="row">
        <div class="col-md-4">
            <%--<h2>Getting started</h2>
            <%--<p>
               I'M ACTUALLY JUST A MULL OAN!!!!!!!!!!!!!!!!
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>--%>
        </div>
        <div class="col-md-4">
            <%--<h2>Events</h2>
            <p>
                You can click on the link below to view upcoming Events
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Upcoming Events &raquo;</a>
            </p>--%>
        </div>
        <div class="col-md-4">
            <%--<h2>Invite Relatives</h2>
            <p>
                You can easily Invite your relatives to come join you on THE CAVE.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Invite Relatives &raquo;</a>
            </p>--%>
        </div>
    </div>

</asp:Content>
