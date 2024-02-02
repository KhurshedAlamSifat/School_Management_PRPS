using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Teacher_List : System.Web.UI.Page
{
    dalTeacher objTeacher = new dalTeacher();
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "/Pages/Teacher/" + Path.GetFileName(Request.PhysicalPath) + Request.Url.Query;
        if (SessionManager.SessionName.UserName == null)
        {
            dalCommon.LoginReturnUrl(url);
        }
        else if (!dalCommon.IsPermitted(url))
        {
            Response.Redirect("~/Login.aspx");
        }
        if(!IsPostBack)
        {
            LoadTeacher();
        }
    }

    protected void LoadTeacher()
    {
        DataTable dt = objTeacher.GetAll();
        if(dt.Rows.Count>0)
        {
            rpt.DataSource = dt;
            rpt.DataBind();
        }
        else
        {
            rpt.DataSource = null;
            rpt.DataBind();
        }

    }
    protected void btnDelete_Command(object sender, CommandEventArgs e)
    {

    }
    protected void btnEdit_Command(object sender, CommandEventArgs e)
    {
        int ID = Convert.ToInt32(e.CommandArgument);
        Response.Redirect("/Pages/User/Profile.aspx?Id=" + ID + "" + "&St=0");
    }
}