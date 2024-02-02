using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControl_SchoolHeader : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            LoadSchoolInfo();
        }
    }
    protected void LoadSchoolInfo()
    {
        DataTable dt = new Common().GetAll("bs_SchoolInformation");
        if(dt.Rows.Count>0)
        {
            lblSchoolName.Text = dt.Rows[0]["Name"].ToString();
            //lblSchoolCode.Text = dt.Rows[0]["Code"].ToString();
            //lblYear.Text = dt.Rows[0]["EstablishedYear"].ToString();
            lblAddress.Text = dt.Rows[0]["Address"].ToString();
        }
    }
}