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
    public partial class ViewRelativePrivateProfile : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source = openbox.nmmu.ac.za\wrr; Initial Catalog = JN10; Persist Security Info=True;User ID = JN10User; Password=BN5RbR5a");

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            FillGridView();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SendRequest.aspx");
        }
        void FillGridView()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();

            SqlCommand cmd = new SqlCommand("spcheckPrivateProfile", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter Email = new SqlParameter("@EmailAddress", txtUserName.Text);
            SqlParameter Password = new SqlParameter("@Password", txtPassword.Text);

            cmd.Parameters.Add(Email);
            cmd.Parameters.Add(Password);

            // con.Open();
            int ReturnCode = (int)cmd.ExecuteScalar();
            if (ReturnCode == 1)
            {
              //  string comd = " Select * from Member where EmailAddress = '" + txtUserName.Text + "'";
                // SqlCommand dab = new SqlCommand(comd, con);
               // SqlDataAdapter adapt = new SqlDataAdapter(comd, con);
               // adapt.SelectCommand.CommandType = CommandType.Text;
                SqlDataAdapter sqlDa = new SqlDataAdapter("spgetPrivateInfor", con);
                sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;


                sqlDa.SelectCommand.Parameters.AddWithValue("@EmailAddress", txtUserName.Text);
                DataTable dtbl = new DataTable();
                DataTable table = new DataTable();
                sqlDa.Fill(table);
                con.Close();
                DetailsView1.DataSource = table;
                DetailsView1.DataBind();
                Label4.Text = " ";




                
               
            }
            else
            {
                Label4.Text = " Incorrect Username or Password! Try Again !";
            }




        }
    }
}