using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Student_ViewNotice : BasePage
{
    dalNotice obj = new dalNotice();
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "/Pages/Student/" + Path.GetFileName(Request.PhysicalPath) + Request.Url.Query;
        if (SessionManager.SessionName.UserName == null)
        {
            dalCommon.LoginReturnUrl(url);
        }
        if (!IsPostBack)
        {
            if (Request.QueryString["ID"] != null)
            {
               int ID = Convert.ToInt32(Request.QueryString["ID"]);
                LoadNotice(ID);
            }
        }
    }

    protected void LoadNotice( int ID)
    {
        DataTable dt = obj.GetById(ID);
        if (dt.Rows.Count > 0)
        {
            lblTitle.Text = dt.Rows[0]["Title"].ToString();
            lbDate.Text = Convert.ToDateTime(dt.Rows[0]["Date"]).ToString("dd/MM/yyyy");
            if (!String.IsNullOrEmpty(dt.Rows[0]["Files"].ToString()))
            {
                hlAttachment.NavigateUrl = "/VariableContent/NoticeAttachment/" + dt.Rows[0]["Files"].ToString();
                hlAttachment.Text = "Attachment";
            }
            else
            {
                hlAttachment.Text = "N/A";
            }
            litDetails.Text = dt.Rows[0]["Details"].ToString();
        }
    }
}