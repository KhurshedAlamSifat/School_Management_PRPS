using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Student_ClassRoutine : BasePage
{
    dalRoutine objRoutine = new dalRoutine();
    List<string> day = new List<string>();
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
            pnlClassRoutine.Visible = false;
            if (Page.User.IsInRole("Student"))
            {
                ddlClass.SelectedValue = Common.SessionInfo.ClassId.ToString();
                ddlGroup.SelectedValue = Common.SessionInfo.GroupId.ToString();
                ddlShift.SelectedValue = Common.SessionInfo.ShiftId.ToString();
                ddlSection.SelectedValue = Common.SessionInfo.SectionId.ToString();
                ddlClass.Enabled = false;
                ddlGroup.Enabled = false;
                ddlShift.Enabled = false;
                ddlSection.Enabled = false;
            }
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

        ddlSection.DataSource = new Common().GetAll("bs_Section");
        ddlSection.DataBind();
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
        return criteria;
    }
    #endregion
    protected void btnShowRoutine_Click(object sender, EventArgs e)
    {
        string criteria = GetCriteria();
        DataTable dt = objRoutine.GetByCriteria(criteria);
        if (dt.Rows.Count > 0)
        {
            gv.DataSource = dt;
            gv.DataBind();
            pnlClassRoutine.Visible = true;
            ((Panel)Page.Master.FindControl("MessagePanel1").FindControl("pnlMessage")).Visible = false;
        }
        else
        {
            pnlClassRoutine.Visible = false;
            MessageController.Show("No Class Routine Found.", MessageType.Warning, Page);
        }

    }
}