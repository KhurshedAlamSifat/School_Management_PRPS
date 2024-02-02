using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControl_AdminHeader : System.Web.UI.UserControl
{
    dalNotice objNotice = new dalNotice();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadNotice();
            lblUser.Text = SessionManager.SessionName.UserName;
        }

    }

    protected void LoadNotice()
    {
        if (SessionManager.SessionName.RoleId > 3)
        {
            lblNotice.Visible = false;
            lblcount.Text = "no";
        }
        else if (Page.User.IsInRole("Student"))
        {
            //DataTable dt = objNotice.GetNoticeForStudent(Common.SessionInfo.StudentToClassId);
            //if (dt.Rows.Count > 0)
            //{
            //    lblcount.Text = dt.Rows.Count.ToString();
            //    lblNotice.InnerHtml = dt.Rows.Count.ToString();
            //    rptNotice.DataSource = dt;
            //    rptNotice.DataBind();
            //}
            //else
            //{
            //    lblcount.Text = "no";
            //    lblNotice.Visible = false;
            //}
        }
        else
        {
            //DataTable dt = objNotice.UnseenNoticeForTeacher(16);
            //if (dt.Rows.Count > 0)
            //{
            //    lblcount.Text = dt.Rows.Count.ToString();
            //    lblNotice.InnerHtml = dt.Rows.Count.ToString();
            //    rptNotice.DataSource = dt;
            //    rptNotice.DataBind();
            //}
            //else
            //{
            //    lblcount.Text = "no";
            //    lblNotice.Visible = false;
            //}

        }
    }

    protected void LoginStatus1_LoggedOut(object sender, EventArgs e)
    {
        Response.Redirect("~/HomePages/GlobalHomePage.aspx");
    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        SessionManager.SessionName = null;
        Response.Redirect("~/Login.aspx");
    }
    protected void lnbProfile_Click(object sender, EventArgs e)
    {
        if (SessionManager.SessionName.RoleId == 4)
        {
            int id = SessionManager.SessionName.PersonId;
            Response.Redirect("~/Pages/Student/View.aspx");
        }
        else
        {
            Response.Redirect("~/Pages/User/Profile.aspx");
        }
    }
}