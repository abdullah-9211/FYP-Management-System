using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace I200444_I200476_I200689_Project
{
    public partial class SignUp1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Create_Press(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-IUQET19\SQLEXPRESS;Initial Catalog=ProjectDB;Integrated Security=True");
            string user = TB3.Text;
            string pass = TB4.Text;
            string fname = TB1.Text;
            string lname = TB2.Text;
            string curr_date = DateTime.Now.ToString("yyyy-MM-dd");
            string time = DateTime.Now.ToString("HH:mm:ss tt");
            string curr_user = Request.QueryString["username"];
            string Query = "INSERT INTO [USER] VALUES('" + user + "', '" + pass + "', '" + fname + "', '" + lname + "', 'Faculty', 'FYP Committee');";
            SqlCommand cmd = new SqlCommand(Query, con);
            con.Open();
            int check = cmd.ExecuteNonQuery();
            if(check != 0)
            {
                Query = "INSERT INTO [AUDIT TRAIL] VALUES('" + curr_user + "', CONVERT(DATE,'" + curr_date + "'), CONVERT(TIME, '" + time + "'), 'Added " + fname + " " + lname + "s Committee Account');";
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
    }
}