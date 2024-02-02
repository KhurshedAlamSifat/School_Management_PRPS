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

public partial class Pages_FeePaymentModule_StudentDueShortReport : BasePage
{
    dalFeePayment dal = new dalFeePayment();
    List<int> EffectiveYearList = new List<int>() { 2022, 2023 };
    Dictionary<string, string> EffectiveMonthDict = new Dictionary<string, string>() { { "01", "January" }, { "02", "February" }, { "03", "March" }, { "04", "April" }, { "05", "May" }, { "06", "June" }, { "07", "July" }, { "08", "August" }, { "09", "September" }, { "10", "October" }, { "11", "November" }, { "12", "December" } };
    Dictionary<string, string> ShortStatusDict = new Dictionary<string, string>() { { "Unpaid", "Unpaid" }, { "Paid", "Paid" } };
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "/Pages/FeePaymentModule/" + Path.GetFileName(Request.PhysicalPath);
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
            LoadInitialData();
            var Invoice_TrackingId = Request.QueryString["Invoice_TrackingId"];
            if (!string.IsNullOrEmpty(Invoice_TrackingId))
            {
                tbxInvoiceTrackingId.Text = Invoice_TrackingId;
                LoadDataForInvoice(Invoice_TrackingId);
            }
        }
    }

    void LoadInitialData()
    {
        ddlFeeHead.DataSource = new dalCommon().GetByQuery("select * from acc_FeeHead where IsActive = 'Active' AND ChargeBy = 'System' order by PriorityOrder;");
        ddlFeeHead.DataBind();
        ddlFeeHead.Items.Insert(0, new ListItem("---Please Select---", ""));

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

        ddlShortStatus.DataSource = ShortStatusDict;
        ddlShortStatus.DataBind();
        ddlShortStatus.Items.Insert(0, new ListItem("---Please Select---", ""));

        ddlEffectiveYearFrom.DataSource = EffectiveYearList;
        ddlEffectiveYearFrom.DataBind();
        ddlEffectiveYearFrom.Items.Insert(0, new ListItem("---Please Select---", ""));

        ddlEffectiveMonthFrom.DataSource = EffectiveMonthDict;
        ddlEffectiveMonthFrom.DataBind();
        ddlEffectiveMonthFrom.Items.Insert(0, new ListItem("---Please Select---", ""));

        ddlEffectiveYearTo.DataSource = EffectiveYearList;
        ddlEffectiveYearTo.DataBind();
        ddlEffectiveYearTo.Items.Insert(0, new ListItem("---Please Select---", ""));

        ddlEffectiveMonthTo.DataSource = EffectiveMonthDict;
        ddlEffectiveMonthTo.DataBind();
        ddlEffectiveMonthTo.Items.Insert(0, new ListItem("---Please Select---", ""));
    }
    protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            ddlFeeHead.Items.Clear();
            if (!string.IsNullOrEmpty(ddlClass.SelectedValue))
            {
                ddlFeeHead.DataSource = new dalCommon().GetByQuery("select * from acc_FeeHead where IsActive = 'Active' and (ClassId = " + ddlClass.SelectedValue + " OR ClassId is null) order by PriorityOrder;");
                ddlFeeHead.DataBind();
                ddlFeeHead.Items.Insert(0, new ListItem("---Please Select---", ""));
            }
            else
            {
                ddlFeeHead.DataSource = new dalCommon().GetByQuery("select * from acc_FeeHead where IsActive = 'Active' order by PriorityOrder;");
                ddlFeeHead.DataBind();
                ddlFeeHead.Items.Insert(0, new ListItem("---Please Select---", ""));
            }
        }
        catch (Exception ex)
        {
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        DataTable dt = dal.StudentDue_Transectional_GetByCriteria(
            ClassId: ddlClass.SelectedValue,
            FeeHeadId: ddlFeeHead.SelectedValue,
            GroupId: ddlGroup.SelectedValue,
            ShiftId: ddlShift.SelectedValue,
            SectionId: ddlSection.SelectedValue,
            RegistrationNumber: tbxRegNo.Text,
            EffectiveYearAndMonthSeeialFrom: (ddlEffectiveYearFrom.SelectedValue != "" && ddlEffectiveMonthFrom.SelectedValue != "") ?
            ddlEffectiveYearFrom.SelectedValue + "-" + ddlEffectiveMonthFrom.SelectedValue : "",
            EffectiveYearAndMonthSeeialTo: (ddlEffectiveYearTo.SelectedValue != "" && ddlEffectiveMonthTo.SelectedValue != "") ?
            ddlEffectiveYearTo.SelectedValue + "-" + ddlEffectiveMonthTo.SelectedValue : "",
            ShortStatus: ddlShortStatus.Text,
            PaidDateFrom: tbxPaidDateFrom.Text,
            PaidDateTo: tbxPaidDateTo.Text
            );
        if (dt.Rows.Count > 0)
        {
            gvList.DataSource = dt;
            gvList.DataBind();
            lblTotalPaidAmount.Text = dt.Compute("Sum(StudentDue_AppliedAmount)", "[StudentDue_ShortStatus]='Paid'").ToString();
            lblTotalUnpaidAmount.Text = dt.Compute("Sum(StudentDue_AppliedAmount)", "[StudentDue_ShortStatus]='Unpaid'").ToString();
        }
        else
        {
            gvList.DataSource = null;
            gvList.DataBind();
            //btnExportToExcel.Visible = false;
            lblTotalPaidAmount.Text = "";
            lblTotalUnpaidAmount.Text = "";
        }
    }
    protected void btnExportToExcel_Click(object sender, EventArgs e)
    {
        DataTable dt = dal.StudentDue_Transectional_GetByCriteria(
              ClassId: ddlClass.SelectedValue,
              FeeHeadId: ddlFeeHead.SelectedValue,
              GroupId: ddlGroup.SelectedValue,
              ShiftId: ddlShift.SelectedValue,
              SectionId: ddlSection.SelectedValue,
              RegistrationNumber: tbxRegNo.Text,
              EffectiveYearAndMonthSeeialFrom: (ddlEffectiveYearFrom.SelectedValue != "" && ddlEffectiveMonthFrom.SelectedValue != "") ?
              ddlEffectiveYearFrom.SelectedValue + "-" + ddlEffectiveMonthFrom.SelectedValue : "",
              EffectiveYearAndMonthSeeialTo: (ddlEffectiveYearTo.SelectedValue != "" && ddlEffectiveMonthTo.SelectedValue != "") ?
              ddlEffectiveYearTo.SelectedValue + "-" + ddlEffectiveMonthTo.SelectedValue : "",
              ShortStatus: ddlShortStatus.Text,
              PaidDateFrom: tbxPaidDateFrom.Text,
              PaidDateTo: tbxPaidDateTo.Text
              );
        using (var excelPackage = new ExcelPackage())
        {
            var worksheet = excelPackage.Workbook.Worksheets.Add("Sheet1");
            worksheet.Cells["A1"].LoadFromDataTable(dt, true, TableStyles.None);
            using (var memoryStream = new MemoryStream())
            {
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("content-disposition", "attachment; filename=StudentDueShortReport.xlsx");
                excelPackage.SaveAs(memoryStream);
                memoryStream.WriteTo(Response.OutputStream);
                Response.Flush();
                Response.End();
            }
        }
    }
    protected void LoadDataForInvoice(string Invoice_TrackingId)
    {
        DataTable dt = dal.StudentDue_Transectional_GetByCriteria(
                 Invoice_TrackingId: Invoice_TrackingId,
                 ShortStatus: "Paid"
                 );
        if (dt.Rows.Count > 0)
        {
            gvList.DataSource = dt;
            gvList.DataBind();
            lblTotalPaidAmount.Text = dt.Compute("Sum(StudentDue_AppliedAmount)", "[StudentDue_ShortStatus]='Paid'").ToString();
            lblTotalUnpaidAmount.Text = dt.Compute("Sum(StudentDue_AppliedAmount)", "[StudentDue_ShortStatus]='Unpaid'").ToString();
        }
        else
        {
            gvList.DataSource = null;
            gvList.DataBind();
            lblTotalPaidAmount.Text = "";
            lblTotalUnpaidAmount.Text = "";
        }
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
    }
    #region Get Criteria
    #endregion
}