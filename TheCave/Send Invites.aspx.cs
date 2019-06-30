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
    public partial class Send_Invites : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source = openbox.nmmu.ac.za\wrr; Initial Catalog = JN10; Persist Security Info=True;User ID = JN10User; Password=BN5RbR5a");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Send_Click(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlCommand sqlCmd = new SqlCommand("spAddInvites", con);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            //  sqlCmd.Parameters.AddWithValue("@EVENT_ID", (HiddenField1.Value == "" ? 0 : Convert.ToInt32(HiddenField1.Value)));
            // sqlCmd.Parameters.AddWithValue("@RequestSender", txtName.Text.Trim());
            string FirstNameQuery = "select FName from Member where EmailAddress ='" + Session["CurEmail"] + "';";
            string LastNameQuery = "select LName from Member where EmailAddress ='" + Session["CurEmail"] + "';";


            int treeid = (int)Session["CurMemberTreeID"];



            SqlCommand FNAmeCom = new SqlCommand(FirstNameQuery, con);
            string FName = FNAmeCom.ExecuteScalar().ToString();

            SqlCommand LNAmeCom = new SqlCommand(LastNameQuery, con);
            string LName = LNAmeCom.ExecuteScalar().ToString();


            MailMessage msg = new MailMessage();
            msg.From = new MailAddress("thecavetree@gmail.com");
            msg.To.Add(To.Text);
            msg.Subject = "Invitation to 'The Cave' Family Tree";

             msg.Body = string.Format(" Hello! " + FName + " " + LName + " is inviting you to check out the The CAVE family tree. Please click on the link to visit the The Cave Home Page  <a href = 'http://localhost:53194/Keenan/Login'> The Cave </a>", HttpContext.Current.Request.Url.Host);
           // http://localhost:53194/Keenan/Login
           // msg.Body = string.Format("Hello! " + FName + " " + LName + "  is inviting you to join an existing Family Tree through The Cave Website. Use the following Tree ID:'" + treeid + "' to join the  " + LName + "  Family   <a href='http://localhost:53194/View%20Relative%20Profile'> The Cave </a>", HttpContext.Current.Request.Url.Host);//fix this link

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
            lblStatus.Text = "Email Sent!";


            sqlCmd.Parameters.AddWithValue("@Sender_Name", FName); //good
            sqlCmd.Parameters.AddWithValue("@Receiver_Name", ReceiverName.Text.Trim()); //good
            sqlCmd.Parameters.AddWithValue("@Receiver_EmailAddress", To.Text.Trim());//good
            sqlCmd.Parameters.AddWithValue("@MemberID", ReturnMemberID(con)); //good
            // sqlCmd.Parameters.AddWithValue("@Accept", Accept.Text.Trim());

            sqlCmd.ExecuteNonQuery();

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

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            //if(!IsPostBack)
            //{
            ReceiverName.Text = "";
            To.Text = "";
            //     lblStatus.Text = "";
            // }

        }

    }
}