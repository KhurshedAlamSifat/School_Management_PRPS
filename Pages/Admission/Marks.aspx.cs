using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Admission_Marks : BasePage
{
    dalRoutine objRoutine = new dalRoutine();
    dalAdmissionMarks obj = new dalAdmissionMarks();
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "/Pages/Admission/" + Path.GetFileName(Request.PhysicalPath) + Request.Url.Query;
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
        DataTable dt = new dalYear().GetDefault();
        if (dt.Rows.Count > 0)
        {
            ddlYear.SelectedValue = dt.Rows[0][0].ToString();
        }
        ddlCircular.DataSource = objRoutine.AdmissionRoutineGetByYear(Convert.ToInt32(ddlYear.SelectedValue));
        ddlCircular.DataBind();

    }
    protected void ddlCircular_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetApplicant();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            foreach (GridViewRow dr in gvMarks.Rows)
            {
                CheckBox chk = (CheckBox)dr.FindControl("chkrow");
                if (chk.Checked)
                {
                    TextBox tbxMarks = (TextBox)dr.FindControl("tbxMarks");
                    long id = Convert.ToInt64(dr.Cells[1].Text);
                    obj.Update(id, Convert.ToDecimal(tbxMarks.Text));
                }
            }
            MessageController.Show(MessageCode.SaveSucceeded, MessageType.Information, Page);
        }
        catch
        { }
    }
    protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlCircular.DataSource = objRoutine.AdmissionRoutineGetByYear(Convert.ToInt32(ddlYear.SelectedValue));
        ddlCircular.DataBind();
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        GetApplicant();
    }

    private void GetApplicant()
    {
        gvMarks.DataSource = obj.GetApplicant(Convert.ToInt32(ddlCircular.SelectedValue));
        gvMarks.DataBind();
    }
}