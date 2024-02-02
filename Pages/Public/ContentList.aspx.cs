using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Public_ContentList : Page
{
    readonly dalContent obj= new dalContent();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            LoadDropdown();

            string criteria = GetCriteria();
            DataTable dt = obj.GetContentByCriteria(criteria);
            if (dt.Rows.Count > 0)
            {
                rptData.DataSource = dt;
                rptData.DataBind();
            }
            else
            {
                rptData.DataSource = null;
                rptData.DataBind();
            }
        }
    }

    #region Load All Dropdown
    protected void LoadDropdown()
    {
        Common.LoadDropdown(ddlClass, "bs_ClassName", 1, 0);
        Common.LoadDropdown(ddlGroup, "bs_Group", 1, 0);
        Common.LoadDropdown(ddlShift, "bs_Shift", 1, 0);
        Common.LoadDropdown(ddlSection, "bs_Section", 1, 0);
    }
    #endregion
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string criteria= GetCriteria();
        DataTable dt = obj.GetContentByCriteria(criteria);
        if(dt.Rows.Count>0)
        {
            rptData.DataSource = dt;
            rptData.DataBind();
        }
        else
        {
            rptData.DataSource = null;
            rptData.DataBind();
        }
    }
    protected void btnDelete_Command(object sender, CommandEventArgs e)
    {

    }

    #region Get Criteria
    protected string GetCriteria()
    {
        string criteria = "1=1";

        if (ddlClass.SelectedValue != "")
        {
                criteria += " and ClassId=" + ddlClass.SelectedValue;
        }
        if (ddlGroup.SelectedValue != "")
        {
                criteria += " and GroupId=" + ddlGroup.SelectedValue;
        }
        if (ddlShift.SelectedValue != "")
        {
                criteria += " and ShiftId=" + ddlShift.SelectedValue;
        }
        if (ddlSection.SelectedValue != "")
        {
                criteria += " and SectionId=" + ddlSection.SelectedValue;
        }
        return criteria;
    }
    #endregion

    protected void btnEdit_Command(object sender, CommandEventArgs e)
    {
        int ID = Convert.ToInt32(e.CommandArgument);
        Response.Redirect("/Pages/User/Profile.aspx?Id=" + ID+""+"&St=1");
    }
}