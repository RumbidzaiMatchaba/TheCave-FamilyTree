<%@ Page Title="Events" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="A1500_eventss2.aspx.cs" Inherits="TheCave.A1500_eventss2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
    
        <div>
<asp:HiddenField ID="HiddenField1" runat="server" />
            <h2 class="text-center"><strong>Maintain Anniversary Events</strong></h2>
            <h3 class="text-left">Complete the Form below to add a new event.</h3> 
                <h4>If you wish to <strong>modify </strong>an event click here<asp:Button ID="Button1" runat="server" Text="Maintain Event" OnClick="Button1_Click" Height="25px" Width="160px" />
            
            </h4>
            <p>&nbsp;<span style="font-size: medium" __designer:mapid="16a">(* - required field)</span></p>
            
            <table>
                <tr>
                    <td style="width: 239px; height: 24px">
                        <strong>
                        <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
                        </strong>
                    </td>
                    <td colspan="2" style="height: 24px; width: 27px;">
                        <asp:TextBox ID="txtName" runat="server" Width="257px"></asp:TextBox>
                    </td>
                    <td>*</td>

                </tr>
                <tr>
                    <td style="width: 239px; height: 24px;">
                        <strong>
                        <asp:Label ID="Label2" runat="server" Text="Date"></asp:Label>
                        </strong>
                    </td>
                    <td colspan="2" style="height: 24px; width: 27px;">
                        <asp:TextBox ID="txtDate" runat="server" TextMode="Date" Width="260px"></asp:TextBox>
                    </td>
                    <td style="height: 24px; width: 268435488px;">  
                     

                        *</tr>
                <tr>
                    <td style="width: 239px">
                        <strong>
                        <asp:Label ID="Label3" runat="server" Text="Place"></asp:Label>
                        </strong>
                    </td>
                    <td colspan="2" style="width: 27px">
                        <asp:TextBox ID="txtPlace" runat="server" TextMode="MultiLine" Width="260px"></asp:TextBox>
                    </td>
                    <td style="width: 268435488px">  
                     

                        *</tr>

                <tr>
                    <td style="width: 239px">
                        <strong>
                        <asp:Label ID="Label4" runat="server" Text="Event Description"></asp:Label>
                        </strong>
                    </td>
                    <td colspan="2" style="width: 27px">
                        <asp:TextBox ID="txtDes" runat="server" TextMode="MultiLine" Width="260px"></asp:TextBox>
                    </td>
                    <td style="width: 268435488px">  
                     

                    </tr>


                <tr>
                    <td style="width: 239px">
                        
                    </td>
                    <td colspan="2" style="height: 24px">
                        <asp:Button ID="btnClear" runat="server" Text="Cancel" OnClick="btnClear_Click" Font-Names="Arial" Width="60px" />
                        <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" Font-Names="Arial" Width="60px" />
                        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" Font-Names="Arial" Width="60px" />
                    </td>

                </tr>

                <tr>
                    <td style="width: 239px">
                        
                    </td>
                    <td colspan="2" style="width: 27px">
                        <asp:Label ID="lblsuccess" runat="server" Text="Label" ForeColor="Green"></asp:Label>
                    </td>

                </tr>

                <tr>
                    <td style="width: 239px">
                       
                    </td>
                    <td colspan="2" style="width: 27px">
                       <asp:Label ID="lblerror" runat="server" Text="Label" ForeColor="Red"></asp:Label>
                    </td>

                </tr>
                
            </table>
            <br />

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="497px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <%--<asp:BoundField DataField="EVENT_ID" HeaderText="Event ID"/>--%>
                    <asp:BoundField DataField="EVENT_NAME" HeaderText="Event Name"/>
                    <asp:BoundField DataField="EVENT_TIME" HeaderText="Date"/>
                    <asp:BoundField DataField="EVENT_PLACE" HeaderText="Event Place"/>
                    <asp:BoundField DataField="EVENT_DESCRIPTION" HeaderText="Event Description"/>
                    <asp:TemplateField>
                        <ItemTemplate>
                       
                            <asp:LinkButton ID="lnkView" runat="server" CommandArgument='<%# Eval("EVENT_ID") %>' OnClick="lnk_OnClick" ForeColor="#993300">View</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                <SortedDescendingHeaderStyle BackColor="#820000" />

            </asp:GridView>
          


        </div>

    <h4> Click on the link to send notifications to your Family! tions.aspx" style="color:red; width: 320px;">Send Anniversary Notifications</a></h4>
    </asp:Content>


