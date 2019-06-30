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
    public partial class View_Requests : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source = openbox.nmmu.ac.za\wrr; Initial Catalog = JN10; Persist Security Info=True;User ID = JN10User; Password=BN5RbR5a");

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            FillGridView();
            
        }
        void FillGridView()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();

            // string getsender = "select RequestSender from Request where EmailAddress ='" + Session["CurEmail"] + "';";
            //  SqlCommand FNAmeCom = new SqlCommand(getsender, con);
            // string FName = FNAmeCom.ExecuteScalar().ToString();


            SqlDataAdapter sqlDa = new SqlDataAdapter("select RequestSender from Request where RequestReceiver ='" + Session["CurEmail"] + "';", con);
            // sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            con.Close();
            GridView1.DataSource = dtbl;
            GridView1.DataBind();
            if (sqlDa.Fill(dtbl) == 0)
                Label1.Text = "No Requests have been sent to you";

        }
        protected void lnkSelect_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SendRequestPermission.aspx");
        }
    }
}