using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_User_ApplicationPayment : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadDdl();
        }
    }

    private void LoadDdl()
    {   //SessionManager.SessionName.Branch = Convert.ToInt32(ddlBranch.SelectedValue);
        ddlPaymentMethod.DataSource = new Common().GetAll("bs_PaymentMethod");
        ddlPaymentMethod.DataBind();
    }
}