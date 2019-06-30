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
    public partial class SendRequestPermission : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source = openbox.nmmu.ac.za\wrr; Initial Catalog = JN10; Persist Security Info=True;User ID = JN10User; Password=BN5RbR5a");

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Closed)
                con.Open();

            string FirstNameQuery = "select FName from Member where EmailAddress ='" + Session["CurEmail"] + "';";
            string LastNameQuery = "select LName from Member where EmailAddress ='" + Session["CurEmail"] + "';";
            string PasswordQuery = "select Password from Member where EmailAddress ='" + Session["CurEmail"] + "';";

            SqlCommand FNAmeCom = new SqlCommand(FirstNameQuery, con);
            string FName = FNAmeCom.ExecuteScalar().ToString();

            SqlCommand LNAmeCom = new SqlCommand(LastNameQuery, con);
            string LName = LNAmeCom.ExecuteScalar().ToString();

            SqlCommand PasswordCom = new SqlCommand(PasswordQuery, con);
            string Password = PasswordCom.ExecuteScalar().ToString();

            string email = "'" + Session["CurEmail"] + "'";


            MailMessage msg = new MailMessage();
            msg.From = new MailAddress("thecavetree@gmail.com");
            if (To.Text != "")
            {
                msg.To.Add(To.Text);
                msg.Subject = "Access Details to view " + FName + " " + LName + "'s private section";

                msg.Body = string.Format(" Hello! " + FName + " " + LName + " has given you access to view thier private section. Use the following details to access their Private Section: Username: " + email + " Password: " + Password + "");

                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                System.Net.NetworkCredential ntwd = new NetworkCredential();
                ntwd.UserName = "thecavetree@gmail.com"; //Your Email ID  
                ntwd.Password = "Thecavetree123#"; // Your Password  
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = ntwd;
                smtp.Port = 587;
                smtp.EnableSsl = true;



                smtp.Send(msg);
                Label2.Text = "Email Sent!";
            }
            else
            {
                Label2.ForeColor = System.Drawing.Color.Red;
                
                Label2.Text = "Email address required.";
            }
        }
        protected void Cancel_Click(object sender, EventArgs e)
        {
            To.Text = " ";
            Label2.Text = " ";
        }
    }
}