<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewFamilyTree.aspx.cs" Inherits="TheCave.ViewFamilyTree" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
    <table class="nav-justified">
            <tr>
                <td class="text-center" style="font-size: large"> 
                    <h1 style="font-size: x-large">The
            <asp:Label ID="familynametxt" runat="server" Font-Bold="True"></asp:Label>
            &nbsp;Family Members:</h1>
                </td>
            </tr>
                <asp:GridView ID="GridView5" runat="server" CellPadding="1" CellSpacing="1"></asp:GridView>
            </table>
        </div>
</asp:Content>
