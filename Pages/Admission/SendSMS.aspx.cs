using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Admission_SendSMS : BasePage
{
    dalApplication obj = new dalApplication();
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "/Pages/Admission/" + Path.GetFileName(Request.PhysicalPath) + Request.Url.Query;
        if (SessionManager.SessionName.UserName == null)
        {
            dalCommon.LoginReturnUrl(url);
        }
        else if (!dalCommon.IsPermitted(url))
        {
            Response.Redirect("~/Login.aspx");
        }
        if (!IsPostBack)
        {
            LoadDropdown();
        }
    }
    protected void LoadDropdown()
    {
        Common.LoadDropdown(ddlYear, "bs_Year", 1, 0);
        Common.LoadDropdown(ddlClass, "bs_ClassName", 1, 0);
        DataTable dt = new dalYear().GetDefault();
        if (dt.Rows.Count > 0)
        {
            ddlYear.SelectedValue = dt.Rows[0][0].ToString();
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {
            GetSearchData();
        }
        catch
        {

        }
    }

    private void GetSearchData()
    {
        string Conditions = "";
        Conditions += string.IsNullOrEmpty(ddlClass.SelectedValue) ? "" : " and c.ClassId= " + ddlClass.SelectedValue;
        Conditions += " and c.Year= " + ddlYear.SelectedValue;
        Conditions += string.IsNullOrEmpty(ddlPaymentStatus.SelectedValue) ? "" : " and a.PaymentStatus= " + ddlPaymentStatus.SelectedValue;
        Conditions += string.IsNullOrEmpty(tbxApplicatoinID.Text) ? "" : " and a.Id= " + tbxApplicatoinID.Text;
        Conditions += string.IsNullOrEmpty(tbxMobile.Text) ? "" : " and a.Mobile= " + tbxMobile.Text;
        DataTable dt = obj.GetSearchData(Conditions);
        rptApplicationList.DataSource = dt;
        rptApplicationList.DataBind();
    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        string msg = tbxSMS.Text + " ---PRPS";
        foreach (RepeaterItem r in rptApplicationList.Items)
        {
            CheckBox chk = (CheckBox)r.FindControl("chkStudentRow");
            if (chk.Checked)
            {
                HiddenField mobile = (HiddenField)r.FindControl("hdnMobile");
                dalCommon.SendSMS("", "", "PRPS", mobile.Value, msg);
            }
        }
    }
    protected void btnTransID_Click(object sender, EventArgs e)
    {
        string msg = "Please collect your admit card from www.prps.edu.bd. Application ID is ";
        foreach (RepeaterItem r in rptApplicationList.Items)
        {
            CheckBox chk = (CheckBox)r.FindControl("chkStudentRow");
            if (chk.Checked)
            {
                HiddenField mobile = (HiddenField)r.FindControl("hdnMobile");
                HiddenField appid = (HiddenField)r.FindControl("hdnApplicationID");
                msg += appid.Value;
                HiddenField tnsId = (HiddenField)r.FindControl("hdnTransactionId");
                msg += "and Transaction ID is "+tnsId.Value+"---PRPS";
                dalCommon.SendSMS("", "", "PRPS", mobile.Value, msg);
            }
        }
    }
}