using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;



namespace TheCave
{
    public partial class A1600_Notifications : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source = openbox.nmmu.ac.za\wrr; Initial Catalog = JN10; Persist Security Info=True;User ID = JN10User; Password=BN5RbR5a");
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    MailMessage msg = new MailMessage();
        //    msg.From = new MailAddress("thecavetree@gmail.com");
        //    msg.To.Add(TextBox1.Text);
        //    msg.Subject = TextBox2.Text;
        //    msg.Body = string.Format("New Notification! Hey There. A new event has been added to your family cave. Logon to find out MORE!  <a href ='http://localhost:53194/View_events'> The Cave Events </a>", HttpContext.Current.Request.Url.Host);
        //    //" ";



        //    msg.IsBodyHtml = true;
        //    SmtpClient smt = new SmtpClient();
        //    smt.Host = "smtp.gmail.com";
        //    System.Net.NetworkCredential ntwd = new NetworkCredential();
        //    ntwd.UserName = "thecavetree@gmail.com"; //Your Email ID  
        //    ntwd.Password = "Thecavetree123#"; // Your Password  
        //    smt.UseDefaultCredentials = true;
        //    smt.Credentials = ntwd;
        //    smt.Port = 587;
        //    smt.EnableSsl = true;
        //    smt.Send(msg);
        //    lbmsg.Text = "Notification Sent Successfully";
        //    lbmsg.ForeColor = System.Drawing.Color.ForestGreen;

        //}

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlCommand sqlCmd = new SqlCommand("spAddNoti", con);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            //  sqlCmd.Parameters.AddWithValue("@EVENT_ID", (HiddenField1.Value == "" ? 0 : Convert.ToInt32(HiddenField1.Value)));
            // sqlCmd.Parameters.AddWithValue("@RequestSender", txtName.Text.Trim());
            string FirstNameQuery = "select FName from Member where EmailAddress ='" + Session["CurEmail"] + "';";
            string LastNameQuery = "select LName from Member where EmailAddress ='" + Session["CurEmail"] + "';";
            SqlCommand FNAmeCom = new SqlCommand(FirstNameQuery, con);
            string FName = FNAmeCom.ExecuteScalar().ToString();

            SqlCommand LNAmeCom = new SqlCommand(LastNameQuery, con);
            string LName = LNAmeCom.ExecuteScalar().ToString();


            MailMessage msg = new MailMessage();
            msg.From = new MailAddress("thecavetree@gmail.com");
            msg.To.Add(TextBox1.Text);
            msg.Subject = "Upcoming Annivesary Added to The  "+ LName + " Family!";

            msg.Body = string.Format(" Hello!  " + FName + " " + LName + "  has added a new anniversary to your CAVE family tree. Please click on the link to visit the 'The Cave' Events Page :)  <a href='http://localhost:53194/Keenan/Login'> The Cave </a>   Regards The Cave Team!", HttpContext.Current.Request.Url.Host);

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



            sqlCmd.Parameters.AddWithValue("@Sender_Name", FName); //good
            sqlCmd.Parameters.AddWithValue("@Receiver_Name", TextBox3.Text.Trim()); //good
            sqlCmd.Parameters.AddWithValue("@Receiver_EmailAddress", TextBox1.Text.Trim());//good
            sqlCmd.Parameters.AddWithValue("@Not_des", TextBox2.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@MemberID", ReturnMemberID(con)); //good
            // sqlCmd.Parameters.AddWithValue("@Accept", Accept.Text.Trim());

            sqlCmd.ExecuteNonQuery();

            con.Close();
            if (Page.IsValid)
            {
                lblStatus.ForeColor = System.Drawing.Color.Green;
                lblStatus.Text = "Email Sent";
            }
            else
            {
                lblStatus.ForeColor = System.Drawing.Color.Red;
                lblStatus.Text = "Email not sent! Please enter the required information above!";
            }

        }

        public int ReturnMemberID(SqlConnection con)
        {
            SqlCommand cmd = new SqlCommand("IDofMember", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter Email = new SqlParameter("@Email", Session["CurEmail"]);
            cmd.Parameters.Add(Email);

            return (int)cmd.ExecuteScalar();

        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            TextBox3.Text = "";
            TextBox1.Text = "";
            TextBox2.Text = "";
        }
    }

}