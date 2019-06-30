using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace TheCave.Keenan
{
    public partial class JoinExistingFamily : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TreeIDtxt.Focus();
            Table2.Visible = false;
            
            RequiredFieldValidator1.Enabled = false;
            RequiredFieldValidator3.Enabled = false;
            RequiredFieldValidator5.Enabled = false;
            RequiredFieldValidator4.Enabled = false;
            RequiredFieldValidator6.Enabled = false;
            RequiredFieldValidator7.Enabled = false;
            RequiredFieldValidator8.Enabled = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            string cs = ConfigurationManager.ConnectionStrings["JN10ConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    // Check if the given TreeID is valid.
                    DoesFamilyExist(con);
                    
                    con.Close();
                }
        }

        public void DoesFamilyExist(SqlConnection con)
        {
            // check if person is typing a valid TreeID
            SqlCommand cmd = new SqlCommand("FindExistingTreeID", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TreeID", Convert.ToInt32(TreeIDtxt.Text));

            int ReturnCode = (int)cmd.ExecuteScalar();
            if (ReturnCode==-1)
            {
                Label2ErrorMessage.ForeColor = System.Drawing.Color.Red;
                Label2ErrorMessage.Text = "Invalid TreeID, make sure you entered the correct TreeID.";
            }
            else
            {
                // make everything else visible.
                Table2.Visible = true;
                RequiredFieldValidator1.Enabled = true;
                RequiredFieldValidator3.Enabled = true;
                RequiredFieldValidator5.Enabled = true;
                RequiredFieldValidator4.Enabled = true;
                RequiredFieldValidator6.Enabled = true;
                RequiredFieldValidator7.Enabled = true;
                RequiredFieldValidator8.Enabled = true;
                Label2ErrorMessage.ForeColor = System.Drawing.Color.Green;
                Label2ErrorMessage.Text = "TreeID Accepted";
            }
        }

        public void Clear()
        {
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('User already exists. Try a different Email Address');</script?");
            TreeIDtxt.Text = "";
            FirstNametxt.Text = "";
            Surnametxt.Text = "";
            Gendertxt.Text = "";
            DOBtxt.Text = "";
            Nationalitytxt.Text = "";
            Emailtxt.Text = "";
            Passwordtxt.Text = "";

        }

        protected void SignUpBtn_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string cs = ConfigurationManager.ConnectionStrings["JN10ConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    // Add the first member as a member in the Member Table.
                    AddMember(con);

                    // After the new member is created in the Member table, the treeID of the current user, that's logged in, is used to link this user new member to the same family tree.
                    LinkMemberWithFamily(con);

                    // Add Association of Member with Profile
                    AddMemberToTheirProfile(con);

                    // Add the stats for this member
                    UpdateNumberOfMembersStat(con);
                    AgeStats(con);
                    LengthStats(con);
                    UpdateNumberOfNationsStat(con);

                    if (lblErrorMessage.Text != "")
                    {
                        Clear();
                        
                    }
                    else
                    {
                        Response.Redirect("Login.aspx");
                    }

                    con.Close();
                }
            }
        }

        public void AddMember(SqlConnection con)
        {
            SqlCommand cmd = new SqlCommand("AddMemberAfterInvite", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Fname", FirstNametxt.Text);
            cmd.Parameters.AddWithValue("@Lname", Surnametxt.Text);
            cmd.Parameters.AddWithValue("@Gender", Gendertxt.Text);
            cmd.Parameters.AddWithValue("@DOB", DOBtxt.Text);
            cmd.Parameters.AddWithValue("@Nation", Nationalitytxt.Text);
            cmd.Parameters.AddWithValue("@Email", Emailtxt.Text);
            cmd.Parameters.AddWithValue("@Password", Passwordtxt.Text);

            cmd.ExecuteNonQuery();
        }

        public void AddMemberToTheirProfile(SqlConnection con)
        {
            // link member to their profile. The ProfileID= MemberID
            SqlCommand cmd = new SqlCommand("ConnectProfileToMember", con);
            cmd.CommandType = CommandType.StoredProcedure;

            //string MemberIDQuery = "select MemberID from Member Where EmailAddress= '" + Emailtxt.Text + "'";
            //SqlCommand MemberIDCom = new SqlCommand(MemberIDQuery, con);
            //string MemberID = MemberIDCom.ExecuteScalar().ToString();

            cmd.Parameters.AddWithValue("@MemberID", ReturnNewMemberID(con));
            cmd.Parameters.AddWithValue("Fname", FirstNametxt.Text);

            cmd.ExecuteNonQuery();
        }

        public void LinkMemberWithFamily(SqlConnection con)
        {
            SqlCommand cmda = new SqlCommand("NewMemberFamilyTree", con);
            cmda.CommandType = CommandType.StoredProcedure;

            SqlParameter TreeID = new SqlParameter("@TreeID", Convert.ToInt32(TreeIDtxt.Text));
            SqlParameter MemberID = new SqlParameter("@MemberID", ReturnNewMemberID(con));

            cmda.Parameters.Add(TreeID);
            cmda.Parameters.Add(MemberID);

            cmda.ExecuteNonQuery();

        }

        // update number of members in Stats table for the specific [Family Tree]
        public void UpdateNumberOfMembersStat(SqlConnection con)
        {

            //Add the member as the first stat (this statID will be used when inviting new members to this existing family tree to update the number of members in the family)
            SqlCommand cmd = new SqlCommand("UpdateNumberOfMembersStat", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TreeID", Convert.ToInt32(TreeIDtxt.Text));

            cmd.ExecuteNonQuery();

        }

        // update average height of family. 
        // SQL: if average is zero just say unknown
        //      if average exist, update the average.
        // populates all min, max, and average height of the family.
        public void LengthStats(SqlConnection con)
        {
            SqlCommand cmd = new SqlCommand("LengthStats", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TreeID", Convert.ToInt32(TreeIDtxt.Text));
            cmd.ExecuteNonQuery();
        }

        // populate age min, max, and average values of the family.
        public void AgeStats(SqlConnection con)
        {
            SqlCommand cmd = new SqlCommand("AgeStats", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TreeID", Convert.ToInt32(TreeIDtxt.Text));
            //cmd.Parameters.AddWithValue("@MemberID", Session["CurMemberID"]);
            cmd.ExecuteNonQuery();
        }

        //update the Nationality once the new member has been added to the family
        public void UpdateNumberOfNationsStat(SqlConnection con)
        {

            SqlCommand cmd = new SqlCommand("UpdateNumberOfNationsStat", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TreeID", Convert.ToInt32(TreeIDtxt.Text));
            cmd.Parameters.AddWithValue("@Nation", Nationalitytxt.Text);
            cmd.ExecuteNonQuery();
        }

        public int ReturnNewMemberID(SqlConnection sqlCon)
        {
            SqlCommand sqlCmd = new SqlCommand("IDofMember", sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            SqlParameter MemberID = new SqlParameter("@Email", Emailtxt.Text);
            sqlCmd.Parameters.Add(MemberID);
            return (int)sqlCmd.ExecuteScalar();
        }
    }
}