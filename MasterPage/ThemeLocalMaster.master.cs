using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage_ThemeLocalMaster : System.Web.UI.MasterPage
{
    protected string CampusNo = "";
    dalHomePageSetup obj = new dalHomePageSetup();
    protected void Page_Load(object sender, EventArgs e)
    {
        CampusNo = Request.QueryString["CampusNo"] ?? "1";

        if (Common.SessionInfo == null)
        {
            Common.SessionInfo = new bdoSessionInfo();
        }
        if (CampusNo == "1")
        {
            Common.SessionInfo.Branch = 1;
        }
        else if (CampusNo == "2")
        {
            Common.SessionInfo.Branch = 2;
        }
        else
        {
            Common.SessionInfo.Branch = 3;
        }
        //#Local Notice
        DataTable dt = obj.GetByCriteria(Category: "Local Notice", Status: "Active");

        if (dt.Rows.Count > 0)
        {
            rptNotice.DataSource = dt;
            rptNotice.DataBind();
            pnlScrollingMessage.Visible = true;
        }
        else
        {
            rptNotice.DataSource = null;
            rptNotice.DataBind();
            pnlScrollingMessage.Visible = false;
        }

        if (!IsPostBack)
        {
        }
    }
}
