using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Student_Attendence : System.Web.UI.Page
{
    dalStudent obj = new dalStudent();
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
            Load();
        }

    }
    protected void Load()
    {
        ddlYear.DataSource = new Common().GetAll("bs_Year");
        ddlYear.DataBind();
    }
    protected void btnShow_Click(object sender, EventArgs e)
    {
        string criteria = GetCriteria();
        DataTable dt = obj.GetAttendenceByCriteria(criteria,Common.SessionInfo.StudentToClassId);
        rptStudent.DataSource = dt;
        rptStudent.DataBind();
    }
    #region Get Criteria
    protected string GetCriteria()
    {
        string criteria = "";

        if (rdList.SelectedValue != "")
        {
            if (criteria == "")
                criteria = "AttendenceType=" + rdList.SelectedValue;
            else
                criteria += " and AttendenceType=" + rdList.SelectedValue;
        }

        if (rdAttendence.SelectedValue == "1")
        {
            if (ddlYear.SelectedValue != "")
            {
                if (criteria == "")
                    criteria = "ss_Attendence.Year=" + ddlYear.SelectedItem.Text;
                else
                    criteria += " and ss_Attendence.Year=" + ddlYear.SelectedItem.Text;
            }
            if (ddlMonth.SelectedValue != "")
            {
                if (criteria == "")
                    criteria = "ss_Attendence.Month=" + ddlMonth.SelectedValue;
                else
                    criteria += " and ss_Attendence.Month=" + ddlMonth.SelectedValue;
            }
        }
        else
        {
            if (tbxFromDate.Text != "")
            {
                if (criteria == "")
                    criteria = "ss_Attendence.Date>='" + tbxFromDate.Text + "'";
                else
                    criteria += " and ss_Attendence.Date>='" + tbxFromDate.Text + "'";
            }
            if (tbxToDate.Text != "")
            {
                if (criteria == "")
                    criteria = "ss_Attendence.Date<='" + tbxToDate.Text + "'";
                else
                    criteria += " and ss_Attendence.Date<='" + tbxToDate.Text + "'";
            }
        }
        return criteria;
    }
    #endregion
}