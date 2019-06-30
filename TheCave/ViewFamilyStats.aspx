<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewFamilyStats.aspx.cs" Inherits="TheCave.ViewFamilyStats" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="jumbotron">
    <table class="nav-justified" >
    <tr>
                <td class="text-center"> 
                    <h1> 
            <asp:Label ID="familynametxt" runat="server" Font-Bold="True" style="font-size: xx-large"></asp:Label>
                        <span style="font-size: xx-large">&nbsp;Family Statistics:</span></h1>
                </td>
            </tr>
                <asp:GridView ID="GridView10" runat="server" CellPadding="15" CellSpacing="10"></asp:GridView>
            <tr>
                <td>
                    <br />
                
                </td>
        </tr>
            </table>
        </div>
</asp:Content>
