using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Admin_StIdCard : BasePage
{
    dalStudent objSutdent = new dalStudent();
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "/Pages/Admin/" + Path.GetFileName(Request.PhysicalPath) + Request.Url.Query;
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

    #region Load All Dropdown
    protected void LoadDropdown()
    {
        Common.LoadDropdown(ddlYear, "bs_Year", 1, 0);
        Common.LoadDropdown(ddlClass, "bs_ClassName", 1, 0);
        Common.LoadDropdown(ddlGroup, "bs_Group", 1, 0);
        Common.LoadDropdown(ddlShift, "bs_Shift", 1, 0);
        Common.LoadDropdown(ddlSection, "bs_Section", 1, 0);
        Common.LoadDropdown(ddlGender, "bs_Gender", 1, 0);
        Common.LoadDropdown(ddlReligion, "bs_Religion", 1, 0);
        DataTable dt = new dalYear().GetDefault();
        if (dt.Rows.Count > 0)
        {
            ddlYear.SelectedValue = dt.Rows[0][0].ToString();
        }
    }
    #endregion
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string criteria = GetCriteria();
        DataTable dt = objSutdent.GetStudentInformation(criteria);
        if (dt.Rows.Count > 0)
        {
            rpt.DataSource = dt;
            rpt.DataBind();
        }
        else
        {
            rpt.DataSource = null;
            rpt.DataBind();
        }
    }
    protected void btnDelete_Command(object sender, CommandEventArgs e)
    {

    }

    #region Get Criteria
    protected string GetCriteria()
    {
        string criteria = "";
        if (ddlYear.SelectedValue != "")
        {
            if (criteria == "")
                criteria = "Year=" + ddlYear.SelectedItem.Text;
            else
                criteria += " Year=" + ddlYear.SelectedItem.Text;
        }

        if (ddlClass.SelectedValue != "")
        {
            if (criteria == "")
                criteria = "ClassId=" + ddlClass.SelectedValue;
            else
                criteria += " and ClassId=" + ddlClass.SelectedValue;
        }
        if (ddlGroup.SelectedValue != "")
        {
            if (criteria == "")
                criteria = "GroupId=" + ddlGroup.SelectedValue;
            else
                criteria += " and GroupId=" + ddlGroup.SelectedValue;
        }
        if (ddlShift.SelectedValue != "")
        {
            if (criteria == "")
                criteria = "ShiftId=" + ddlShift.SelectedValue;
            else
                criteria += " and ShiftId=" + ddlShift.SelectedValue;
        }
        if (ddlSection.SelectedValue != "")
        {
            if (criteria == "")
                criteria = "SectionId=" + ddlSection.SelectedValue;
            else
                criteria += " and SectionId=" + ddlSection.SelectedValue;
        }
        if (ddlReligion.SelectedValue != "")
        {
            if (criteria == "")
                criteria = "ReligionId=" + ddlReligion.SelectedValue;
            else
                criteria += " and ReligionId=" + ddlReligion.SelectedValue;
        }
        if (ddlGender.SelectedValue != "")
        {
            if (criteria == "")
                criteria = "GenderId=" + ddlGender.SelectedValue;
            else
                criteria += " and GenderId=" + ddlGender.SelectedValue;
        }
        if (tbxRegNo.Text != "")
        {
            if (criteria == "")
                criteria = "RegNo='" + tbxRegNo.Text + "'";
            else
                criteria += " and RegNo='" + tbxRegNo.Text + "'";
        }
        if (tbxApplicationId.Text != "")
        {
            if (criteria == "")
                criteria = "ApplicationId=" + tbxApplicationId.Text;
            else
                criteria += " and ApplicationId=" + tbxApplicationId.Text;
        }
        if (!string.IsNullOrEmpty(ddlIsAdmitted.SelectedValue))
        {
            if (criteria == "")
            {
                criteria = "IsAdmitted='" + ddlIsAdmitted.SelectedValue + "'";
            }
            else
            {
                criteria += " and IsAdmitted='" + ddlIsAdmitted.SelectedValue + "'";
            }
        }

        return criteria;
    }
    #endregion
    
}