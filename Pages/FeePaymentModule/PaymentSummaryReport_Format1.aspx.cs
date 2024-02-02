using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OfficeOpenXml;
using OfficeOpenXml.Table;

public partial class Pages_FeePaymentModule_PaymentSummaryReport_Format1 : BasePage
{
    dalFeePayment dal = new dalFeePayment();
    List<int> EffectiveYearList = new List<int>() { 2022, 2023 };
    Dictionary<string, string> EffectiveMonthDict = new Dictionary<string, string>() { { "01", "January" }, { "02", "February" }, { "03", "March" }, { "04", "April" }, { "05", "May" }, { "06", "June" }, { "07", "July" }, { "08", "August" }, { "09", "September" }, { "10", "October" }, { "11", "November" }, { "12", "December" } };
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
        ddlEffectiveYear.DataSource = EffectiveYearList;
        ddlEffectiveYear.DataBind();
        ddlEffectiveYear.Items.Insert(0, new ListItem("---Please Select---", ""));

        ddlEffectiveMonth.DataSource = EffectiveMonthDict;
        ddlEffectiveMonth.DataBind();
        ddlEffectiveMonth.Items.Insert(0, new ListItem("---Please Select---", ""));
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (ddlEffectiveYear.SelectedValue == "0" || ddlEffectiveMonth.SelectedValue == "")
        {
            MessageController.Show("Please select effective year and month'.", MessageType.Warning, Page);
            return;
        }
        var PaidDateFrom = new DateTime(Convert.ToInt32(ddlEffectiveYear.SelectedValue), Convert.ToInt32(ddlEffectiveMonth.SelectedValue), 1);
        var PaidDateTo = PaidDateFrom.AddMonths(1);//.AddDays(-1);

        DataTable dt = dal.PaymentSummaryReport_Format1(
            PaidDateFrom: PaidDateFrom.ToString(),
            PaidDateTo: PaidDateTo.ToString(),
            EffectiveYearAndMonthSerial: ddlEffectiveYear.SelectedValue + "-" + ddlEffectiveMonth.SelectedValue
            );
        if (dt.Rows.Count > 0)
        {
            gvList.DataSource = dt;
            gvList.DataBind();
            btnExportToExcel.Visible = true;
            lblTotalOldBalance.Text = dt.Compute("Sum(OldBalance)", "").ToString();
            lblTotalDepositedAmount.Text = dt.Compute("Sum(DepositedAmount)", "").ToString();
            lblTotalPaidAmount.Text = dt.Compute("Sum(PaidAmount)", "").ToString();
            lblTotalRemainingBalance.Text = dt.Compute("Sum(RemainingBalance)", "").ToString();
        }
        else
        {
            gvList.DataSource = null;
            gvList.DataBind();
            btnExportToExcel.Visible = false;
            lblTotalOldBalance.Text = "";
            lblTotalDepositedAmount.Text = "";
            lblTotalPaidAmount.Text = "";
            lblTotalRemainingBalance.Text = "";
        }
    }
    protected void btnExportToExcel_Click(object sender, EventArgs e)
    {
        if (ddlEffectiveYear.SelectedValue == "0" || ddlEffectiveMonth.SelectedValue == "")
        {
            MessageController.Show("Please select effective year and month'.", MessageType.Warning, Page);
            return;
        }
        var PaidDateFrom = new DateTime(Convert.ToInt32(ddlEffectiveYear.SelectedValue), Convert.ToInt32(ddlEffectiveMonth.SelectedValue), 1);
        var PaidDateTo = PaidDateFrom.AddMonths(1);//.AddDays(-1);

        DataTable dt = dal.PaymentSummaryReport_Format1(
            PaidDateFrom: PaidDateFrom.ToString(),
            PaidDateTo: PaidDateTo.ToString(),
            EffectiveYearAndMonthSerial: ddlEffectiveYear.SelectedValue + "-" + ddlEffectiveMonth.SelectedValue
            );
        using (var excelPackage = new ExcelPackage())
        {
            var worksheet = excelPackage.Workbook.Worksheets.Add("Sheet1");
            worksheet.Cells["A1"].LoadFromDataTable(dt, true, TableStyles.None);
            using (var memoryStream = new MemoryStream())
            {
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("content-disposition", "attachment; filename=PaymentSummaryReport_Format1.xlsx");
                excelPackage.SaveAs(memoryStream);
                memoryStream.WriteTo(Response.OutputStream);
                Response.Flush();
                Response.End();
            }
        }
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
    }
    #region Get Criteria
    #endregion
}