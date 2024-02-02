using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Enrollment_SubjectToStudent : BasePage
{
    dalStudent obj = new dalStudent();
    dalSubject objSubject = new dalSubject();
    public string[] main;
    public string[] optional;
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
        LoadSubject();
    }
    protected void LoadSubject()
    {
        list1.DataSource = null;
        list1.DataBind();
        DataTable dt = objSubject.GetByClassAndGroupId(Convert.ToInt32(ddlClass.SelectedValue), Convert.ToInt32(ddlGroup.SelectedValue));
        if (dt.Rows.Count > 0)
        {
            list1.Items.Clear();
            list1.DataSource = dt;
            list1.DataBind();
            //rptSubject.DataSource = dt;
            //rptSubject.DataBind();
        }
        else
        {
            //rptSubject.DataSource = null;
            //rptSubject.DataBind();
            btnAssign.Visible = false;
        }
    }

    protected void LoadAllStudent()
    {
        btnAssign.Visible = false;
        string criteria = GetCriteria();
        DataTable dt = obj.GetStudentInformation(criteria);
        if (dt.Rows.Count > 0)
        {
            rptStudent.DataSource = dt;
            rptStudent.DataBind();
            btnAssign.Visible = true;
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
        dt.Columns.Add("Optional", typeof(bool));
        return dt;
    }
    protected void btnAssign_Click(object sender, EventArgs e)
    {
        int count = 0;
        if (Request.Form[list2.UniqueID] == null && Request.Form[list3.UniqueID] == null)
        {
            list1.BorderColor = System.Drawing.Color.Red;
            list2.BorderColor = System.Drawing.Color.Red;
            MessageController.Show("Please select al least one subject.", MessageType.Warning, Page);
            return;
        }
        if (Request.Form[list2.UniqueID] != null)
            main = (Request.Form[list2.UniqueID]).Split(',');
        if (Request.Form[list3.UniqueID] != null)
            optional = (Request.Form[list3.UniqueID]).Split(';');
        DataTable dt = Assign();
        foreach (RepeaterItem item in rptStudent.Items)
        {
            CheckBox chkstudentRow = (CheckBox)item.FindControl("chkStudentRow");
            HiddenField hdnStudentToClassId = (HiddenField)item.FindControl("hdnStudentToClassId");
            if (chkstudentRow.Checked)
            {
                count++;
                if (main.Length > 0)
                {
                    for (int i = 0; i < main.Length; i++)
                    {
                        dt.Rows.Add(Convert.ToInt32(hdnStudentToClassId.Value), Convert.ToInt32(main[i]), false);
                    }
                }
                if (optional.Length > 0)
                {
                    for (int j = 0; j < optional.Length; j++)
                    {
                        dt.Rows.Add(Convert.ToInt32(hdnStudentToClassId.Value), Convert.ToInt32(optional[j]), true);
                    }
                }
            }
        }
        if (count > 0)
            objSubject.SubjectToStudentInsert(Page.User.Identity.Name, dt);
        else
        {
            
            MessageController.Show("Please select al least one student.", MessageType.Warning, Page);
        }
            
    }
    protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadAllStudent();
        LoadSubject();
    }
}