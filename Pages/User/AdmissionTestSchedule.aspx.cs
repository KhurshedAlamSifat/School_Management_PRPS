using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_User_AdmissionTestSchedule : BasePage
{
    dalRoutine objRoutine = new dalRoutine();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Load();
            LoadData();
        }
    }
    protected void Load()
    {
        ddlYear.DataSource = new Common().GetAll("bs_Year");
        ddlYear.DataBind();
        DataTable dt = new dalYear().GetDefault();
        if (dt.Rows.Count > 0)
        {
            ddlYear.SelectedValue = dt.Rows[0][0].ToString();
        }
    }
    protected void LoadData()
    {   //SessionManager.SessionName.Branch = Convert.ToInt32(ddlBranch.SelectedValue);
        gvRoutine.DataSource = objRoutine.AdmissionRoutineGetByYear(Convert.ToInt32(ddlYear.SelectedValue));
        gvRoutine.DataBind();
    }
    protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadData();
    }


    protected void ddlBranch_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadData();
    }
}