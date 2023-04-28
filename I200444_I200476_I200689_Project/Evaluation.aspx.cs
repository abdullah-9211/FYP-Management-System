using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace I200444_I200476_I200689_Project
{
    public partial class Evaluation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Evaluate(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-IUQET19\SQLEXPRESS;Initial Catalog=ProjectDB;Integrated Security=True");
            string ptitle = TB1.Text;
            string eval = TB2.Text;
            string suggestion = TB3.Text;
            string pmember = Request.QueryString["username"];
            string curr_date = DateTime.Now.ToString("yyyy-MM-dd");
            string time = DateTime.Now.ToString("HH:mm:ss tt");
            int check2;
            string checkQuery = "SELECT * FROM [PANEL MEMBER] INNER JOIN [PROJECT] ON [PANEL MEMBER].[Panel] = [PROJECT].[Eval Panel] WHERE [PANEL MEMBER].[Member] = '" + pmember + "' AND [PROJECT].[Title] = '" + ptitle +"';";
            SqlCommand cmd = new SqlCommand(checkQuery, con);
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.Read())
                check2 = 1;
            else
                check2 = 0;
            rdr.Close();
            if (check2 == 0)
            {
                Response.Write("<script>alert('Couldn't insert data :(')</script>");
                TB1.Text = string.Empty;
                TB2.Text = string.Empty;
                TB3.Text = string.Empty;
                return;
            }
            string Query = "INSERT INTO [EVALUATION] VALUES('" + ptitle + "', '" + pmember + "','" + eval + "', '" + suggestion + "', (SELECT [Deadline Date] FROM [ASSIGNED WORK] WHERE [Project] = '" + ptitle + "'), (SELECT [Deadline Time] FROM [ASSIGNED WORK] WHERE [Project] = '" + ptitle + "'));";
            cmd = new SqlCommand(Query, con);
            int check;
            check = cmd.ExecuteNonQuery();
            if (check != 0)
            {
                Query = "INSERT INTO [AUDIT TRAIL] VALUES('" + pmember + "', CONVERT(DATE,'" + curr_date + "'), CONVERT(TIME, '" + time + "'), 'Completed evaluation for Project titled \"" + ptitle + "\"');";
                cmd = new SqlCommand(Query, con);
                cmd.ExecuteNonQuery();
                Query = "UPDATE [ASSIGNED WORK] SET [isSubmitted] = 1 WHERE [Project] = '" + ptitle + "';";
                cmd = new SqlCommand(Query, con);
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Data Inserted Successfully :)')</script>");
                TB1.Text = string.Empty;
                TB2.Text = string.Empty;
                TB3.Text = string.Empty;
            }
            else
                Response.Write("<script>alert('Couldn't insert data :(')</script>");


            con.Close();
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