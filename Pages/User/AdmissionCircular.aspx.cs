using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_User_AdmissionCircular : BasePage
{
    dalAdmissionCircular obj = new dalAdmissionCircular();
    string PageTitle = "";
    protected void Page_Load(object sender, EventArgs e)
    {

        BindData();
        PageTitle = "Admission Circular For " + (SessionManager.SessionName.Branch == 1 ? "Ghorashal" : SessionManager.SessionName.Branch == 2 ? "Habiganj" : "Danga") + " Campus";

    }
    protected void BindData()
    {
        DataTable dt = obj.GetAll();
        rptYear.DataSource = dt;
        rptYear.DataBind();
    }

}
