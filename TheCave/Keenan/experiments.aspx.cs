using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


namespace TheCave
{
    public partial class experiments : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            
                           con = new SqlConnection(@"Data Source=openbox.nmmu.ac.za\wrr;Initial Catalog=JN10;Persist Security Info=True;User ID=JN10User;Password=BN5RbR5a");
        }

        protected void SearchTreeID_Click(object sender, EventArgs e)
        {
            DoesFamilyExist(con);
        }

        public void DoesFamilyExist(SqlConnection con)
        {
            // check if person is typing a valid TreeID
            SqlCommand cmd = new SqlCommand("FindExistingTreeID", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TreeID", Convert.ToInt32(TreeIDtxt.Text));
            con.Open();
            ErrorLabel1.Text = TreeIDtxt.Text;
            int ReturnCode = (int)cmd.ExecuteScalar();
            if (ReturnCode == -1)
            {
                ErrorLabel1.Text = "Invalid TreeID, make sure you entered the correct TreeID.";
            }
            else
            {

                ErrorLabel1.Text = "TreeID Accepted";
            }
            con.Close();
        }
    }
}