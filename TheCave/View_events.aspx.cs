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
    public partial class View_events : System.Web.UI.Page

    {
        SqlConnection sqlCon = new SqlConnection(@"Data Source = openbox.nmmu.ac.za\wrr; Initial Catalog = JN10; Persist Security Info=True;User ID = JN10User; Password=BN5RbR5a");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CurEmail"] != null)
            {
                if (!IsPostBack)
                {
                    FillGridView();
                    GridView1.Visible = true;

                }
            }
            else
            {
                Response.Redirect("~/Keenan/Login.aspx");
            }
        }

        void FillGridView()
        {
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("EventViewAll", sqlCon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDa.SelectCommand.Parameters.AddWithValue("@TreeID", (int) Session["CurMemberTreeID"]);
            //sqlDa.SelectCommand.Parameters.AddWithValue("@EVENT_ID", (int) Session["CurMemberTreeID"]);
           
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            //sqlCon.Close();
            GridView1.DataSource = dtbl;
            GridView1.DataBind();
            if (sqlDa.Fill(dtbl) == 0)
                Label1.Text = "There are currently no Upcoming Events!";
        }

    }
}