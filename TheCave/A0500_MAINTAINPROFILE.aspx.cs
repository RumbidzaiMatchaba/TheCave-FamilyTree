using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace TheCave
{
    public partial class A0500_MAINTAINPROFILE : System.Web.UI.Page
    {
        SqlConnection sqlCon = new SqlConnection(@"Data Source = openbox.nmmu.ac.za\wrr; Initial Catalog = JN10; Persist Security Info=True;User ID = JN10User; Password=BN5RbR5a");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CurEmail"] != null)
            {
                if (!IsPostBack)
                {

                    FillGridView();
                   lblsuccess.Visible = false;
                    lblerror.Visible = false;
                    GridView1.Visible = false;
                    Button2.Enabled = false;

                }
            }
            else
            {
                Response.Redirect("~/Keenan/Login.aspx");
            }



        }

        protected void general_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }
        protected void occupationBtn_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;

        }
        protected void picture_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();

            //int MemID = ReturnMemberID(sqlCon);

            if (btnSave.Text == "Save")
            {
                //int ReturnCode = AddNewMemberToFamily(sqlCon);
                int ReturnCode = AddNewMember(sqlCon);
                if (ReturnCode == -1)
                {
                    lblsuccess.Text = "This member already exists in the family";
                }

                else
                {
                    // After the new member is created in the Member table, the treeID of the current user, that's logged in, is used to link this user new member to the same family tree.
                    LinkMemberWithFamily(sqlCon);

                    // link the new member with it's profile
                    AddMemberToTheirProfile(sqlCon);

                    // Then the family's stats are updated !!!Order is important!!!
                    UpdateNumberOfMembersStat(sqlCon);
                    AgeStats(sqlCon);
                    LengthStats(sqlCon);
                    UpdateNumberOfNationsStat(sqlCon);
                    
                    
                    lblsuccess.Text = "Saved Successfully";
                }
            }
            // String MemberID = HiddenField2.Value;
            else
            {
                UpdateMemberOfFamily(sqlCon);
                // Then the family's stats are updated
                UpdateNumberOfNationsStat(sqlCon);
                LengthStats(sqlCon);
                AgeStats(sqlCon);
                //UpdateNumberOfMembersStat(sqlCon);

                lblsuccess.Text = "Update this event if changes were made";
            }
                Clear();

            LengthStats(sqlCon);

            FillGridView();

                sqlCon.Close();


            }

        public void LinkMemberWithFamily(SqlConnection con)
        {
            SqlCommand cmda = new SqlCommand("NewMemberFamilyTree", con);
            cmda.CommandType = CommandType.StoredProcedure;

            SqlParameter TreeID = new SqlParameter("@TreeID", (int)Session["CurMemberTreeID"]);
            SqlParameter MemberID = new SqlParameter("@MemberID", ReturnNewMemberID(con));

            cmda.Parameters.Add(TreeID);
            cmda.Parameters.Add(MemberID);

            cmda.ExecuteNonQuery();
            
        }
        public void AddMemberToTheirProfile(SqlConnection con)
        {
            // link member to their profile. The ProfileID= MemberID
            SqlCommand cmd = new SqlCommand("ConnectProfileToMember", con);
            cmd.CommandType = CommandType.StoredProcedure;

            //string MemberIDQuery = "select MemberID from Member Where EmailAddress= '" + email1.Text + "'";
            //SqlCommand MemberIDCom = new SqlCommand(MemberIDQuery, con);
            //string MemberID = MemberIDCom.ExecuteScalar().ToString();

            cmd.Parameters.AddWithValue("@MemberID", ReturnNewMemberID(con));
            cmd.Parameters.AddWithValue("Fname", name.Text);

            cmd.ExecuteNonQuery();
        }
        // keenan's method
        public int AddNewMember(SqlConnection sqlCon)
        {
            
            SqlCommand sqlCmd = new SqlCommand("NewMember", sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@Fname", name.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@LName", surname.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Gender", drop1.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Deceased", drop2.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Height", double.Parse(height1.Text.Trim()));
            sqlCmd.Parameters.AddWithValue("@PhoneNo", number.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@EmailAddress", email1.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@WorkEmail", wEmail1.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@FaxNo", fax1.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Country", Coun.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@City", City1.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Address", Address1.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Occupation", Occupation1.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Qualification", quali.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@College", school.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Interests", hobby1.Text.Trim());
            //sqlCmd.Parameters.AddWithValue("@PolitcalViews", politics1.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@SpokenLanguages", languages.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Religion", religion.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Father", Father.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Mother", Mother.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@GrandFather", gFather.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@GrandMother", gMother.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Son", Son.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Daughter", Daughter.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Siblings", Siblings.Text.Trim());
            return (int)sqlCmd.ExecuteScalar();
        }

        // update number of members in Stats table for the specific [Family Tree]
        public void UpdateNumberOfMembersStat(SqlConnection con)
        {
            
                //Add the member as the first stat (this statID will be used when inviting new members to this existing family tree to update the number of members in the family)
                SqlCommand cmd = new SqlCommand("UpdateNumberOfMembersStat", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@TreeID", Session["CurMemberTreeID"]);

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
            cmd.Parameters.AddWithValue("@TreeID", Session["CurMemberTreeID"]);
            cmd.ExecuteNonQuery();
        }

        // populate age min, max, and average values of the family.
        public void AgeStats(SqlConnection con)
        {
            SqlCommand cmd = new SqlCommand("AgeStats", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TreeID", Session["CurMemberTreeID"]);
            //cmd.Parameters.AddWithValue("@MemberID", Session["CurMemberID"]);
            cmd.ExecuteNonQuery();
        }

        //update the Nationality once the new member has been added to the family
        public void UpdateNumberOfNationsStat(SqlConnection con)
        {

            SqlCommand cmd = new SqlCommand("UpdateNumberOfNationsStat", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TreeID", Session["CurMemberTreeID"]);
            cmd.Parameters.AddWithValue("@Nation", Nationalitytxt.Text);
            cmd.ExecuteNonQuery();
        }
        // kuda's method
        //public int AddNewMemberToFamily(SqlConnection sqlCon)
        //{
        //    SqlCommand sqlCmd = new SqlCommand("NewMemberProfile", sqlCon);
        //    sqlCmd.CommandType = CommandType.StoredProcedure;
        //    sqlCmd.Parameters.AddWithValue("@MemberID", (HiddenField2.Value == "" ? 0 : Convert.ToInt32(HiddenField2.Value)));
        //    sqlCmd.Parameters.AddWithValue("@Fname", name.Text.Trim());
        //    sqlCmd.Parameters.AddWithValue("@LName", surname.Text.Trim());
        //    sqlCmd.Parameters.AddWithValue("@Gender", drop1.Text.Trim());
        //    sqlCmd.Parameters.AddWithValue("@Deceased", drop2.Text.Trim());
        //    sqlCmd.Parameters.AddWithValue("@Height", height1.Text.Trim());
        //    sqlCmd.Parameters.AddWithValue("@PhoneNo", number.Text.Trim());
        //    sqlCmd.Parameters.AddWithValue("@EmailAddress", email1.Text.Trim());
        //    sqlCmd.Parameters.AddWithValue("@WorkEmail", wEmail1.Text.Trim());
        //    sqlCmd.Parameters.AddWithValue("@FaxNo", fax1.Text.Trim());
        //    sqlCmd.Parameters.AddWithValue("@Country", Coun.Text.Trim());
        //    sqlCmd.Parameters.AddWithValue("@City", City1.Text.Trim());
        //    sqlCmd.Parameters.AddWithValue("@Address", Address1.Text.Trim());
        //    sqlCmd.Parameters.AddWithValue("@Occupation", Occupation1.Text.Trim());
        //    sqlCmd.Parameters.AddWithValue("@Qualification", quali.Text.Trim());
        //    sqlCmd.Parameters.AddWithValue("@College", school.Text.Trim());
        //    sqlCmd.Parameters.AddWithValue("@Interests", hobby1.Text.Trim());
        //    //sqlCmd.Parameters.AddWithValue("@PolitcalViews", politics1.Text.Trim());
        //    sqlCmd.Parameters.AddWithValue("@SpokenLanguages", languages.Text.Trim());
        //    sqlCmd.Parameters.AddWithValue("@Religion", religion.Text.Trim());
        //    sqlCmd.Parameters.AddWithValue("@Father", Father.Text.Trim());
        //    sqlCmd.Parameters.AddWithValue("@Mother", Mother.Text.Trim());
        //    sqlCmd.Parameters.AddWithValue("@GrandFather", gFather.Text.Trim());
        //    sqlCmd.Parameters.AddWithValue("@GrandMother", gMother.Text.Trim());
        //    sqlCmd.Parameters.AddWithValue("@Son", Son.Text.Trim());
        //    sqlCmd.Parameters.AddWithValue("@Daughter", Daughter.Text.Trim());
        //    sqlCmd.Parameters.AddWithValue("@Siblings", Siblings.Text.Trim());
        //    return (int)sqlCmd.ExecuteScalar();
        //}

        public int UpdateMemberOfFamily(SqlConnection sqlCon)
        {
            SqlCommand sqlCmd = new SqlCommand("UpdateProfile", sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@MemberID", ReturnNewMemberID(sqlCon));
            sqlCmd.Parameters.AddWithValue("@Fname", name.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@LName", surname.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Gender", drop1.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Deceased", drop2.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Height", double.Parse(height1.Text.Trim()));
            sqlCmd.Parameters.AddWithValue("@PhoneNo", number.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@EmailAddress", email1.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@WorkEmail", wEmail1.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@FaxNo", fax1.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Country", Coun.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@City", City1.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Address", Address1.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Occupation", Occupation1.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Qualification", quali.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@College", school.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Interests", hobby1.Text.Trim());
            //sqlCmd.Parameters.AddWithValue("@PolitcalViews", politics1.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@SpokenLanguages", languages.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Religion", religion.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Father", Father.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Mother", Mother.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@GrandFather", gFather.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@GrandMother", gMother.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Son", Son.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Daughter", Daughter.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Siblings", Siblings.Text.Trim());
            return (int)sqlCmd.ExecuteScalar();
        }
        public int ReturnNewMemberID(SqlConnection sqlCon)
        {
            SqlCommand sqlCmd = new SqlCommand("IDofMember", sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            SqlParameter MemberID = new SqlParameter("@Email", email1.Text);
            sqlCmd.Parameters.Add(MemberID);
            return (int)sqlCmd.ExecuteScalar();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }
        public void Clear()
        {
            HiddenField2.Value = "";
            name.Text = surname.Text = height1.Text = number.Text = email1.Text = wEmail1.Text = fax1.Text = Coun.Text = Address1.Text = City1.Text = Occupation1.Text = quali.Text = school.Text = hobby1.Text =  languages.Text = religion.Text =
                Father.Text = Mother.Text = gFather.Text = gMother.Text = Son.Text = Daughter.Text = Siblings.Text = "";
            lblsuccess.Text = lblerror.Text = "";
            btnSave.Text = "Save";
           

        }

        void FillGridView()
        {
            //if (sqlCon.State == ConnectionState.Closed)
            //    sqlCon.Open();
            //SqlDataAdapter sqlDa = new SqlDataAdapter("MemberViewAll", sqlCon);
            //sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            //DataTable dtbl = new DataTable();
            //sqlDa.Fill(dtbl);
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("ViewMembersFL", sqlCon); //displays users first and last name.
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDa.SelectCommand.Parameters.AddWithValue("@TreeID", (int)Session["CurMemberTreeID"]);
            
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);

            GridView1.DataSource = dtbl;
            GridView1.DataBind();

        }

        protected void lnk_OnClick(object sender, EventArgs e)
        {
            int MemberID = Convert.ToInt32((sender as LinkButton).CommandArgument.Trim());
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            //int MemberID = ReturnNewMemberID(sqlCon);
            SqlDataAdapter sqlDa = new SqlDataAdapter("MemberbyID", sqlCon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDa.SelectCommand.Parameters.AddWithValue("@MemberID", MemberID);
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            sqlCon.Close();
            HiddenField2.Value = MemberID.ToString();
            name.Text = dtbl.Rows[0]["FName"].ToString();
            surname.Text = dtbl.Rows[0]["LName"].ToString();
            drop1.Text = dtbl.Rows[0]["Gender"].ToString();
            drop2.Text = dtbl.Rows[0]["Deceased"].ToString();
            height1.Text = dtbl.Rows[0]["Height"].ToString();
            number.Text = dtbl.Rows[0]["PhoneNo"].ToString();
            email1.Text = dtbl.Rows[0]["EmailAddress"].ToString();
            wEmail1.Text = dtbl.Rows[0]["WorkEmail"].ToString();
            fax1.Text = dtbl.Rows[0]["FaxNo"].ToString();
            Coun.Text = dtbl.Rows[0]["Country"].ToString();
            City1.Text = dtbl.Rows[0]["City"].ToString();
            Address1.Text = dtbl.Rows[0]["Address"].ToString();
            Occupation1.Text = dtbl.Rows[0]["Occupation"].ToString();
            quali.Text = dtbl.Rows[0]["Qualification"].ToString();
            school.Text = dtbl.Rows[0]["College"].ToString();
          //  politics1.Text = dtbl.Rows[0]["PoliticalViews"].ToString();
            languages.Text = dtbl.Rows[0]["SpokenLanguages"].ToString();
            religion.Text = dtbl.Rows[0]["Religion"].ToString();
            Father.Text = dtbl.Rows[0]["Father"].ToString();
            Mother.Text = dtbl.Rows[0]["Mother"].ToString();
            gFather.Text = dtbl.Rows[0]["GrandFather"].ToString();
            gMother.Text = dtbl.Rows[0]["GrandMother"].ToString();
            Son.Text = dtbl.Rows[0]["Son"].ToString();
            Daughter.Text = dtbl.Rows[0]["Daughter"].ToString();
            Siblings.Text = dtbl.Rows[0]["Siblings"].ToString();



            btnSave.Text = "Update";
            

        }

        //protected void btnDelete_Click(object sender, EventArgs e)
        //{
        //    if (sqlCon.State == ConnectionState.Closed)
        //        sqlCon.Open();
        //    SqlCommand sqlCmd = new SqlCommand("MemberDeleteByID", sqlCon);
        //    sqlCmd.CommandType = CommandType.StoredProcedure;
        //    sqlCmd.Parameters.AddWithValue("@MemberID", Convert.ToInt32(HiddenField2.Value));
        //    sqlCmd.ExecuteNonQuery();
        //    sqlCon.Close();
        //    Clear();
        //    lblsuccess.Text = "Event has been Deleted Successfully";
        //}

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            GridView1.Visible = true;
            Button2.Enabled = true;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            GridView1.Visible = false;
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }
        protected void Button6_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
        }

        protected void HiddenField2_ValueChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}