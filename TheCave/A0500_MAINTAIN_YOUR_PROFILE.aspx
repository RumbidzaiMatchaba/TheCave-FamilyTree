<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="A0500_MAINTAIN_YOUR_PROFILE.aspx.cs" Inherits="TheCave.A0500_MAINTAINYOURPROFILE" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <h3> Complete the form below to <b>Update</b> your details.</h3>
    <br />
     <asp:HiddenField ID="HiddenField2" runat="server" OnValueChanged="HiddenField2_ValueChanged" />
     <asp:Button ID="general" runat="server" Text="General Information" OnClick="general_Click" />
      <asp:Button ID="occupationBtn" runat="server" Text="Occupation and Education" OnClick="occupationBtn_Click" />
      <asp:Button ID="picture" runat="server" Text="Family Members" OnClick="picture_Click" />
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            
                
                <table>
                    <tr>
                        <td colspan="2">
                            <h3>Biographical Details <span style="font-size: medium">(* - required field)</span></h3>
                        </td>
                        <td>&nbsp;</td>
                    </tr>

                    <tr>
                        <td style="width: 151px">
                            <asp:Label ID="fname" runat="server" Text="First Name"></asp:Label>
                        </td>
                         <td style="width: 258px">
                             <asp:TextBox ID="name" runat="server" Width="214px"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidatorFname" runat="server" ErrorMessage="Please Enter First Name" ForeColor="Red" ControlToValidate="name"></asp:RequiredFieldValidator>
                             </td>
                        <td style="width: 258px">&nbsp;</td>
                    </tr>
                      <tr>
                        <td style="width: 151px">
                            <asp:Label ID="sname" runat="server" Text="Surname"></asp:Label>
                        </td>
                         <td style="width: 258px">
                             <asp:TextBox ID="surname" runat="server" Width="214px"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidatorSurname" runat="server" ErrorMessage="Please Enter Surname" ForeColor ="Red" ControlToValidate="surname"></asp:RequiredFieldValidator>
                             </td>
                          <td style="width: 258px">&nbsp;</td>
                    </tr>
                      <tr>
                        <td style="width: 151px">
                            <asp:Label ID="gender" runat="server" Text="Gender:"></asp:Label>
                        </td>
                         <td style="width: 258px">
                             <asp:Dropdownlist ID="drop1" runat="server" RepeatDirection="Horizontal">
                                  <asp:ListItem Text="" Value="-1"></asp:ListItem>
                                 <asp:ListItem Text ="Male"></asp:ListItem>
                                 <asp:ListItem Text ="Female" Value="Female"></asp:ListItem>
                                 <asp:ListItem Text ="Other" Value="Other"></asp:ListItem>
                                 
                             </asp:Dropdownlist>
                             *</td>
                          <td style="width: 258px">&nbsp;</td>
                    </tr>
                       <tr>
                        <td style="width: 151px">
                            Nationality</td>
                         <td style="width: 258px">
                             <asp:DropDownList ID="Nationalitytxt" runat="server" Width="180px">
                        <asp:ListItem Selected="True"></asp:ListItem>
                        <asp:ListItem >South African</asp:ListItem>
                        <asp:ListItem>Zimbabwean</asp:ListItem>
                        <asp:ListItem >American</asp:ListItem>
                        <asp:ListItem >British</asp:ListItem>
                        <asp:ListItem >Chinese</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>
                    </asp:DropDownList> 
                             <%--<asp:RequiredFieldValidator ID="RequiredFieldValidatorDeath" runat="server" ErrorMessage="Please Select Mortality" InitialValue="-1"  ForeColor ="Red" ControlToValidate="drop2"></asp:RequiredFieldValidator>--%>
                             &nbsp;</td>
                           <td style="width: 258px">&nbsp;</td>
                    </tr>
                     <tr>
                         <td style="width: 151px">
                             <asp:Label ID="death" runat="server" Text="Deceased"></asp:Label>
                         </td>
                         <td style="width: 258px">
                             <asp:DropDownList ID="drop2" runat="server" RepeatDirection="Horizontal">
                                 <asp:ListItem text="" Value="-1"></asp:ListItem>
                                 <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                 <asp:ListItem Text="No" Value="No"></asp:ListItem>
                             </asp:DropDownList>
                             <%--<asp:RequiredFieldValidator ID="RequiredFieldValidatorDeath" runat="server" ErrorMessage="Please Select Mortality" InitialValue="-1"  ForeColor ="Red" ControlToValidate="drop2"></asp:RequiredFieldValidator>--%></td>
                         <td style="width: 258px">&nbsp;</td>
                    </tr>
                     <tr>
                        <td style="width: 151px">
                            <asp:Label ID="height" runat="server" Text="Height"></asp:Label>
                        </td>
                         <td colspan="2">
                             <asp:TextBox ID="height1" runat="server" Width="57px" ></asp:TextBox><asp:Label ID="Label10" runat="server" Text="Metres"></asp:Label>
                             &nbsp;(use a comma separator)</td>
                    </tr>
                     
                
            <tr>
                <td colspan ="2">
                    <h3> Contact Details</h3>
                </td>
                <td>&nbsp;</td>
            </tr>                
            
                                   
                        <tr>
                            <td style="width: 151px"> 
                                <asp:Label ID="phoneNos" runat ="server" Text="PhoneNo"></asp:Label>
                            </td>
                        <td style="width: 258px">
                             <asp:TextBox ID="number" runat="server" Width="214px"></asp:TextBox>
                        </td>
                            <td style="width: 258px">&nbsp;</td>
                   </tr>

                 <tr>
                        <td style="width: 151px">
                            <asp:Label ID="email" runat="server" Text="Email"></asp:Label>
                        </td>
                         <td style="width: 258px">
                             <asp:TextBox ID="email1" runat="server" Width="214px"></asp:TextBox>
                           
                             <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email1" ErrorMessage="Enter Email Address" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"></asp:RegularExpressionValidator>
                             --%></td>
                        <td style="width: 258px">&nbsp;</td>
                    </tr>
                        <tr>
                        <td style="width: 151px">
                            <asp:Label ID="wEmail" runat="server" Text=" Work Email"></asp:Label>
                        </td>
                         <td style="width: 258px">
                             <asp:TextBox ID="wEmail1" runat="server" Width="214px"></asp:TextBox>
                        </td>
                            <td style="width: 258px">&nbsp;</td>
                    </tr>
                    
                         <tr>
                        <td style="width: 151px">
                            <asp:Label ID="fax" runat="server" Text="Fax No."></asp:Label>
                        </td>
                         <td style="width: 258px">
                             <asp:TextBox ID="fax1" runat="server" Width="214px"></asp:TextBox>
                        </td>
                             <td style="width: 258px">&nbsp;</td>
                    </tr>

                    
           <tr>
                        <td colspan="2">
                            <h3>Location Details</h3>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                                                          
                
                     <tr>
                        <td style="width: 151px"> 
                            <asp:Label ID ="nyika" runat="server" Text ="Resident Country"></asp:Label>
                        </td>
                         <td style="width: 258px">
                            <asp:TextBox ID ="Coun" runat ="server" Width="214px" ></asp:TextBox>
                         </td>

                         <td style="width: 258px">&nbsp;</td>

                    </tr> 
                      <tr>
                        <td style="width: 151px">
                            <asp:Label ID="city" runat="server" Text="City"></asp:Label>
                        </td>
                         <td style="width: 258px">
                            <asp:TextBox ID="City1" runat="server" Width="214px"></asp:TextBox>
                        </td>
                          <td style="width: 258px">&nbsp;</td>
                    </tr>
                      
                   
                    <tr>
                        <td style="width: 151px">
                            <asp:Label ID="address" runat="server" Text="Residential Address"></asp:Label>
                        </td>
                         <td style="width: 258px">
                             <asp:TextBox ID="Address1" runat="server" Rows="5" Height="100px" Width="214px"></asp:TextBox>
                        </td>
                        <td style="width: 258px">&nbsp;</td>
                        </tr>
                    <tr>
                       <td>
                            
                        </td>
                         <td class="text-right" style="width: 258px">
                             
                             <asp:Button ID="btnClear1" runat="server" Font-Names="Arial" OnClick="btnClear_Click" Text="Cancel" Width="77px" />
                             
                             <asp:Button ID="Button3" runat="server" Text="Next" OnClick="Button3_Click" Width="78px" BorderWidth="0px" />
                             
                        </td>
                        <td class="text-right" style="width: 258px">&nbsp;</td>
                        </tr>



                </table>
            
            <br />


        </asp:View>
        <asp:View ID="View2" runat="server">
            
                
                <table>

                    <tr>
                        <td colspan="2">
                            <h3>Occupation And Education</h3>
                        </td>
                    </tr>

                     <tr>
                        <td style="width: 150px">
                            <asp:Label ID="occupation" runat="server" Text="Occupation"></asp:Label>
                        </td>
                         <td style="width: 327px">
                             <asp:TextBox ID="Occupation1" runat="server" Rows="5" Height="36px" Width="290px" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                     
                    <tr>
                        <td colspan="2">
                            <h3>Education</h3>
                        </td>
                    </tr>
                                            
               
                
                    <tr>
                        <td style="width: 150px">
                            <asp:Label ID="qual" runat="server" Text="Highest Qualification"></asp:Label>
                        </td>
                         <td style="width: 327px">
                             <asp:Dropdownlist ID="quali" runat="server" RepeatDirection="Horizontal">
                                  <asp:ListItem></asp:ListItem>
                                 <asp:ListItem>Matric</asp:ListItem>
                                 <asp:ListItem>Undergraduate</asp:ListItem>
                                 <asp:ListItem>Postgraduate</asp:ListItem>
                                 <asp:ListItem>Masters</asp:ListItem>
                                 <asp:ListItem>Doctorate</asp:ListItem>
                                 <asp:ListItem>Professor</asp:ListItem>
                             </asp:Dropdownlist>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px">
                            <asp:Label ID="institution" runat="server" Text="Institution"></asp:Label>
                        </td>
                         <td style="width: 327px">
                            
                             <asp:TextBox ID="school" runat="server" Width="290px"></asp:TextBox>
                            
                        </td>
                    </tr>
                
           <tr>
                        <td colspan="2">
                            <h3 style="margin-right: 0px">Personal Interests</h3>
                        </td>
                    </tr>
                                            
                    <tr>
                        <td style="width: 150px; height: 38px;">
                            <asp:Label ID="hobby" runat="server" Text="Hobbies"></asp:Label>
                        </td>
                         <td style="width: 327px; height: 38px;">
                             <asp:TextBox ID="hobby1" runat="server" TextMode="MultiLine" Width="290px"></asp:TextBox>
                             
                        </td>
                    </tr>
                    
                    

                     <tr>
                        <td style="width: 150px">
                            <asp:Label ID="Label8" runat="server" Text="Languages"></asp:Label>
                        </td>
                         <td style="width: 327px">
                             <asp:TextBox ID="languages" runat="server" TextMode ="multiline" Width="290px"></asp:TextBox>
                             
                        </td>
                    </tr>
                     <tr>
                        <td style="width: 150px">
                            <asp:Label ID="Label9" runat="server" Text="Religion"></asp:Label>
                        </td>
                         <td style="width: 327px">
                             <asp:TextBox ID="religion" runat="server" TextMode ="multiline" Width="290px"></asp:TextBox>
                             
                        </td>
                    </tr>

                    <tr>
                       <td style="width: 151px">
                            
                          
                            
                        </td>
                         <td colspan ="2" style="height: 24px; width: 327px;" class="text-right">
                              <asp:Button ID="btnClear0" runat="server" Font-Names="Arial" OnClick="btnClear_Click" Text="Cancel" Width="77px" />
                              <asp:Button ID="Button5" runat="server" Text="Back" OnClick="Button5_Click" Width="78px" />
                             <asp:Button ID="Button4" runat="server" Text="Next" OnClick="Button4_Click" Width="78px" />
                             
                        </td>
                        </tr>
                       
                </table>
            
            
        </asp:View>
        <asp:View ID="View3" runat="server">
            
               
                <table>
                    <tr>
                        <td colspan="2">
                            <h3>Family Members</h3>
                        </td>
                    </tr>

                    <tr>
                        <td style="width: 150px">
                            <asp:Label ID="Label1" runat="server" Text="Father"></asp:Label>
                        </td>
                         <td style="width: 322px">
                             <asp:TextBox ID="Father" runat="server" Width="290px"></asp:TextBox>
                             
                        </td>
                    </tr>

                    <tr>
                        <td style="width: 150px">
                            <asp:Label ID="Label2" runat="server" Text="Mother"></asp:Label>
                        </td>
                         <td style="width: 322px">
                             <asp:TextBox ID="Mother" runat="server" Width="291px"></asp:TextBox>
                             
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px">
                            <asp:Label ID="Label3" runat="server" Text="Grand Father"></asp:Label>
                        </td>
                         <td style="width: 322px">
                             <asp:TextBox ID="gFather" runat="server" Width="289px"></asp:TextBox>
                             
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px">
                            <asp:Label ID="Label4" runat="server" Text="Grand Mother"></asp:Label>
                        </td>
                         <td style="width: 322px">
                             <asp:TextBox ID="gMother" runat="server" Width="290px"></asp:TextBox>
                             
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px">
                            <asp:Label ID="Label5" runat="server" Text="Son"></asp:Label>
                        </td>
                         <td style="width: 322px">
                             <asp:TextBox ID="Son" runat="server" Width="290px"></asp:TextBox>
                             
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px">
                            <asp:Label ID="Label7" runat="server" Text="Daughter"></asp:Label>
                        </td>
                         <td style="width: 322px">
                             <asp:TextBox ID="Daughter" runat="server" Width="290px"></asp:TextBox>
                             
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px">
                            <asp:Label ID="Label6" runat="server" Text="Siblings"></asp:Label>
                            
                        </td>
                         <td style="width: 322px">
                             <asp:TextBox ID="Siblings" runat="server" Width="290px" TextMode ="Multiline"></asp:TextBox>
                             
                        </td>
                    </tr>
                     <tr>
                         <td style="width: 150px">

                         </td>
                   <td colspan="2" style="height: 24px; width: 322px;" class="text-right">
                        
                       <%--<asp:Button ID="btnDelete" runat="server" Text="Update" OnClick="btnDelete_Click" Font-Names="Arial" Width="75px" />--%>
                       <asp:Button ID="btnClear" runat="server" Font-Names="Arial" OnClick="btnClear_Click" Text="Cancel" Width="77px" />
                        
                       <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="Back" Width="78px" />
                        
                       <asp:Button ID="btnSave" runat="server" Font-Names="Arial" OnClick="btnSave_Click" Text="Update" Width="77px" />

                    </td>

                    </tr>

                    <tr>
                    <td style="width: 150px">
                        
                    </td>
                    <td colspan="2" style="width: 322px">
                        <asp:Label ID="lblsuccess" runat="server" Text="Label" ForeColor="Green"></asp:Label>
                    </td>

                </tr>

                <tr>
                    <td style="width: 150px">
                       
                    </td>
                    <td colspan="2" style="width: 322px">
                       <asp:Label ID="lblerror" runat="server" Text="Label" ForeColor="Red"></asp:Label>
                        
                        <br />
                    </td>

                </tr>


                   

                    

                </table>
                
           
            
            
        </asp:View>
        
    </asp:MultiView>

</asp:Content>
