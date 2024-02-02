using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Help_StRegUpdate : BasePage
{
    dalStudent objSutdent = new dalStudent();
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "/Pages/Help/" + Path.GetFileName(Request.PhysicalPath) + Request.Url.Query;
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
        DataTable dt = new dalYear().GetDefault();
        if (dt.Rows.Count > 0)
        {
            ddlYear.SelectedValue = dt.Rows[0][0].ToString();
        }
    }
    #endregion
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        GetData();
    }
    private void GetData()
    {
        string criteria = GetCriteria();
        DataTable dt = objSutdent.GetStudentInformation(criteria);
        if (dt.Rows.Count > 0)
        {
            gvStudent.DataSource = dt;
        }
        else
        {
            gvStudent.DataSource = null;
        }
        gvStudent.DataBind();
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
        if (tbxRegNo.Text != "")
        {
            if (criteria == "")
                criteria = "RegNo='" + tbxRegNo.Text + "'";
            else
                criteria += " and RegNo='" + tbxRegNo.Text + "'";
        }

        return criteria;
    }
    #endregion
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            foreach (GridViewRow dr in gvStudent.Rows)
            {
                CheckBox chk = (CheckBox)dr.FindControl("chkrow");
                if (chk.Checked)
                {
                    TextBox tbxReg = (TextBox)dr.FindControl("tbxReg");
                    int PersonId = Convert.ToInt32(dr.Cells[0].Text);
                    objSutdent.UpdateRegNo(PersonId, tbxReg.Text);
                }
            }
            GetData();
            MessageController.Show(MessageCode.SaveSucceeded, MessageType.Information, Page);
        }
        catch
        { }
    }
}