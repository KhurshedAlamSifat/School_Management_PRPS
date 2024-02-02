using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Enrollment_Promotion : BasePage
{
    dalStudent objSutdent = new dalStudent();
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "/Pages/Enrollment/" + Path.GetFileName(Request.PhysicalPath) + Request.Url.Query;
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
        Common.LoadDropdown(ddlYear, "bs_Year", 1, 1);
        Common.LoadDropdown(ddlClass, "bs_ClassName", 1, 0);
        Common.LoadDropdown(ddlGroup, "bs_Group", 1, 0);
        Common.LoadDropdown(ddlShift, "bs_Shift", 1, 0);
        Common.LoadDropdown(ddlSection, "bs_Section", 1, 0);
        Common.LoadDropdown(ddlPYear, "bs_Year", 1, 1);
        Common.LoadDropdown(ddlpClass, "bs_ClassName", 1, 0);
        Common.LoadDropdown(ddlpGroup, "bs_Group", 1, 0);
        Common.LoadDropdown(ddlpShift, "bs_Shift", 1, 0);
        Common.LoadDropdown(ddlpSection, "bs_Section", 1, 0);
        DataTable dt = new dalYear().GetDefault();
        if (dt.Rows.Count > 0)
        {
            ddlYear.SelectedValue = dt.Rows[0][1].ToString();
            ddlPYear.SelectedValue = dt.Rows[0][1].ToString();
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
                criteria = "Year=" + ddlYear.SelectedValue;
            else
                criteria += " Year=" + ddlYear.SelectedValue;
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
        criteria += " and StudentId not in(select StudentId from er_StudentToClass where Year=" + ddlPYear.SelectedValue + ") Order by RollNo asc";

        return criteria;
    }
    #endregion
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            int count = 0;
            int countnew = 0;
            string msg = "";
            string promot = "successfully promoted";
            foreach (GridViewRow dr in gvStudent.Rows)
            {
                CheckBox chk = (CheckBox)dr.FindControl("chkrow");
                if (chk.Checked)
                {
                    TextBox tbxRollNo = (TextBox)dr.FindControl("tbxRoll");
                    HiddenField hdnStId = (HiddenField)dr.FindControl("hdnStId");
                    int StudentId = Convert.ToInt32(hdnStId.Value);
                    string criteria = "Year=" + ddlPYear.SelectedValue + " and StudentId=" + StudentId;
                    DataTable dtCheck = objSutdent.GetStudentInformation(criteria);
                    if (dtCheck.Rows.Count == 0)
                    {
                        objSutdent.StudentToClass(StudentId, ddlPYear.SelectedValue, Convert.ToInt32(ddlpClass.SelectedValue), Convert.ToInt32(ddlpGroup.SelectedValue), Convert.ToInt32(ddlpShift.SelectedValue),
                                           Convert.ToInt32(ddlpSection.SelectedValue), Convert.ToInt32(tbxRollNo.Text));
                        if (ddlClass.SelectedValue == ddlpClass.SelectedValue)
                        {
                            promot = "remain";
                        }
                        //msg = "Dear " + dr.Cells[3].Text.Trim() + ", Congratulation! You have " + promot + " to class " + ddlpClass.SelectedItem.Text + ". Please pay " + LoadPaymentByClass(Convert.ToInt32(ddlPYear.SelectedValue), "1", Convert.ToInt32(ddlpClass.SelectedValue), Convert.ToInt32(ddlpGroup.SelectedValue), StudentId) + " BDT to Biller ID 247 from 30 Dec-2016 to 1 Jan-2017 by DBBL Mobile Banking. Your ID is " + dr.Cells[2].Text.Trim() + ". ---PRPS";
                        msg = "Dear " + dr.Cells[3].Text.Trim() + ", Congratulation! You have " + promot + " to class " + ddlpClass.SelectedItem.Text + ".  ---PRPS";
                        dalCommon.SendSMS("", "", "PRPS", dr.Cells[4].Text.Trim(), msg);
                        countnew++;
                    }
                    else
                    {
                        count++;
                    }
                }
            }
            GetData();
            string msgs = countnew.ToString() + " Student promoted successfully. " + count.ToString() + " Student already promoted.";
            MessageController.Show(msgs, MessageType.Confirmation, Page);
        }
        catch (Exception ex)
        {
            MessageController.Show(ex.Message, MessageType.Error, Page);
        }
    }
    private string LoadPaymentByClass(int Year, string month, int Class, int Group, int StudentId)
    {
        DataTable dt = new dalPaymentType().GetByYear(Year, month, Class, Group);
        DataTable dtScholarship = new dalPayment().GetAllScholarshipByStudentIdYearMonth(StudentId, Year, Convert.ToInt32(month));
        decimal scholarship = 0;
        if (dtScholarship.Rows.Count > 0)
        {
            scholarship = Convert.ToDecimal(dtScholarship.Rows[0]["Amount"]);
        }
        decimal gTotal = 0;
        if (dt.Rows.Count > 0)
        {
            gTotal = Convert.ToDecimal(dt.Rows[0]["Total"]) - scholarship;
        }
        else
        {
            gTotal = 0;
        }
        return gTotal.ToString();
    }
}