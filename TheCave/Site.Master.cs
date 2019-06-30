using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheCave
{
    public partial class SiteMaster : MasterPage
    {
        string userFName;
        string userEmail;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CurEmail"] != null)
            {
                userEmail = Session["CurEmail"].ToString();
                userFName = Session["CurFName"].ToString();
                CurrentUserName.Text = userEmail;
            }
            else
            {
                Response.Redirect("~/Keenan/Login.aspx");
            }
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Keenan/WebHomepage.aspx");
        }
    }
}