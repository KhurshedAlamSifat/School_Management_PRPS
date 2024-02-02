using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Public_ViewGlobalNotice : Page
{
    dalHomePageSetup obj = new dalHomePageSetup();
    protected string Title = "";
    protected string ContentString = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ID"] != null)
        {
            int ID = Convert.ToInt32(Request.QueryString["ID"]);
            LoadNotice(ID);
        }
    }
    
    protected void LoadNotice(int ID)
    {
        DataTable dt = obj.GetById(ID);
        if (dt.Rows.Count > 0)
        {
            Title = dt.Rows[0]["Title"].ToString();
            ContentString = dt.Rows[0]["Content"].ToString();
            if (!String.IsNullOrEmpty(dt.Rows[0]["ImageLink"].ToString()))
            {
                hlAttachment.NavigateUrl = "/Pages/Helper/FileDownload.aspx?SubDirecotry=HomePage"
                    + "&FileName=" + dt.Rows[0]["ImageLink"].ToString();
                hlAttachment.Text = "Attachment";
            }
            else
            {
                hlAttachment.Text = "N/A";
            }
        }
    }
}