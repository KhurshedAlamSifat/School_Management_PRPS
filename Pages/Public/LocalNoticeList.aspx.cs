using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Public_LocalNoticeList : Page
{
    readonly dalHomePageSetup obj = new dalHomePageSetup();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            LoadData();
        }
    }

    #region Load All Dropdown
  
    #endregion
    protected void LoadData()
    {
        DataTable dt = obj.GetByCriteria(Category: "Local Notice", Status: "Active");
        if (dt.Rows.Count > 0)
        {
            rptNotice.DataSource = dt;
            rptNotice.DataBind();
        }
        else
        {
            rptNotice.DataSource = null;
            rptNotice.DataBind();
        }
    }
    protected void btnDelete_Command(object sender, CommandEventArgs e)
    {

    }
}