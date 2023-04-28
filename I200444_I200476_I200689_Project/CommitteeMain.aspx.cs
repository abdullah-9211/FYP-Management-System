using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace I200444_I200476_I200689_Project
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
        protected void MovetoStudents(object sender, EventArgs e)
        {
            string user = Request.QueryString["username"];
            Response.Redirect("AddStudent.aspx?username=" + user);
        }
        protected void MovetoPanel(object sender, EventArgs e)
        {
            string user = Request.QueryString["username"];
            Response.Redirect("AddPanel.aspx?username=" + user);
        }
        protected void MovetoSuper(object sender, EventArgs e)
        {
            string user = Request.QueryString["username"];
            Response.Redirect("AddSuper.aspx?username=" + user);
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