using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace TheCave
{
    public partial class ViewRelativeProfile : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source = openbox.nmmu.ac.za\wrr; Initial Catalog = JN10; Persist Security Info=True;User ID = JN10User; Password=BN5RbR5a");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CurEmail"] != null)
            {
                if (!IsPostBack)
                {
                    FillGridView((int)Session["CurMemberTreeID"]);
                }
            }
            else
            {
                Response.Redirect("~/Keenan/Login.aspx");
            }
        }
        protected void lnk_OnClick(object sender, EventArgs e)
        {
            int MemberID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("spViewMemberbyID ", con);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDa.SelectCommand.Parameters.AddWithValue("@MemberID", MemberID);
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            con.Close();
            HiddenField1.Value = MemberID.ToString();
            //  txtName.Text = dtbl.Rows[0]["FName"].ToString();
            LblName.Text = dtbl.Rows[0]["FName"].ToString();
            lblSurname.Text = dtbl.Rows[0]["LName"].ToString();
            lblGender.Text = dtbl.Rows[0]["Gender"].ToString();
            lblDOB.Text = dtbl.Rows[0]["DOB"].ToString();
            lblEmailAddress.Text = dtbl.Rows[0]["EmailAddress"].ToString();
            lblOccupation.Text = dtbl.Rows[0]["Occupation"].ToString();




        }
        void FillGridView(int tree)
        {
            //    //if (con.State == ConnectionState.Closed)
            //    //    con.Open();
            //    //SqlDataAdapter sqlDa = new SqlDataAdapter("spgetRelativeDetails", con);
            //    //sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            //    //DataTable dtbl = new DataTable();
            //    //sqlDa.Fill(dtbl);
            //    //con.Close();
            //    //GridView1.DataSource = dtbl;
            //    //GridView1.DataBind();
            //    //  userTreeID = (int)Session["CurMemberDI"];
            //    //  userTreeID = (int)Session["CurMemberTreeID"];
            //    //int treeid = (int)Session["CurMemberTreeID"];


            if (con.State == ConnectionState.Closed)
                con.Open();




            SqlDataAdapter sqlDa = new SqlDataAdapter("spgetRelativeDetails", con);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;


            sqlDa.SelectCommand.Parameters.AddWithValue("@TreeID", tree);
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            con.Close();
            GridView1.DataSource = dtbl;
            GridView1.DataBind();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ViewRelativePrivateProfile.aspx");
        }



    }
}