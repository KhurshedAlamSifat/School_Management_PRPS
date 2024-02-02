using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_SchoolInformaiton_TeacherInfo : System.Web.UI.Page
{
    dalHomePageSetup obj = new dalHomePageSetup();
    protected string CampusNo = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        CampusNo = Request.QueryString["CampusNo"] ?? "1";
        SessionManager.SessionName.Branch =Convert.ToInt32(CampusNo);
        var dt= new dalCommon().GetByQuery("select st_Person.NameEng, st_Person.PersonImage from tr_Teacher join st_Person on tr_Teacher.PersonId=st_Person.Id;");

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