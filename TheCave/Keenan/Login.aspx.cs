using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.Security;

namespace TheCave.Keenan
{
    public partial class Login : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            Emailtxt.Focus();
        }

        protected void loginButton2_Click1(object sender, EventArgs e)
        {

            string cs = ConfigurationManager.ConnectionStrings["JN10ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("loginUser", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter Email = new SqlParameter("@UserEmailAddress", Emailtxt.Text);
                SqlParameter Password = new SqlParameter("@Password", Passwordtxt.Text);

                cmd.Parameters.Add(Email);
                cmd.Parameters.Add(Password);

                con.Open();
                int ReturnCode = (int)cmd.ExecuteScalar();
                if(ReturnCode == 1)
                {
                    Session["CurEmail"] = Emailtxt.Text;

                    

                    string FirstNameQuery = "select FName from Member Where EmailAddress= '" + Emailtxt.Text + "'";
                    SqlCommand FNameCom = new SqlCommand(FirstNameQuery, con);
                    string FName = FNameCom.ExecuteScalar().ToString().Replace(" ", "");

                    Session["CurFName"] = FName;

                    string SurnameQuery = "select LName from Member Where EmailAddress= '" + Emailtxt.Text + "'";
                    SqlCommand SurnameCom = new SqlCommand(SurnameQuery, con);
                    string SName = SurnameCom.ExecuteScalar().ToString();
                    
                    Session["CurSName"] = SName;

                    string MemberIDQuery = "select MemberID from Member Where EmailAddress= '" + Emailtxt.Text + "'";
                    SqlCommand MemberIDCom = new SqlCommand(MemberIDQuery, con);
                    int MemberID = (int)MemberIDCom.ExecuteScalar();
                    Session["CurMemberID"] = MemberID;

                    Session["ProfileID"] = MemberID;

                    string TreeIDQuery = "select [Family Tree].TreeID from [Family Tree], MemberFamilyTree Where MemberFamilyTree.MemberID= '" + Session["CurMemberID"] + "' and MemberFamilyTree.TreeID=[Family Tree].TreeID";
                    SqlCommand TreeIDCom = new SqlCommand(TreeIDQuery, con);
                    int TreeID = (int)TreeIDCom.ExecuteScalar();
                    Session["CurMemberTreeID"] = TreeID;

                    string FamilyNQ = "SELECT [Family Tree].FamilyName FROM[Family Tree] WHERE[Family Tree].TreeID =" + @TreeID;
                    SqlCommand famCom = new SqlCommand(FamilyNQ, con);
                    string FamilyName = famCom.ExecuteScalar().ToString();
                    Session["FamilyName"] = FamilyName;

                    Response.Redirect("~/Default.aspx");
                }
                else
                {
                    lblMessage.Text = "Incorrect email address/password.";
                }
            }


            /*
                con.Open();
            string checkuser = "select count(*) from Member where EmailAddress= '" + Emailtxt.Text + "'";
            SqlCommand com = new SqlCommand(checkuser, con);
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
            if (temp == 1)
            {
                string checkPasswordQuery = "select Password from Member Where EmailAddress= '" + Emailtxt.Text + "'";
                SqlCommand passwordCom = new SqlCommand(checkPasswordQuery, con);
                string password = passwordCom.ExecuteScalar().ToString().Replace(" ", "");
                if (password == Passwordtxt.Text)
                {
                    con.Close();

                    Session["New"] = Emailtxt.Text;
                    //Response.Write("Password is correct.");

                    Response.Redirect("../Default.aspx");
                    //Response.Redirect("../Default.aspx");

                }
                else
                {
                    con.Close();
                    Passwordtxt.Text = "";
                    Response.Write("Password is NOT correct.");
                }
            }
            else
            {
                Response.Write("Username is NOT correct.");
                Emailtxt.Text = "";
                Passwordtxt.Text = "";
                con.Close();
            }
            */
        }
    }
}