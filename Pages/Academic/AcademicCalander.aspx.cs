using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Academic_AcademicCalander : System.Web.UI.Page
{
    dalHomePageSetup obj = new dalHomePageSetup();
    protected string CampusNo = "";
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
        DataTable dt = obj.GetByCriteria(Category: "Acedemic Calander", Status: "Active");

        if (dt.Rows.Count > 0)
        {
            rptData.DataSource = dt;
            rptData.DataBind();
        }
        else
        {
            rptData.DataSource = null;
            rptData.DataBind();
        }

    }
}