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
    public partial class A1500_eventss2 : System.Web.UI.Page
    {

        SqlConnection sqlCon = new SqlConnection(@"Data Source = openbox.nmmu.ac.za\wrr; Initial Catalog = JN10; Persist Security Info=True;User ID = JN10User; Password=BN5RbR5a");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CurEmail"] != null)
            {
                if (!IsPostBack)
                {
                    btnDelete.Enabled = false;
                    FillGridView();
                    lblsuccess.Visible = false;
                    lblerror.Visible = false;
                    GridView1.Visible = false;
                }
            }
            else
            {
                Response.Redirect("~/Keenan/Login.aspx");
            }

        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }

        public void Clear()
        {
            HiddenField1.Value = "";
            txtName.Text = txtDate.Text = txtPlace.Text = txtDes.Text = "";
            lblsuccess.Text = lblerror.Text = "";
            btnSave.Text = "Save";
            btnDelete.Enabled = false;

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();

            int MemID = ReturnMemberID(sqlCon);

            if (btnSave.Text == "Save")
            {
                SqlCommand sqlCmd = new SqlCommand("CreateNewEvent", sqlCon);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                //sqlCmd.Parameters.AddWithValue("@EVENT_ID", (HiddenField1.Value == "" ? 0 : Convert.ToInt32(HiddenField1.Value)));
                sqlCmd.Parameters.AddWithValue("@EVENT_NAME", txtName.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@EVENT_TIME", txtDate.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@EVENT_PLACE", txtPlace.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@Description", txtDes.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@MemberID", MemID);
                int ReturnCode = (int)sqlCmd.ExecuteScalar();
                if (ReturnCode == -1)
                {
                    // This member already created this event before.
                    lblsuccess.Text = "You already saved this event.";
                }
                else
                {
                    lblerror.Text = "Event Saved Successfully";
                }
                //String EventID = HiddenField1.Value;
            }
            else
            {
                // call code to update the event that has been loaded into view.


                SqlCommand sqlCmd = new SqlCommand("EventUpdate", sqlCon);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.AddWithValue("@EVENT_ID", (HiddenField1.Value == "" ? 0 : Convert.ToInt32(HiddenField1.Value)));
                sqlCmd.Parameters.AddWithValue("@EVENT_NAME", txtName.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@EVENT_TIME", txtDate.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@EVENT_PLACE", txtPlace.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@Description", txtDes.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@MemberID", MemID);
                int ReturnCode = (int)sqlCmd.ExecuteScalar();

                lblsuccess.Text = "Update Saved Successfully.";
            }

            Clear();
            lblsuccess.ForeColor = System.Drawing.Color.Green;
            lblerror.Text = "Event Saved Successfully";
            FillGridView();


            sqlCon.Close();

        }

        public int ReturnMemberID(SqlConnection sqlCon)
        {
            SqlCommand sqlCmd = new SqlCommand("IDofMember", sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            SqlParameter MemberID = new SqlParameter("@Email", Session["CurEmail"]);
            sqlCmd.Parameters.Add(MemberID);
            return (int)sqlCmd.ExecuteScalar();
        }
        void FillGridView()
        {
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("EventViewAll", sqlCon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDa.SelectCommand.Parameters.AddWithValue("@TreeID", (int)Session["CurMemberTreeID"]);
            //sqlDa.SelectCommand.Parameters.AddWithValue("@EVENT_ID", (int)Session["CurMemberTreeID"]);
            
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
           // sqlCon.Close();
            GridView1.DataSource = dtbl;
            GridView1.DataBind();

        }

        protected void lnk_OnClick(object sender, EventArgs e)
        {
            int EVENTID = Convert.ToInt32((sender as LinkButton).CommandArgument.Trim());
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("EventViewByID", sqlCon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDa.SelectCommand.Parameters.AddWithValue("@EVENT_ID", EVENTID);

            //sqlDa.SelectCommand.Parameters.AddWithValue("@MemberID", ReturnMemberID((sqlCon)));
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            sqlCon.Close();
            HiddenField1.Value = EVENTID.ToString();
            txtName.Text = dtbl.Rows[0]["EVENT_NAME"].ToString();
            txtDate.Text = dtbl.Rows[0]["EVENT_TIME"].ToString();
            txtPlace.Text = dtbl.Rows[0]["EVENT_PLACE"].ToString();
            txtDes.Text = dtbl.Rows[0]["EVENT_DESCRIPTION"].ToString();
            btnSave.Text = "Update";
            btnDelete.Enabled = true;

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlCommand sqlCmd = new SqlCommand("EventDeleteByID", sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@EVENT_ID", Convert.ToInt32(HiddenField1.Value));
            sqlCmd.ExecuteNonQuery();
            sqlCon.Close();
            Clear();
            lblsuccess.Text = "Event has been Deleted Successfully";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            GridView1.Visible = true;
            
        }
    }
}