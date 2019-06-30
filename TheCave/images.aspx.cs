using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;

namespace TheCave
{
    public partial class images : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void show_data()
        {
            DirectoryInfo d = new DirectoryInfo(MapPath("~/data/"));
            FileInfo[] r = d.GetFiles();
            DataTable dt = new DataTable();
            dt.Columns.Add("path");
            for (int i = 0; i < r.Length; i++)
            {
                DataRow row = dt.NewRow();
                row["path"] = "~/data/" + r[i].Name;
                dt.Rows.Add(row);
            }
            //DataList1.DataSource = dt;
            DataList1.DataBind();
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=openbox.nmmu.ac.za\wrr;Initial Catalog=JN10;Persist Security Info=True;User ID=JN10User;Password=BN5RbR5a");
            string path = Server.MapPath("data/");
            if (FileUpload1.HasFile)
            {
                string ext = Path.GetExtension(FileUpload1.FileName);
                if (ext == ".jpg" || ext == ".png"|| ext == ".PNG"|| ext == ".JPG")
                {
                    FileUpload1.SaveAs(path + FileUpload1.FileName);
                    string name = "data/" + FileUpload1.FileName;
                    string ss = "insert into ProfilePhoto (Caption, Description, Image, ProfileID) values ('" + TextBox2.Text + "', '" + TextBox3.Text + "', '" + name + "' , '" +(int)Session["CurMemberID"]+ "' )";

                    SqlCommand cmd = new SqlCommand(ss, con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    Literal1.Text = "Your image has been successfully saved";
                    Literal1.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    Literal1.Text = "You have to upload jpg or png file only";
                }
            }
            else
            {
                Literal1.Text = "Please Select File";
            }
            if (FileUpload1.HasFile)
            {
                //string path = "~/data/" + Guid.NewGuid().ToString() + "" + Path.GetExtension(FileUpload1.FileName);
                //FileUpload1.SaveAs(MapPath(path));
                //Response.Write("Save Successful");
                show_data();
            }
            clear();
        }
        public void clear()
        {
            TextBox2.Text = "";
            TextBox3.Text = "";
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

       
    }
}