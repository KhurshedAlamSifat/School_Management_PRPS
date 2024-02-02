using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Admission_AdmissionResult : BasePage
{
    dalRoutine objRoutine = new dalRoutine();
    dalAdmissionMarks obj = new dalAdmissionMarks();
    dalAdmissionCircular objCircular = new dalAdmissionCircular();
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
            DataTable dt = new DataTable();
            dt.Columns.Add("Id");
            ViewState["dtApplicant"] = dt;
            Load();
            btnSave.Visible = false;
            pnPrint.Visible = false;
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
    protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlCircular.DataSource = objRoutine.AdmissionRoutineGetByYear(Convert.ToInt32(ddlYear.SelectedValue));
        ddlCircular.DataBind();
    }
    protected DataTable dtQuota()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Id");
        dt.Columns.Add("QuotaName");
        dt.Columns.Add("Percentage");

        return dt;
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {
            btnSave.Visible = false;
            pnPrint.Visible = true;
            lblResultTitle.Text = ddlCircular.SelectedItem.Text;
            DataTable dt = new Common().Get_All("bs_Quota");
            DataTable dtVacancy = objCircular.GetById(Convert.ToInt32(ddlCircular.SelectedValue));
            int vacancy = Convert.ToInt32(dtVacancy.Rows[0]["Vacancy"]);

            bool btn = Convert.ToBoolean(dtVacancy.Rows[0]["ResultPublished"]);
            if (!btn)
            {
                btnSave.Visible = true;
            }

            DataTable dtQ = dtQuota();
            int totalQuota = 0;

            foreach (DataRow dr in dt.Rows)
            {
                int total = Convert.ToInt32(vacancy * Convert.ToDecimal(dr["QuotaPercent"]) / 100);
                totalQuota += total;
                dtQ.Rows.Add(dr["Id"], dr["QuotaName"], total);
            }
            dtQ.Rows.Add("0", "General", vacancy - totalQuota);
            dlResult.DataSource = dtQ;
            dlResult.DataBind();
        }
        catch { }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            obj.ResultPublish(Convert.ToInt32(ddlCircular.SelectedValue));
            DataTable dt = (DataTable)ViewState["dtApplicant"];
            foreach (DataRow dr in dt.Rows)
            {

                long ApplicationId = Convert.ToInt64(dr["Id"]);
                obj.AdmissionSelection(ApplicationId);
            }
            btnSave.Visible = false;
            pnPrint.Visible = true;
            ImgPdf.Visible = true;
            //MessageController.Show(MessageCode.UpdateSucceeded, MessageType.Information, Page);
        }
        catch
        {
           // MessageController.Show(MessageCode.UpdateFailed, MessageType.Error, Page);
        }
    }
    protected void dlResult_ItemCreated(object sender, DataListItemEventArgs e)
    {
        LoadResult();
    }

    private void LoadResult()
    {
        try
        {
            foreach (DataListItem di in dlResult.Items)
            {
                HiddenField Id = (HiddenField)di.FindControl("hdnQuotaId");
                HiddenField Vacancy = (HiddenField)di.FindControl("hdnvacancy");
                GridView gvMarks = (GridView)di.FindControl("gvQuotaResult");
                string Condisitons = @"inner join ad_ApplicantsQuota q on q.ApplicationId=a.Id
where a.Marks>0 and a.CircularId=" + ddlCircular.SelectedValue + " and q.QuotaId= " + Id.Value;

                if (Id.Value == "0")
                {
                    Condisitons = @"where a.Marks>=c.PassMarks and a.CircularId=" + ddlCircular.SelectedValue;
                }
                DataTable dt = obj.AdmissionResult(Condisitons, " TOP(" + Vacancy.Value + ") ");
                gvMarks.DataSource = dt;
                gvMarks.DataBind();
                if (dt.Rows.Count > 0)
                {
                    DataTable dts = (DataTable)ViewState["dtApplicant"];
                    foreach (DataRow dr in dt.Rows)
                    {
                        dts.Rows.Add(dr["Id"]);
                    }
                    ViewState["dtApplicant"] = dts;
                }
            }
        }
        catch
        {

        }
    }
}