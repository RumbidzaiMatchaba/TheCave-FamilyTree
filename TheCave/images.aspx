<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="images.aspx.cs" Inherits="TheCave.images" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
    
    <h3 class="text-center"> Your Tree Gallery!</h3>
    <div>
<br /><br /> <br />
        <table style="width: 518px">
          <%--  <tr>
                <td><asp:Label ID="Label1" runat="server" Text="ID"></asp:Label></td>
                <td> <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
            </tr>--%>
       
        <tr>
            <td>
                <h3><strong><asp:Label ID="Label2" runat="server" Text="Caption" style="font-size: medium"></asp:Label></strong></h3>
            </td>
            <td style="width: 156px"><asp:TextBox ID="TextBox2" runat="server" Width="175px"></asp:TextBox></td>
            <td>
                <strong>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TextBox2" runat="server" ErrorMessage="Please enter Caption." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator></strong></td>
        </tr>
        
        
        <tr>
            <td>
                <h3><strong><asp:Label ID="Label3" runat="server" Text="Description" style="font-size: medium"></asp:Label></strong></h3>
            </td>
            <td style="width: 156px"><asp:TextBox ID="TextBox3" runat="server" Width="173px"></asp:TextBox></td>
                <td><strong>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="TextBox3" runat="server" ErrorMessage="Please enter Description." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator></strong></td>

        </tr>
<tr>
    <td>
        <h3><strong><asp:Label ID="Label4" runat="server" Text="Image" style="font-size: medium"></asp:Label></strong></h3>
    </td>
    <td style="width: 156px"><asp:FileUpload ID="FileUpload1" runat="server" Width="249px" /><br /></td>
</tr>
            <tr>
                <td> <asp:label ID="Literal1" runat="server" ForeColor ="Red" ></asp:label></td>
                <td style="width: 156px"> <asp:Button ID="SaveBtn" runat="server" Text="Save" OnClick="SaveBtn_Click" /></td>
            </tr>
        
        
       
       
       
        </table>
        
        
        <%--<asp:DataList ID="DataList1" runat="server" BorderWidth="2px" OnSelectedIndexChanged="DataList1_SelectedIndexChanged" RepeatColumns="6" CellPadding="3" CellSpacing="2">
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" Height="137px" ImageUrl='<%# Eval("path") %>' Width="117px" />
                <br />
            </ItemTemplate>
        </asp:DataList>--%>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="4" RepeatDirection="Horizontal">
            <ItemTemplate>
                <br />
                <table border="1" class="nav-justified">
                    <tr>
                        <td colspan="3" style="height: 23px">
                            <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("Caption") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:Image ID="Image1" runat="server" Height="150px" ImageUrl='<%# Eval("Image") %>' Width="160px" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 22px">
                            <asp:Label ID="Label6" runat="server" Text="Image Description: "></asp:Label>
                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:JN10ConnectionString %>" SelectCommand="SELECT ProfilePhoto.Caption, ProfilePhoto.Description, ProfilePhoto.Image FROM ProfilePhoto INNER JOIN Profile ON ProfilePhoto.ProfileID = Profile.ProfileID INNER JOIN Member ON Profile.ProfileID = Member.MemberID INNER JOIN MemberFamilyTree ON Member.MemberID = MemberFamilyTree.MemberID WHERE (MemberFamilyTree.TreeID = @TreeID)">
            <SelectParameters>
                <asp:Parameter Name="TreeID" DefaultValue="41" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource2" Width="483px" >
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Caption" HeaderText="Caption" SortExpression="Caption" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:TemplateField HeaderText="Image" SortExpression="Image">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Image") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Image ID="Image2" runat="server" Height="152px" ImageUrl='<%# Bind("Image") %>' Width="150px" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ProfileID" HeaderText="ProfileID" SortExpression="ProfileID" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:JN10ConnectionString %>" DeleteCommand="DELETE FROM [ProfilePhoto] WHERE [ID] = @ID" InsertCommand="INSERT INTO [ProfilePhoto] ([Caption], [Description], [Image], [ProfileID]) VALUES (@Caption, @Description, @Image, @ProfileID)" SelectCommand="SELECT * FROM [ProfilePhoto] WHERE ([ProfileID] = @ProfileID)" UpdateCommand="UPDATE [ProfilePhoto] SET [Caption] = @Caption, [Description] = @Description, [Image] = @Image, [ProfileID] = @ProfileID WHERE [ID] = @ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Caption" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Image" Type="String" />
                <asp:Parameter Name="ProfileID" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="ProfileID" SessionField="CurMemberID" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Caption" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Image" Type="String" />
                <asp:Parameter Name="ProfileID" Type="Int32" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>

</asp:Content>
