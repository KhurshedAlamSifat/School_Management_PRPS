using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Enrollment_StudentToClass : BasePage
{
    dalStudent obj = new dalStudent();
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

            LoadAssignment();
            LoadAllStudent();
        }
    }
    protected void btnDelete_Command(object sender, CommandEventArgs e)
    {
        Controller.Delete("er_StudentToClass", Convert.ToInt32(e.CommandArgument));
        LoadAssign();
        LoadAllStudent();
    }

    #region Student Assign
    protected void LoadAssignment()
    {
        ddlYear.DataSource = new dalYear().GetDefault();
        ddlYear.DataBind();

        ddlClass.DataSource = new Common().GetAll("bs_ClassName");
        ddlClass.DataBind();

        ddlGroup.DataSource = new Common().GetAll("bs_Group");
        ddlGroup.DataBind();

        ddlShift.DataSource = new Common().GetAll("bs_Shift");
        ddlShift.DataBind();

        ddlSection.DataSource = new Common().GetAll("bs_Section");
        ddlSection.DataBind();

    }
    #endregion

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
        if (tbxRoll.Text != "")
        {
            if (criteria == "")
                criteria = "RollNo=" + tbxRoll.Text;
            else
                criteria += " and RollNo=" + tbxRoll.Text;
        }

        return criteria;
    }
    #endregion


    protected void btnSearch_Click(object sender, EventArgs e)
    {
        LoadAssign();
    }
    protected void LoadAssign()
    {
        string criteria = GetCriteria();
        DataTable dt = obj.GetByCriteria(criteria);
        if (dt.Rows.Count > 0)
        {
            rptCurrent.DataSource = dt;
            rptCurrent.DataBind();
        }
    }

    protected void LoadAllStudent()
    {
        DataTable dt = obj.UnassignStudent(ddlYear.SelectedItem.Text);
        rptUnassign.DataSource = dt;
        rptUnassign.DataBind();
    }

    protected DataTable Assign()
    {
        DataTable dt = new DataTable("dtAssign");
        dt.Columns.Add("StId", typeof(int));
        return dt;
    }
    protected void btnAssign_Click(object sender, EventArgs e)
    {
        DataTable dt = Assign();
        foreach (RepeaterItem item in rptUnassign.Items)
        {
            CheckBox chkRow = (CheckBox)item.FindControl("chkrow");
            HiddenField hdnId = (HiddenField)item.FindControl("hdnStudentId");
            if (chkRow.Checked)
            {
                dt.Rows.Add(Convert.ToInt32(hdnId.Value));
            }
        }
        if (dt.Rows.Count > 0)
        {
            obj.StudentToClassXml(dt, ddlYear.SelectedItem.Text, Convert.ToInt32(ddlClass.SelectedValue), Convert.ToInt32(ddlGroup.SelectedValue),
                Convert.ToInt32(ddlShift.SelectedValue), Convert.ToInt32(ddlSection.SelectedValue));
            MessageController.Show(MessageCode.SaveSucceeded, MessageType.Information, Page);
        }
        else
        {
            MessageController.Show("No Data Found to Insert.", MessageType.Information, Page);
        }
    }
}