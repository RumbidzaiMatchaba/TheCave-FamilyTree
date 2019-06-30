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
    public partial class SignUp : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            FamilySurnametxt.Focus();
        }

        protected void SignUpBtn_Click(object sender, EventArgs e)
        {

            if (Page.IsValid)
            {
                string cs = ConfigurationManager.ConnectionStrings["JN10ConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {

                   // if (AgeValidation(con) <= 13)
                   // {
                        lblErrorMessage.Text = "Please make sure you enter a date of birth older than 13 years old.";
                   // }
                   // else
                   // {
                        // Create a new Family in the [Family Tree] Table.
                        int ReturnCode = NewFamily(con);
                        if (ReturnCode == 1)
                        {
                            // Add the first member as a member in the Member Table.
                            int RCode = AddFirstMember(con);
                            if (RCode == -1)
                            {
                                // Email not unique
                                Clear();
                                lblErrorMessage.Text = "Email address already in use. Please choose another email address.";
                            }
                            else
                            {
                                // Add Association of Member with Profile
                                AddMemberToTheirProfile(con);

                                // Add the stats for this member
                                AddNumberOfMembersStat(con);
                                AddAgeStats(con);
                                InitiateLengthStats(con);
                                AddNumberOfNationsStat(con);

                                // Add the first member as administrator in Family_Administrator Table.
                                AddMemberAsAdmin(con);

                                // Associate the Family_Administrator and [Family Tree] Table (in the TreeAdmin Table)
                                LinkAdminWithFamily(con);

                                // Associate the Member and Family Table (in the MemberFamilyTree Table)
                                LinkMemberWithFamily(con);


                                con.Close();

                                if (lblErrorMessage.Text == "")
                                    Response.Redirect("~/Keenan/Login.aspx");
                            }
                            con.Close();
                        }
                        else
                        {
                            Clear();
                            lblErrorMessage.Text = "A family with this first name and surname already exists";
                            con.Close();
                        }
                   // }
                }
            }
        }

        public void AddNumberOfMembersStat(SqlConnection con)
        {
            //Add the member as the first stat (this statID will be used when inviting new members to this existing family tree to update the number of members in the family)

            SqlCommand cmd = new SqlCommand("NumberOfMembersStat", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TreeID", ReturnFamilyID(con));

            cmd.ExecuteNonQuery();
        }

        //  populates All available nationalities for the family.
        public void AddNumberOfNationsStat(SqlConnection con)
        {
            SqlCommand cmd = new SqlCommand("CreateNumberOfNationsStat", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TreeID", ReturnFamilyID(con));
            cmd.Parameters.AddWithValue("@Nation", Nationalitytxt.Text);
            cmd.ExecuteNonQuery();
        }

        // populates min, max, and average height of the family.
        public void InitiateLengthStats(SqlConnection con)
        {
            SqlCommand cmd = new SqlCommand("InitiateLengthStats", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TreeID", ReturnFamilyID(con));
            cmd.ExecuteNonQuery();
        }

        // populate age min, max, and average values of the family.
        public void AddAgeStats(SqlConnection con)
        {
            SqlCommand cmd = new SqlCommand("InitiateAgeStats", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TreeID", ReturnFamilyID(con));
            cmd.Parameters.AddWithValue("@MemberID", ReturnMemberID(con));
            cmd.ExecuteNonQuery();
        }

        public int ReturnNumberOfMembersStatID(SqlConnection con)
        {
            // Use FamilySurnametxt and stat description to get the statID.
            SqlCommand cmd = new SqlCommand("IDofNumbMembersStat", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TreeID", ReturnFamilyID(con));

            return (int)cmd.ExecuteScalar();
        }

        public int AgeValidation(SqlConnection con)
        {
            // New family added to Family Tree table.
            SqlCommand cmd = new SqlCommand("HowOldAreYou", con);
            cmd.CommandType = CommandType.StoredProcedure;
            //DateTime date = new DateTime(long.Parse(DOBtxt.Text.ToString()));
            cmd.Parameters.AddWithValue("@DOB", DOBtxt.Text.ToString());
            con.Open();
            return (int)cmd.ExecuteScalar();
        }

        public int NewFamily(SqlConnection con)
        {
            // New family added to Family Tree table.
            SqlCommand cmd = new SqlCommand("CreateNewFamilyTree", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter FamilySurname = new SqlParameter("@FamilySurname", FamilySurnametxt.Text);
            SqlParameter FamilyCreatorName = new SqlParameter("Fname", FirstNametxt.Text);
            cmd.Parameters.Add(FamilySurname);
            cmd.Parameters.Add(FamilyCreatorName);

            //con.Open();
            return (int)cmd.ExecuteScalar();
        }

        public int AddFirstMember(SqlConnection con)
        {
            // First user is added to the Member table.
            SqlCommand cmde = new SqlCommand("CreateNewUser", con);
            cmde.CommandType = CommandType.StoredProcedure;

            SqlParameter FName = new SqlParameter("@Fname", FirstNametxt.Text);
            SqlParameter LName = new SqlParameter("@Lname", Surnametxt.Text);
            SqlParameter Gender = new SqlParameter("@Gender", Gendertxt.Text);
            SqlParameter DOB = new SqlParameter("@DOB", DOBtxt.Text);
            SqlParameter Nationality = new SqlParameter("@Nation", Nationalitytxt.Text);
            SqlParameter EmailAddress = new SqlParameter("@Email", Emailtxt.Text);
            SqlParameter Password = new SqlParameter("@Password", Passwordtxt.Text);

            cmde.Parameters.Add(FName);
            cmde.Parameters.Add(LName);
            cmde.Parameters.Add(Gender);
            cmde.Parameters.Add(DOB);
            cmde.Parameters.Add(Nationality);
            cmde.Parameters.Add(EmailAddress);
            cmde.Parameters.Add(Password);

            return (int)cmde.ExecuteScalar();
        }

        public void AddMemberToTheirProfile(SqlConnection con)
        {
            // link member to their profile. The ProfileID= MemberID
            SqlCommand cmd = new SqlCommand("ConnectProfileToMember", con);
            cmd.CommandType = CommandType.StoredProcedure;

            string MemberIDQuery = "select MemberID from Member Where EmailAddress= '" + Emailtxt.Text + "'";
            SqlCommand MemberIDCom = new SqlCommand(MemberIDQuery, con);
            string MemberID = MemberIDCom.ExecuteScalar().ToString();

            cmd.Parameters.AddWithValue("@MemberID", Convert.ToInt32(MemberID));
            cmd.Parameters.AddWithValue("Fname", FirstNametxt.Text);

            cmd.ExecuteNonQuery();
        }

        public void AddMemberAsAdmin(SqlConnection con)
        {
            // First Member should be added as Family administrator.
            SqlCommand cmdr = new SqlCommand("CreateNewAdmin", con);
            cmdr.CommandType = CommandType.StoredProcedure;

            SqlParameter AdminName = new SqlParameter("@AFName", FirstNametxt.Text);
            SqlParameter AdminSurname = new SqlParameter("@ALName", Surnametxt.Text);

            cmdr.Parameters.Add(AdminName);
            cmdr.Parameters.Add(AdminSurname);
            

            int ReturnCode = (int)cmdr.ExecuteScalar();
            if(ReturnCode == 1)
            {
                return;
            }
            else
            {
                lblErrorMessage.Text = "The member is already an administrator of this family.";
            }
        }

        public int ReturnMemberID(SqlConnection con)
        {
            // Use email address to get the member id.
            SqlCommand cmd = new SqlCommand("IDofMember", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter Email = new SqlParameter("@Email", Emailtxt.Text);
            cmd.Parameters.Add(Email);

            return (int)cmd.ExecuteScalar();

        }

        public int ReturnAdminID(SqlConnection con)
        {
            // Return the ID of the Administrator which belongs to a specific Family by AdminID
            SqlCommand cmd = new SqlCommand("IDofAdmin", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter AdminFname = new SqlParameter("@FName", FirstNametxt.Text);
            SqlParameter AdminLName = new SqlParameter("@LName", Surnametxt.Text);
            cmd.Parameters.Add(AdminFname);
            cmd.Parameters.Add(AdminLName);

            return (int)cmd.ExecuteScalar();
        }

        public int ReturnFamilyID(SqlConnection con)
        {
            // Return the ID of the Family that the admin belongs to on TreeID
            SqlCommand cmd = new SqlCommand("IDofFamily", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter AdminFname = new SqlParameter("@FamilyName", FamilySurnametxt.Text);
            SqlParameter AdminLName = new SqlParameter("@FName", FirstNametxt.Text);
            cmd.Parameters.Add(AdminFname);
            cmd.Parameters.Add(AdminLName);

            return (int)cmd.ExecuteScalar();
        }

        public void LinkAdminWithFamily(SqlConnection con)
        {
            SqlCommand cmda = new SqlCommand("NewTreeAdmin", con);
            cmda.CommandType = CommandType.StoredProcedure;

            SqlParameter TreeID = new SqlParameter("@TreeID", ReturnFamilyID(con));
            SqlParameter AdminID = new SqlParameter("AdminId", ReturnAdminID(con));

            cmda.Parameters.Add(TreeID);
            cmda.Parameters.Add(AdminID);

            int ReturnCode = (int)cmda.ExecuteScalar();
            if(ReturnCode == 1)
            {
                return;
            }
            else
            {
                lblErrorMessage.Text = "Person is already a family admin of this family";
            }
        }

        public void LinkMemberWithFamily(SqlConnection con)
        {
            SqlCommand cmda = new SqlCommand("NewMemberFamilyTree", con);
            cmda.CommandType = CommandType.StoredProcedure;

            SqlParameter TreeID = new SqlParameter("@TreeID", ReturnFamilyID(con));
            SqlParameter MemberID = new SqlParameter("@MemberID", ReturnMemberID(con));

            cmda.Parameters.Add(TreeID);
            cmda.Parameters.Add(MemberID);

            int ReturnCode = (int)cmda.ExecuteScalar();
            if (ReturnCode == 1)
            {
                return;
            }
            else
            {
                lblErrorMessage.Text = "Person is already a member of this family";
            }
        }

        /*public void LinkFamilyWithStat(SqlConnection con)
        {
            // at this point we are only linking based on the fact that the surname exists in the [Family Tree] and Stats Tables.
            SqlCommand cmda = new SqlCommand("NewFamilyStatRelationship", con);
            cmda.CommandType = CommandType.StoredProcedure;

            
            SqlParameter StatID = new SqlParameter("@StatID", ReturnNumberOfMembersStatID(con));
            SqlParameter TreeID = new SqlParameter("@TreeID", ReturnFamilyID(con));

            cmda.Parameters.Add(StatID);
            cmda.Parameters.Add(TreeID);

            int ReturnCode = (int)cmda.ExecuteScalar();
            if (ReturnCode == 1)
            {
                return;
            }
            else
            {
                lblErrorMessage.Text = "Person is already a member of this family";
            }
        }
        */

        public void Clear()
        {
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('User already exists. Try a different Email Address');</script?");
            FamilySurnametxt.Text = "";
            FirstNametxt.Text = "";
            Surnametxt.Text = "";
            Gendertxt.Text = "";
            DOBtxt.Text = "";
            Nationalitytxt.Text = "";
            Emailtxt.Text = "";
            Passwordtxt.Text = "";

        }
    }
}