using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace I200444_I200476_I200689_Project
{
    public partial class StudentMain : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string user = Request.QueryString["username"];
            Heading.Text += (" " + user);
            SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-IUQET19\SQLEXPRESS;Initial Catalog=ProjectDB;Integrated Security=True");
            string query = "SELECT [Project],[Work Description],[Deadline Date],[Deadline Time] FROM [ASSIGNED WORK] WHERE [Project] = (SELECT [Project] FROM [Project Group] WHERE [Member] = '" + user + "');";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();

            ProjectGrid.DataSource = rdr;
            ProjectGrid.DataBind();
            rdr.Close();

            query = "SELECT [Member] FROM [PROJECT GROUP] WHERE [Project] = (SELECT [Project] FROM [Project Group] WHERE [Member] = '" + user + "');";
            cmd = new SqlCommand(query, con);
            rdr = cmd.ExecuteReader();

            GroupMembers.DataSource = rdr;
            GroupMembers.DataBind();
            rdr.Close();

            query = "SELECT [First Name],[Last Name] FROM [USER] WHERE [Username] = (SELECT [Supervisor] FROM [PROJECT] WHERE [Title] = (SELECT [Project] FROM [Project Group] WHERE [Member] = '" + user + "'));";
            cmd = new SqlCommand(query, con);
            rdr = cmd.ExecuteReader();
            rdr.Read();
            string temp1 = rdr[0].ToString();
            string temp2 = rdr[1].ToString();
            Supername.Text += "   " + temp1 + "  " + temp2;
            rdr.Close();

            query = "SELECT [First Name],[Last Name] FROM [USER] WHERE [Username] = (SELECT [Co-Supervisor] FROM [PROJECT] WHERE [Title] = (SELECT [Project] FROM [Project Group] WHERE [Member] = '" + user + "'));";
            cmd = new SqlCommand(query, con);
            rdr = cmd.ExecuteReader();
            rdr.Read();
            temp1 = rdr[0].ToString();
            temp2 = rdr[1].ToString();
            CoSupername.Text += "   " + temp1 + "  " + temp2;
            rdr.Close();

            query = "SELECT [Eval Panel] FROM [PROJECT] WHERE [Title] = (SELECT [Project] FROM [Project Group] WHERE [Member] = '" + user + "');";
            cmd = new SqlCommand(query, con);
            rdr = cmd.ExecuteReader();
            rdr.Read();
            Panel.Text += "   " + rdr[0].ToString();
            rdr.Close();

            query = "SELECT [Evaluation],[Suggestion] FROM [EVALUATION] WHERE [Project] = (SELECT [Project] FROM [Project Group] WHERE [Member] = '" + user + "');";
            cmd = new SqlCommand(query, con);
            rdr = cmd.ExecuteReader();

            ReviewGrid.DataSource = rdr;
            ReviewGrid.DataBind();
            rdr.Close();

        }
        protected void MovetoHome(object sender, EventArgs e)
        {
            string user = Request.QueryString["username"];
            Response.Redirect("StudentMain.aspx?username=" + user);
        }
    }
}