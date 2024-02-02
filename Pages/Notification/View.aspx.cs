using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Notification_View : System.Web.UI.Page
{
    dalNotice objNotice = new dalNotice();
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "/Pages/Notification/" + Path.GetFileName(Request.PhysicalPath) + Request.Url.Query;
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
            if(Request.QueryString["ID"]!=null)
            {
                ID = Convert.ToInt32(Request.QueryString["ID"]);
                LoadNotice();
            }
        }
    }
    int ID
    {
        set { ViewState["ID"] = value; }
        get
        {
            try
            {
                return Convert.ToInt32(ViewState["ID"]);
            }
            catch
            {
                return 0;
            }
        }
    }
    protected void LoadNotice()
    {
        DataTable dt = objNotice.GetById(ID);
        if(dt.Rows.Count>0)
        {
            lblTitle.Text=dt.Rows[0]["Title"].ToString();
            lblFrom.Text = dt.Rows[0]["CreatedBy"].ToString();
            lblDate.Text = dt.Rows[0]["Date"].ToString();
            litContent.Text = dt.Rows[0]["Details"].ToString();
        }
    }
}