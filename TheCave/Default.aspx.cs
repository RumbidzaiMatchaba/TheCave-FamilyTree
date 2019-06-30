using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;

namespace TheCave
{
    public partial class _Default : Page
    {
        string userFName;
        string userSName;
        string userEmail;
        int userMemberID;
        int userTreeID;
        int userProfileID;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["CurEmail"] != null)
            {
                
            
                userFName = Session["CurFName"].ToString();
                userSName = Session["CurSName"].ToString();
                userEmail = Session["CurEmail"].ToString();
                
                userMemberID = (int)Session["CurMemberID"];
                userTreeID = (int)Session["CurMemberTreeID"];
                userProfileID = (int)Session["ProfileID"];
                CurFirstName.Text = userFName + " " + userSName;
                familynametxt.Text = Session["FamilyName"].ToString(); 
                
                    string cs = ConfigurationManager.ConnectionStrings["JN10ConnectionString"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(cs))
                    {
                    con.Open();
                    Session["UType"] = MemberType(con).ToString();     
                        
                        FillUpcomingEventsView(con);
                        FillShortStatsView(con);
                        //NumberOfMemberstxt.Text = NumberOfMembers(con, userMemberID);
                        con.Close();
                    }
                }
                else
                {
                    Response.Redirect("~/Keenan/Login.aspx");
                }

        }

        //public string NumberOfMembers(SqlConnection con, int memberID)
        //{
        //    SqlCommand cmd = new SqlCommand("QueryNumberOfMembersFromMemberToStatsTable", con);
        //    cmd.CommandType = CommandType.StoredProcedure;

        //    cmd.Parameters.AddWithValue("@MemberID",memberID);

        //    return cmd.ExecuteScalar().ToString();
        //}

        //public int ReturnMemberID(SqlConnection con)
        //{
        //    // Use email address to get the member id.
        //    SqlCommand cmd = new SqlCommand("IDofMember", con);
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    SqlParameter Email = new SqlParameter("@Email", userEmail);
        //    cmd.Parameters.Add(Email);

        //    return (int)cmd.ExecuteScalar();

        //}
        

        // only certain stats should be shown on the default page.
        void FillUpcomingEventsView(SqlConnection sqlCon)
        {
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("UpcomingEvents", sqlCon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDa.SelectCommand.Parameters.AddWithValue("@TreeID", userTreeID);

            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            int events = (int)dtbl.Compute("COUNT(EVENT_NAME)","");
            if(events==0)
            {

                NoEvent.Text = "No upcoming Events";
            }
            else
            {
                GridView7.DataSource = dtbl;
                GridView7.DataBind();
            }
        }

        // only certain stats should be shown on the default page.
        void FillShortStatsView(SqlConnection sqlCon)
        {
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("ViewShortFamilyStats", sqlCon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDa.SelectCommand.Parameters.AddWithValue("@TreeID", userTreeID);

            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);

            GridView6.DataSource = dtbl;
            GridView6.DataBind();

        }

        public string MemberType(SqlConnection con)
        {
            SqlCommand cmda = new SqlCommand("MemberType", con);
            cmda.CommandType = CommandType.StoredProcedure;

            cmda.Parameters.AddWithValue("@MemberID", Convert.ToInt32(Session["CurMemberID"]));

            return cmda.ExecuteScalar().ToString();
        }

        
    }

    
}