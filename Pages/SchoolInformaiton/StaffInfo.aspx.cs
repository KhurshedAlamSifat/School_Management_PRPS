using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_SchoolInformaiton_StaffInfo : System.Web.UI.Page
{
    //dalHomePageSetup obj = new dalHomePageSetup();
    protected string CampusNo = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        CampusNo = Request.QueryString["CampusNo"] ?? "1";
        if (CampusNo == "1")
        {
            pnlCampus1.Visible = true;
        }
        else if (CampusNo == "2")
        {
            pnlCampus2.Visible = true;
        }
        else
        {
            pnlCampus3.Visible = true;
        }
    }
}