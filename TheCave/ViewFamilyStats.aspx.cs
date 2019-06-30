using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
namespace TheCave
{
    public partial class ViewFamilyStats : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CurEmail"] != null)
            {
                string cs = ConfigurationManager.ConnectionStrings["JN10ConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    FillStatsView(con);
                }
            }
            else
            {
                Response.Redirect("~/Keenan/Login.aspx");
            }
        }

        void FillStatsView(SqlConnection sqlCon)
        {
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("ViewFamilyStats", sqlCon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDa.SelectCommand.Parameters.AddWithValue("@TreeID", Session["CurMemberTreeID"]);

            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);

            GridView10.DataSource = dtbl;
            GridView10.DataBind();

        }
    }
}