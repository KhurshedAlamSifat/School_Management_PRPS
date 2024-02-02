using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_FeePaymentModule_StudentInvoiceShortReport : BasePage
{
    dalFeePayment dal = new dalFeePayment();
    List<int> EffectiveYearList = new List<int>() { 2022, 2023 };
    Dictionary<string, string> EffectiveMonthDict = new Dictionary<string, string>() { { "01", "January" }, { "02", "February" }, { "03", "March" }, { "04", "April" }, { "05", "May" }, { "06", "June" }, { "07", "July" }, { "08", "August" }, { "09", "September" }, { "10", "October" }, { "11", "November" }, { "12", "December" } };
    Dictionary<string, string> ShortStatusDict = new Dictionary<string, string>() { { "Unpaid", "Unpaid" }, { "Paid", "Paid" } };
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "/Pages/FeePaymentModule/" + Path.GetFileName(Request.PhysicalPath) + Request.Url.Query;
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
            //btnSave.CssClass = Common.SessionInfo.Button;
            //btnEdit.CssClass = Common.SessionInfo.Button;
            LoadInitialData();
            //LoadListData();
        }
    }

    void LoadInitialData()
    {
        btnExportToExcel.Visible = false;

        ddlClass.DataSource = new Common().GetAll("bs_ClassName");
        ddlClass.DataBind();
        ddlClass.Items.Insert(0, new ListItem("---Please Select---", ""));

        ddlGroup.DataSource = new Common().GetAll("bs_Group");
        ddlGroup.DataBind();
        ddlGroup.Items.Insert(0, new ListItem("---Please Select---", ""));

        ddlShift.DataSource = new Common().GetAll("bs_Shift");
        ddlShift.DataBind();
        ddlShift.Items.Insert(0, new ListItem("---Please Select---", ""));

        ddlSection.DataSource = new Common().GetAll("bs_Section");
        ddlSection.DataBind();
        ddlSection.Items.Insert(0, new ListItem("---Please Select---", ""));

        //ddlShortStatus.DataSource = ShortStatusDict;
        //ddlShortStatus.DataBind();
        //ddlShortStatus.Items.Insert(0, new ListItem("---Please Select---", ""));

        tbx_PaidDateFrom.Text = "";
        tbx_PaidDateTo.Text = "";
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        DataTable dt = dal.StudentInvoice_Transectional_GetByCriteria(
            ClassId: ddlClass.SelectedValue,
            GroupId: ddlGroup.SelectedValue,
            ShiftId: ddlShift.SelectedValue,
            SectionId: ddlSection.SelectedValue,
            RegistrationNumber: tbxRegNo.Text,
            PaidDateFrom: tbx_PaidDateFrom.Text,
            PaidDateTo: tbx_PaidDateTo.Text
            );
        if (dt.Rows.Count > 0)
        {
            gvList.DataSource = dt;
            gvList.DataBind();
            btnExportToExcel.Visible = true;
            lblTotalDepositedAmount.Text = dt.Compute("Sum(StudentInvoice_DepositedAmount)", "").ToString();
        }
        else
        {
            gvList.DataSource = null;
            gvList.DataBind();
            btnExportToExcel.Visible = false;
            lblTotalDepositedAmount.Text = "";
        }
    }
    protected void btnExportToExcel_Click(object sender, EventArgs e)
    {
        Response.ClearContent();
        Response.AddHeader("content-disposition", "attachment; filename=StudentInvoiceShortReport.xlsx");
        Response.ContentType = "application/excel";
        StringWriter sw = new StringWriter();
        HtmlTextWriter htw = new HtmlTextWriter(sw);
        gvList.RenderControl(htw);
        string style = @"<style> td { mso-number-format:\@;} </style>";
        Response.Write(style);
        Response.Write(sw.ToString());
        Response.End();
    }
    protected void btn_LoadDueDetail_Click(object sender, EventArgs e)
    {
        try
        {
            var StudentInvoice_TransectionIdentifier = ((Button)sender).CommandArgument;
            try
            {
                var url = "/Pages/FeePaymentModule/PrintInvoice.aspx?TransectionIdentifier=" + StudentInvoice_TransectionIdentifier;
                Response.Write("<script>window.open ('" + url + "','_blank');</script>");
            }
            catch (Exception exception)
            {
                MessageController.Show("Print Failed. Please contact with admin.", MessageType.Error, Page);
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
    }
    #region Get Criteria
    #endregion
}