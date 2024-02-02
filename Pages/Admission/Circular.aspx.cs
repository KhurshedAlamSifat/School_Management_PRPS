using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Admission_Circular : BasePage
{
    dalAdmissionCircular obj = new dalAdmissionCircular();
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
            ViewState["ID"] = (int)0;
            LoadDropdown();
            BindData();
        }

    }
    protected void LoadDropdown()
    {

        Common.LoadDropdown(ddlYear, "bs_Year", 1, 0);
        Common.LoadDropdown(ddlClass, "bs_ClassName", 1, 0);
        DataTable dt = new dalYear().GetDefault();
        if (dt.Rows.Count > 0)
        {
            ddlYear.SelectedValue = dt.Rows[0][0].ToString();
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            string AttachFile = "";
            if (flAttachment.HasFile)
            {
                AttachFile = Guid.NewGuid() + "-" + flAttachment.FileName;
                string MediumImagePath = Server.MapPath("~/VariableContent/AdmissionCircular/" + AttachFile);
                flAttachment.SaveAs(string.Concat(MediumImagePath));

            }
            int ID = obj.Insert(Convert.ToInt32(ddlYear.SelectedValue), Convert.ToInt32(ddlClass.SelectedValue), Convert.ToDateTime(tbxStartDate.Text), Convert.ToDateTime(tbxEndDate.Text),
               Convert.ToDecimal(tbxApplicationFee.Text), tbxApplicationTitle.Text, tbxDetails.Content, AttachFile, SessionManager.SessionName.UserName, Convert.ToInt32(tbxVacancy.Text), Convert.ToDecimal(tbxAdmissionFee.Text), Convert.ToDecimal(tbxMinMarks.Text));

            MessageController.Show(MessageCode.SaveSucceeded, MessageType.Information, Page);

            BindData();
            ClearAll();
        }
        catch
        {
            MessageController.Show("Save Failed. Please contact with admin.", MessageType.Error, Page);
        }
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        try
        {
            int Id = (int)ViewState["ID"];
            obj.Update(Id, Convert.ToInt32(ddlYear.SelectedValue), Convert.ToInt32(ddlClass.SelectedValue), Convert.ToDateTime(tbxStartDate.Text), Convert.ToDateTime(tbxEndDate.Text),
                   Convert.ToDecimal(tbxApplicationFee.Text), tbxApplicationTitle.Text, tbxDetails.Content, SessionManager.SessionName.UserName, Convert.ToInt32(tbxVacancy.Text), Convert.ToDecimal(tbxAdmissionFee.Text), Convert.ToDecimal(tbxMinMarks.Text));
            MessageController.Show(MessageCode.UpdateSucceeded, MessageType.Information, Page);
            BindData();
            ClearAll();
        }
        catch
        {
            MessageController.Show(MessageCode.UpdateFailed, MessageType.Error, Page);
        }
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        ClearAll();
    }
    protected void ClearAll()
    {
        tbxApplicationTitle.Text = "";
        tbxDetails.Content = "";
        tbxEndDate.Text = "";
        tbxStartDate.Text = "";
        tbxApplicationFee.Text = "";
        tbxAdmissionFee.Text = "";
        tbxMinMarks.Text = "";
        ddlClass.SelectedIndex = 0;
        ddlYear.SelectedIndex = 0;
        btnSave.Visible = true;
        btnEdit.Visible = false;
    }
    protected void BindData()
    {
        DataTable dt = obj.GetAll();
        rptYear.DataSource = dt;
        rptYear.DataBind();
    }

    protected void btnEdit_Command(object sender, CommandEventArgs e)
    {
        int ID = Convert.ToInt32(e.CommandArgument);
        DataTable dt = obj.GetById(ID);
        if (dt.Rows.Count > 0)
        {
            tbxApplicationTitle.Text = dt.Rows[0]["Title"].ToString();
            tbxDetails.Content = dt.Rows[0]["Details"].ToString();
            tbxEndDate.Text = Convert.ToDateTime(dt.Rows[0]["EndDate"]).ToString("yyyy/MM/dd");
            tbxStartDate.Text = Convert.ToDateTime(dt.Rows[0]["StartDate"]).ToString("yyyy/MM/dd");
            tbxApplicationFee.Text = dt.Rows[0]["ApplicationFee"].ToString();
            ddlClass.SelectedValue = dt.Rows[0]["ClassId"].ToString();
            ddlYear.SelectedValue = dt.Rows[0]["Year"].ToString();
            tbxVacancy.Text=dt.Rows[0]["Vacancy"].ToString();
            tbxAdmissionFee.Text = dt.Rows[0]["AdmissionFee"].ToString();
            tbxMinMarks.Text = dt.Rows[0]["PassMarks"].ToString();
        }
        ViewState["ID"] = ID;
        btnSave.Visible = false;
        btnEdit.Visible = true;
    }
    protected void btnDelete_Command(object sender, CommandEventArgs e)
    {
        int ID = Convert.ToInt32(e.CommandArgument);
        new Common().Delete("ad_Circular", ID);
        MessageController.Show(MessageCode.DeleteSucceeded, MessageType.Information, Page);
        BindData();
    }
}