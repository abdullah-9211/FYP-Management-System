using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace I200444_I200476_I200689_Project
{
    public partial class PanelMain : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string user = Request.QueryString["username"];
            Heading.Text += (" " + user);

            SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-IUQET19\SQLEXPRESS;Initial Catalog=ProjectDB;Integrated Security=True");
            string query = "SELECT [Panel] FROM [PANEL MEMBER] WHERE [Member] = '" + user + "';";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            rdr.Read();
            string temp = rdr[0].ToString();
            PanelID.Text += ("" + temp);
            rdr.Close();

            query = "SELECT [Member] FROM [PANEL MEMBER] WHERE [Panel] = " + temp + " AND [Member] != '" + user + "';";
            cmd = new SqlCommand(query, con);
            rdr = cmd.ExecuteReader();

            MemberGrid.DataSource = rdr;
            MemberGrid.DataBind();

            rdr.Close();

            query = "SELECT [Title] FROM [PANEL MEMBER] INNER JOIN [PROJECT] ON [PANEL MEMBER].[Panel] = [PROJECT].[Eval Panel] WHERE [Member] = '" + user + "';";
            cmd = new SqlCommand(query, con);
            rdr = cmd.ExecuteReader();

            ProjectGrid.DataSource = rdr;
            ProjectGrid.DataBind();


            rdr.Close();

            query = "SELECT [Project] FROM [EVALUATION] WHERE [Panel Member] = '" + user + "';";
            cmd = new SqlCommand(query, con);
            rdr = cmd.ExecuteReader();

            DoneEval.DataSource = rdr;
            DoneEval.DataBind();

            rdr.Close();

            query = "SELECT [Title] FROM [PANEL MEMBER] INNER JOIN [PROJECT] ON [PANEL MEMBER].[Panel] = [PROJECT].[Eval Panel] WHERE [Member] = '" + user + "' AND [Title] NOT IN (SELECT [Project] FROM [EVALUATION] WHERE [Panel Member] = '" + user + "');";
            cmd = new SqlCommand(query, con);
            rdr = cmd.ExecuteReader();

            NoEval.DataSource = rdr;
            NoEval.DataBind();


            rdr.Close();

        }
        protected void MovetoEval(object sender, EventArgs e)
        {
            string user = Request.QueryString["username"];
            Response.Redirect("Evaluation.aspx?username=" + user);
        }
        protected void MovetoHome(object sender, EventArgs e)
        {
            string user = Request.QueryString["username"];
            Response.Redirect("PanelMain.aspx?username=" + user);
        }
    }
}