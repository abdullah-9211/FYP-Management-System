using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace I200444_I200476_I200689_Project
{
    public partial class AddProject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Register_Project(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-IUQET19\SQLEXPRESS;Initial Catalog=ProjectDB;Integrated Security=True");
            string ptitle = TB1.Text;
            string super = TB2.Text;
            string co_super = TB3.Text;
            string pid = TB4.Text;
            string curr_date = DateTime.Now.ToString("yyyy-MM-dd");
            string time = DateTime.Now.ToString("HH:mm:ss tt");
            string curr_user = Request.QueryString["username"];
            string Query = "INSERT INTO [PROJECT] VALUES('" + ptitle + "', '" + super + "', '" + co_super + "', " + pid + ", 1);";
            SqlCommand cmd = new SqlCommand(Query, con);
            con.Open();
            int check = cmd.ExecuteNonQuery();
            if (check != 0)
            {
                Query = "INSERT INTO [AUDIT TRAIL] VALUES('" + curr_user + "', CONVERT(DATE,'" + curr_date + "'), CONVERT(TIME, '" + time + "'), 'Added Project \"" + ptitle + "\"');";
                cmd = new SqlCommand(Query, con);
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Data Inserted Successfully :)')</script>");
                TB1.Text = string.Empty;
                TB2.Text = string.Empty;
                TB3.Text = string.Empty;
                TB4.Text = string.Empty;
            }
            else
                Response.Write("<script>alert('Couldn't insert data :(')</script>");
            con.Close();
        }
        protected void MovetoHome(object sender, EventArgs e)
        {
            string user = Request.QueryString["username"];
            Response.Redirect("CommitteeMain.aspx?username=" + user);
        }
        protected void MovetoDeadline(object sender, EventArgs e)
        {
            string user = Request.QueryString["username"];
            Response.Redirect("Deadline.aspx?username=" + user);
        }
        protected void MovetoProject(object sender, EventArgs e)
        {
            string user = Request.QueryString["username"];
            Response.Redirect("AddProject.aspx?username=" + user);
        }
        protected void MovetoSignup(object sender, EventArgs e)
        {
            string user = Request.QueryString["username"];
            Response.Redirect("SignUp.aspx?username=" + user);
        }
        protected void MovetoNot(object sender, EventArgs e)
        {
            string user = Request.QueryString["username"];
            Response.Redirect("NotSender.aspx?username=" + user);
        }
    }
}