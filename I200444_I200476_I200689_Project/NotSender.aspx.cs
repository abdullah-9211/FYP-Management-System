using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace I200444_I200476_I200689_Project
{
    public partial class NotSender : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void SendNot(object sender, EventArgs e)
        {
            string rec = TB1.Text;
            string mess = TB2.Text;
            string curr_date = DateTime.Now.ToString("yyyy-MM-dd");
            string curr_time = DateTime.Now.ToString("HH:mm:ss tt");
            string curr_user = Request.QueryString["username"];
            SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-IUQET19\SQLEXPRESS;Initial Catalog=ProjectDB;Integrated Security=True");
            string query = "INSERT INTO [NOTIFICATION] VALUES('" + rec + "', CONVERT(DATE,'" + curr_date + "'), CONVERT(TIME, '" + curr_time + "'), '" + mess + "');";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            int check = cmd.ExecuteNonQuery();
            if (check != 0)
            {
                query = "INSERT INTO [AUDIT TRAIL] VALUES('" + curr_user + "', CONVERT(DATE,'" + curr_date + "'), CONVERT(TIME, '" + curr_time + "'), 'Sent Notification to Supervisor " + rec + "');";
                cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Notification sent Successfully :)')</script>");
                TB1.Text = string.Empty;
                TB2.Text = string.Empty;
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