using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Student_PaidHistory : BasePage
{
    dalPayment objPayment = new dalPayment();
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "/Pages/Student/" + Path.GetFileName(Request.PhysicalPath) + Request.Url.Query;
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
            StudentId = SessionManager.SessionName.StudentId;
            LoadDropdown();
            if (SessionManager.SessionName.RoleId == 4)
            {
                ddlGender.Enabled = false;
                ddlReligion.Enabled = false;
                tbxRegNo.Enabled = false;
                tbxRegNo.Text = SessionManager.SessionName.RegNo;
            }
        }

    }
    #region Load All Dropdown
    protected void LoadDropdown()
    {
        ddlYear.DataSource = new Common().GetAll("bs_Year");
        ddlYear.DataBind();
        Common.LoadDropdown(ddlClass, "bs_ClassName", 1, 0);
        Common.LoadDropdown(ddlGroup, "bs_Group", 1, 0);
        Common.LoadDropdown(ddlShift, "bs_Shift", 1, 0);
        Common.LoadDropdown(ddlSection, "bs_Section", 1, 0);
        Common.LoadDropdown(ddlGender, "bs_Gender", 1, 0);
        Common.LoadDropdown(ddlReligion, "bs_Religion", 1, 0);
        DataTable dt = new dalYear().GetDefault();
        if (dt.Rows.Count > 0)
        {
            ddlYear.SelectedValue = dt.Rows[0][1].ToString();
        }
    }
    #endregion
    int StudentId
    {
        set { ViewState["StudentId"] = value; }
        get
        {
            try
            {
                return Convert.ToInt32(ViewState["StudentId"]);
            }
            catch
            {
                return 0;
            }
        }
    }
    #region Get Criteria
    protected string GetCriteria()
    {
        string criteria = "";
        if (ddlYear.SelectedValue != "")
        {
            criteria += " and erYear=" + ddlYear.SelectedValue;
        }

        if (ddlClass.SelectedValue != "")
        {
            criteria += " and ClassId=" + ddlClass.SelectedValue;
        }
        if (ddlGroup.SelectedValue != "")
        {
            criteria += " and GroupId=" + ddlGroup.SelectedValue;
        }
        if (ddlShift.SelectedValue != "")
        {
            criteria += " and ShiftId=" + ddlShift.SelectedValue;
        }
        if (ddlSection.SelectedValue != "")
        {
            criteria += " and SectionId=" + ddlSection.SelectedValue;
        }
        if (ddlReligion.SelectedValue != "")
        {
            criteria += " and ReligionId=" + ddlReligion.SelectedValue;
        }
        if (ddlGender.SelectedValue != "")
        {
            criteria += " and GenderId=" + ddlGender.SelectedValue;
        }
        if (tbxRegNo.Text != "")
        {
            criteria += " and RegNo='" + tbxRegNo.Text + "'";
        }

        return criteria;
    }
    #endregion
    protected void LoadDues()
    {
        DataTable dt = objPayment.GetPaymentHistory(GetCriteria());
        rpt.DataSource = dt;
        rpt.DataBind();
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        LoadDues();
    }
}