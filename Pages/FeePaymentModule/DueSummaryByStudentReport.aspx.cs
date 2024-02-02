using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_FeePaymentModule_DueSummaryByStudentReport : BasePage
{
    dalFeePayment dal = new dalFeePayment();
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
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        DataTable dt = dal.StudentDue_GetSummaryByStudent(
            ClassId: ddlClass.SelectedValue,
            GroupId: ddlGroup.SelectedValue,
            ShiftId: ddlShift.SelectedValue,
            SectionId: ddlSection.SelectedValue,
            RegistrationNumber: tbxRegNo.Text
            );
        if (dt.Rows.Count > 0)
        {
            gvList.DataSource = dt;
            gvList.DataBind();
            btnExportToExcel.Visible = true;
            lblTotalUnpaidAmount.Text = dt.Compute("Sum(Student_TotalUnpaidAmount)", "").ToString();
        }
        else
        {
            gvList.DataSource = null;
            gvList.DataBind();
            btnExportToExcel.Visible = false;
            lblTotalUnpaidAmount.Text = "";
        }
    }
    protected void btnExportToExcel_Click(object sender, EventArgs e)
    {
        Response.ClearContent();
        Response.AddHeader("content-disposition", "attachment; filename=PaymentSummaryReport_Format1.xlsx");
        Response.ContentType = "application/excel";
        StringWriter sw = new StringWriter();
        HtmlTextWriter htw = new HtmlTextWriter(sw);
        gvList.RenderControl(htw);
        string style = @"<style> td { mso-number-format:\@;} </style>";
        Response.Write(style);
        Response.Write(sw.ToString());
        Response.End();
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
    }
    #region Get Criteria
    #endregion
}