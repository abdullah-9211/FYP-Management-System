using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace I200444_I200476_I200689_Project
{
    public partial class SuperMain : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string user = Request.QueryString["username"];
            Heading.Text += (" " + user);

            SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-IUQET19\SQLEXPRESS;Initial Catalog=ProjectDB;Integrated Security=True");
            string query ="SELECT [PROJECT],[MEMBER] FROM [PROJECT GROUP] WHERE [PROJECT] IN (SELECT [Title] FROM [PROJECT] WHERE [Supervisor] = '" + user + "' OR [Co-Supervisor] = '" + user + "' AND [IsActive] = 1);";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            ProjectGrid.DataSource = rdr;
            ProjectGrid.DataBind();
            rdr.Close();
            query = "SELECT [Title],[Eval Panel] FROM [PROJECT] WHERE [Supervisor] = '" + user + "' OR [Co-Supervisor] = '" + user + "';";
            cmd = new SqlCommand(query, con);
            rdr = cmd.ExecuteReader();
            PanelGrid.DataSource = rdr;
            PanelGrid.DataBind();
            rdr.Close();
            query = "SELECT [Project],[Deadline Date],[Deadline Time] FROM [ASSIGNED WORK] WHERE [Project] IN (SELECT [Title] FROM [PROJECT] WHERE [Supervisor] = '" + user + "' OR [Co-Supervisor] = '" + user + "');";
            cmd = new SqlCommand(query, con);
            rdr = cmd.ExecuteReader();
            DeadGrid.DataSource = rdr;
            DeadGrid.DataBind();
            rdr.Close();
        }
        protected void MovetoHome(object sender, EventArgs e)
        {
            string user = Request.QueryString["username"];
            Response.Redirect("SuperMain.aspx?username=" + user);
        }
        protected void MovetoNot(object sender, EventArgs e)
        {
            string user = Request.QueryString["username"];
            Response.Redirect("SuperNots.aspx?username=" + user);
        }
    }
}