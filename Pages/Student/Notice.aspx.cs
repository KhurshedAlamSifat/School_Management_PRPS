using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Student_Notice : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "/Pages/Student/" + Path.GetFileName(Request.PhysicalPath) + Request.Url.Query;
        if (SessionManager.SessionName.UserName == null)
        {
            dalCommon.LoginReturnUrl(url);
        }
        else if (!dalCommon.IsPermitted(url))
        {
            Response.Redirect("~/Login.aspx");
        }
        if (!IsPostBack)
            LoadNews();
    }

    protected void LoadNews()
    {
        DataTable dt = new Common().GetAll("bs_Notice");
        rptNews.DataSource = dt;
        rptNews.DataBind();
    }
}