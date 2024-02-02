using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Enrollment_SujectToStudent1 : System.Web.UI.Page
{
    dalStudent obj = new dalStudent();
    dalSubject objSubject = new dalSubject();
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
            LoadSubject();
        }
    }
    protected void btnDelete_Command(object sender, CommandEventArgs e)
    {
        Controller.Delete("er_StudentToClass", Convert.ToInt32(e.CommandArgument));
        LoadSubject();
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
        LoadAllStudent();
    }
    protected void LoadSubject()
    {
        DataTable dt = objSubject.GetByClassAndGroupId(Convert.ToInt32(ddlClass.SelectedValue), Convert.ToInt32(ddlGroup.SelectedValue));
        if (dt.Rows.Count > 0)
        {
            rptSubject.DataSource = dt;
            rptSubject.DataBind();
        }
        else
        {
            rptSubject.DataSource = null;
            rptSubject.DataBind();
            btnAssign.Visible = false;
        }
    }

    protected void LoadAllStudent()
    {
        string criteria = GetCriteria();
        DataTable dt = obj.GetStudentInformation(criteria);
        if (dt.Rows.Count > 0)
        {
            rptStudent.DataSource = dt;
            rptStudent.DataBind();
        }
        else
        {
            rptStudent.DataSource = null;
            rptStudent.DataBind();
            btnAssign.Visible = false;
        }
    }

    protected DataTable Assign()
    {
        DataTable dt = new DataTable("dtSubject");
        dt.Columns.Add("StuId", typeof(int));
        dt.Columns.Add("SubId", typeof(int));
        return dt;
    }
    protected void btnAssign_Click(object sender, EventArgs e)
    {
        DataTable dt = Assign();
        foreach (RepeaterItem item in rptStudent.Items)
        {
            CheckBox chkstudentRow = (CheckBox)item.FindControl("chkStudentRow");
            HiddenField hdnStudentToClassId = (HiddenField)item.FindControl("hdnStudentToClassId");
            if (chkstudentRow.Checked)
            {
                foreach (RepeaterItem itm in rptSubject.Items)
                {
                    CheckBox chkSubjectRow = (CheckBox)itm.FindControl("chkSubjectRow");
                    HiddenField subjectId = (HiddenField)itm.FindControl("hdnSubjectToClassId");
                    {
                        if (chkSubjectRow.Checked)
                        {
                            dt.Rows.Add(Convert.ToInt32(hdnStudentToClassId.Value), Convert.ToInt32(subjectId.Value));
                        }
                    }
                }
            }
        }
        objSubject.SubjectToStudentInsert(Page.User.Identity.Name, dt);
    }
    protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadAllStudent();
        LoadSubject();
    }

}