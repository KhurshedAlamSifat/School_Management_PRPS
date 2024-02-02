using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_SchoolInformaiton_TeachingApproval1 : System.Web.UI.Page
{
    protected string CampusNo = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        CampusNo = Request.QueryString["CampusNo"] ?? "1";
        if (CampusNo == "1")
        {
            img_teachingApproval.ImageUrl = "/Images/Common/TeachingApproval1_pip.jpg";
            img_teachingApproval.Height = 800;
            img_teachingApproval.Width = 500;
        }
        else if (CampusNo == "2")
        {
            //img_teachingApproval.ImageUrl = "";
            //img_teachingApproval.Height = 800;
            //img_teachingApproval.Width = 500;
        }
        else
        {
            //img_teachingApproval.ImageUrl = "";
            //img_teachingApproval.Height = 800;
            //img_teachingApproval.Width = 500;
        }
    }
}