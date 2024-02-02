using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Library_BookLendingHistory : BasePage
{
    dalLibrary obj = new dalLibrary();
    protected Dictionary<string, string> StatusDict = new Dictionary<string, string>() {
        { "","Select"},
        { "Given","Given"},
        { "Returned","Returned"},
        { "Lost","Lost"}
    };
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "/Pages/Library/" + Path.GetFileName(Request.PhysicalPath) + Request.Url.Query;
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
        ddlStatus.DataSource = StatusDict;
        ddlStatus.DataBind();
    }
    #endregion
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string criteria = GetCriteria();
        DataTable dt = obj.GetBookLendingHoistoryByCriteria(criteria);
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
        string criteria = "1=1";
        if (tbxBookTrId.Text != "")
        {
            criteria += " AND TrackingId = '" + tbxBookTrId.Text + "'";
        }

        if (tbxIssueDate.Text != "")
        {
            DateTime IssueDate = dalCommon.DateFormatYYYYMMDD(tbxIssueDate.Text);
            criteria += " AND IssueDate = '" + tbxIssueDate.Text + "'";
        }

        if (ddlStatus.SelectedValue != "")
        {
            criteria += " AND lb_BookLending.Status = '" + ddlStatus.SelectedValue + "'";
        }

        if (tbxUserName.Text != "")
        {
            criteria += " AND UserName = '" + tbxUserName.Text + "'";
        }

        if (tbxTargatedReturnDate.Text != "")
        {
            DateTime TargatedReturnDate = dalCommon.DateFormatYYYYMMDD(tbxTargatedReturnDate.Text);
            criteria += " AND TargatedReturnDate = '" + TargatedReturnDate.ToString("yyyy-MM-dd") + "'";
        }

        return criteria;
    }
    #endregion

    protected void btnEdit_Command(object sender, CommandEventArgs e)
    {
        int ID = Convert.ToInt32(e.CommandArgument);
        Response.Redirect("/Pages/User/Profile.aspx?Id=" + ID + "" + "&St=1");
    }
}