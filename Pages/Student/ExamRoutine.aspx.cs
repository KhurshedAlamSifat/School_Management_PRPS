using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Student_ExamRoutine : System.Web.UI.Page
{
    dalRoutine obj = new dalRoutine();
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
        if(!IsPostBack)
        {
            Load();
            if(Page.User.IsInRole("Student"))
            {
                ddlClass.SelectedValue = Common.SessionInfo.ClassId.ToString();
                ddlGroup.SelectedValue = Common.SessionInfo.GroupId.ToString();
                ddlShift.SelectedValue = Common.SessionInfo.ShiftId.ToString();
                ddlClass.Enabled = false;
                ddlGroup.Enabled = false;
                ddlShift.Enabled = false;
            }
            pnlExamRoutine.Visible = false;
        }
    }

    protected void btnShowRoutine_Click(object sender, EventArgs e)
    {
        string criteria = GetCriteria();
        DataTable dt = obj.GetExamRoutineByCriteria(criteria);
        if(dt.Rows.Count>0)
        {
            rpt.DataSource = dt;
            rpt.DataBind();
            pnlExamRoutine.Visible = true;
            ((Panel)Page.Master.FindControl("MessagePanel1").FindControl("pnlMessage")).Visible = false;
        }
        else
        {
            pnlExamRoutine.Visible = false;
            MessageController.Show("No Exam Routine Found.",MessageType.Warning,Page);
        }

    }

    #region Load Data
    protected void Load()
    {
        ddlYear.DataSource = new Common().GetAll("bs_Year");
        ddlYear.DataBind();

        ddlClass.DataSource = new Common().GetAll("bs_ClassName");
        ddlClass.DataBind();

        ddlGroup.DataSource = new Common().GetAll("bs_Group");
        ddlGroup.DataBind();

        ddlShift.DataSource = new Common().GetAll("bs_Shift");
        ddlShift.DataBind();

        ddlExamType.DataSource = new Common().GetAll("bs_ExamType");
        ddlExamType.DataBind();
        DataTable dt = new dalYear().GetDefault();
        if (dt.Rows.Count > 0)
        {
            ddlYear.SelectedValue = dt.Rows[0][0].ToString();
        }
    }
    #endregion

    #region Get Criteria
    protected string GetCriteria()
    {
        string criteria = "";
        if (ddlYear.SelectedValue != "")
        {
            if (criteria == "")
                criteria = "bs_ExamRoutine.Year=" + ddlYear.SelectedItem.Text;
            else
                criteria += " bs_ExamRoutine.Year=" + ddlYear.SelectedItem.Text;
        }
        if (ddlClass.SelectedValue != "")
        {
            if (criteria == "")
                criteria = "bs_ExamRoutine.ClassId=" + ddlClass.SelectedValue;
            else
                criteria += " and bs_ExamRoutine.ClassId=" + ddlClass.SelectedValue;
        }
        if (ddlGroup.SelectedValue != "")
        {
            if (criteria == "")
                criteria = "bs_ExamRoutine.GroupId=" + ddlGroup.SelectedValue;
            else
                criteria += " and bs_ExamRoutine.GroupId=" + ddlGroup.SelectedValue;
        }
        if (ddlShift.SelectedValue != "")
        {
            if (criteria == "")
                criteria = "bs_ExamRoutine.ShiftId=" + ddlShift.SelectedValue;
            else
                criteria += " and bs_ExamRoutine.ShiftId=" + ddlShift.SelectedValue;
        }
        if (ddlExamType.SelectedValue != "")
        {
            if (criteria == "")
                criteria = "bs_ExamRoutine.ExamTypeId=" + ddlExamType.SelectedValue;
            else
                criteria += " and bs_ExamRoutine.ExamTypeId=" + ddlExamType.SelectedValue;
        }
        return criteria;
    }
    #endregion
}