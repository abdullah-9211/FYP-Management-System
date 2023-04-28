using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace I200444_I200476_I200689_Project
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Login_Press(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-IUQET19\SQLEXPRESS;Initial Catalog=ProjectDB;Integrated Security=True");
            con.Open();
            string user = TB1.Text;
            string pass = TB2.Text;
            string curr_date = DateTime.Now.ToString("yyyy-MM-dd");
            string time = DateTime.Now.ToString("HH:mm:ss tt");
            SqlDataReader rdr;
            string query = "SELECT * FROM [USER] WHERE [Username] = '" + user + "' AND [Password] = '" + pass + "';";
            SqlCommand cmd = new SqlCommand(query, con);
            rdr = cmd.ExecuteReader();
            string temp = "";
            while (rdr.Read())
                temp = rdr[5].ToString();
            if (temp != "")
            {
                rdr.Close();
                query = "INSERT INTO [AUDIT TRAIL] VALUES('" + user + "', CONVERT(DATE,'" + curr_date + "'), CONVERT(TIME, '" + time + "'), 'Logged in');";
                cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                if (temp == "FYP Committee")
                {
                    Response.Write("<script>alert('Login Successful :)')</script>");
                    Response.Redirect("CommitteeMain.aspx?username=" + user);
                }
                if (temp == "Student")
                {
                    Response.Write("<script>alert('Login Successful :)')</script>");
                    Response.Redirect("StudentMain.aspx?username=" + user);
                }
                if (temp == "Panel Member")
                {
                    Response.Write("<script>alert('Login Successful :)')</script>");
                    Response.Redirect("PanelMain.aspx?username=" + user);
                }
                if (temp == "Supervisor")
                {
                    Response.Write("<script>alert('Login Successful :)')</script>");
                    Response.Redirect("SuperMain.aspx?username=" + user);
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Login!')</script>");
                TB1.Text = string.Empty;
                TB2.Text = string.Empty;
            }
            con.Close();

        }
    }
}