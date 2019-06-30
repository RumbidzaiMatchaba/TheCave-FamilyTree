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
    public partial class SendRequest : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source = openbox.nmmu.ac.za\wrr; Initial Catalog = JN10; Persist Security Info=True;User ID = JN10User; Password=BN5RbR5a");

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Send_Click(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlCommand sqlCmd = new SqlCommand("SaveRequest", con);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            //  sqlCmd.Parameters.AddWithValue("@EVENT_ID", (HiddenField1.Value == "" ? 0 : Convert.ToInt32(HiddenField1.Value)));
            // sqlCmd.Parameters.AddWithValue("@RequestSender", txtName.Text.Trim());
            string FirstNameQuery = "select FName from Member where EmailAddress ='" + Session["CurEmail"] + "';";
            SqlCommand FNAmeCom = new SqlCommand(FirstNameQuery, con);
            string FName = FNAmeCom.ExecuteScalar().ToString();

            string LastNameQuery = "select LName from Member where EmailAddress ='" + Session["CurEmail"] + "';";
            SqlCommand LNAmeCom = new SqlCommand(LastNameQuery, con);
            string LName = LNAmeCom.ExecuteScalar().ToString();


            MailMessage msg = new MailMessage();
            msg.From = new MailAddress("thecavetree@gmail.com");
            msg.To.Add(To.Text);
            msg.Subject = "Request To View Private Section of our profile";

            msg.Body = string.Format("Hello! <b>" + FName + " " + LName + " </b> has sent you a request to view the private section of your profile. Please click on the link to accept or deny the request  <a href = 'http://localhost:53194/Keenan/Login'> The Cave </a>", HttpContext.Current.Request.Url.Host);//fix this link
            msg.IsBodyHtml = true;
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
            //String sender;
            //sender = "thecavetree@gmail.com";
            //  string sender  = ntwd.UserName;

            // // fix this

            sqlCmd.Parameters.AddWithValue("@RequestSender", FName);

            sqlCmd.Parameters.AddWithValue("@RequestReceiver", To.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@MemberID", ReturnMemberID(con));
            // sqlCmd.Parameters.AddWithValue("@Accept", Accept.Text.Trim());

            sqlCmd.ExecuteNonQuery();
            // String EventID = HiddenField1.Value;
            con.Close();
        }
        public int ReturnMemberID(SqlConnection con)
        {
            SqlCommand cmd = new SqlCommand("IDofMember", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter Email = new SqlParameter("@Email", Session["CurEmail"]);
            cmd.Parameters.Add(Email);

            return (int)cmd.ExecuteScalar();

        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            To.Text = " ";
        }
    }
}