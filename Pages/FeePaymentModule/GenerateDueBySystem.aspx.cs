using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_FeePaymentModule_GenerateDueBySystem : BasePage
{
    dalFeePayment dal = new dalFeePayment();
    List<int> EffectiveYearList = new List<int>() { 2023 };
    Dictionary<int, string> EffectiveMonthDict = new Dictionary<int, string>() { { 1, "January" }, { 2, "February" }, { 3, "March" }, { 4, "April" }, { 5, "May" }, { 6, "June" }, { 7, "July" }, { 8, "August" }, { 9, "September" }, { 10, "October" }, { 11, "November" }, { 12, "December" } };
    protected static bool _cbx_Mapping_WillSave_Common = false;
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
            LoadInitialData();
        }
    }

    void LoadInitialData()
    {
        ddlFeeHead.DataSource = new dalCommon().GetByQuery("select * from acc_FeeHead where ChargeBy = 'System' and IsActive= 'Active' and IsActive_ForDueGenerationBySytem= 'Active' order by PriorityOrder;");
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

        ddlEffectiveYear.DataSource = EffectiveYearList;
        ddlEffectiveYear.DataBind();
        ddlEffectiveYear.Items.Insert(0, new ListItem("---Please Select---", ""));

        ddlEffectiveMonth.DataSource = EffectiveMonthDict;
        ddlEffectiveMonth.DataBind();
        ddlEffectiveMonth.Items.Insert(0, new ListItem("---Please Select---", ""));
    }
    protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            ddlFeeHead.Items.Clear();
            if (!string.IsNullOrEmpty(ddlClass.SelectedValue))
            {
                ddlFeeHead.DataSource = new dalCommon().GetByQuery("select * from acc_FeeHead where ChargeBy = 'System' and IsActive= 'Active' and IsActive_ForDueGenerationBySytem= 'Active' and (ClassId = " + ddlClass.SelectedValue + " OR ClassId is null) order by PriorityOrder;");
                ddlFeeHead.DataBind();
                ddlFeeHead.Items.Insert(0, new ListItem("---Please Select---", ""));
            }
            else
            {
                ddlFeeHead.DataSource = new dalCommon().GetByQuery("select * from acc_FeeHead where ChargeBy = 'System' and IsActive= 'Active' and IsActive_ForDueGenerationBySytem= 'Active'  order by PriorityOrder;");
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
        DataTable dt = dal.StudentFeeMapping_GetByCriteria(
            ClassId: ddlClass.SelectedValue,
            FeeHeadId: ddlFeeHead.SelectedValue,
            GroupId: ddlGroup.SelectedValue,
            ShiftId: ddlShift.SelectedValue,
            SectionId: ddlSection.SelectedValue,
            RegistrationNumber: tbxRegNo.Text,
            FeeHeadIsActive: "Active",
            FeeHeadIsActive_ForDueGenerationBySytem: "Active",
            StudentFeeMappingIsActive: "Active"
            );
        if (dt.Rows.Count > 0)
        {
            gvList.DataSource = dt;
            gvList.DataBind();
        }
        else
        {
            gvList.DataSource = null;
            gvList.DataBind();
        }
        lbl_EntryCount.Text = dt.Rows.Count + " entry found";
    }
    protected void btnExportToExcel_Click(object sender, EventArgs e)
    {
        Response.ClearContent();
        Response.AddHeader("content-disposition", "attachment; filename=GenerateDueBySystem.xlsx");
        Response.ContentType = "application/excel";
        StringWriter sw = new StringWriter();
        HtmlTextWriter htw = new HtmlTextWriter(sw);
        gvList.RenderControl(htw);
        string style = @"<style> td { mso-number-format:\@;} </style>";
        Response.Write(style);
        Response.Write(sw.ToString());
        Response.End();
    }
    protected void btnToggleWillSave_Click(object sender, EventArgs e)
    {
        _cbx_Mapping_WillSave_Common = !_cbx_Mapping_WillSave_Common;
        foreach (GridViewRow row in gvList.Rows)
        {
            CheckBox chkcheck = (CheckBox)row.FindControl("cbx_WillSave");
            chkcheck.Checked = _cbx_Mapping_WillSave_Common;
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(ddlEffectiveYear.SelectedValue) || string.IsNullOrEmpty(ddlEffectiveMonth.SelectedValue))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Effective Year and Effective Month are required')", true);
            return;
        }
        System.Diagnostics.Debug.WriteLine("##################################### Start "+DateTime.Now);
        foreach (GridViewRow row in gvList.Rows)
        {
            CheckBox cbx_WillSave = (CheckBox)row.FindControl("cbx_WillSave");

            if (cbx_WillSave.Checked == true)
            {
                var lbl_StudentId = (Label)row.FindControl("lbl_StudentId");
                var lbl_Fee_Id = (Label)row.FindControl("lbl_Fee_Id");

                var lbl_Mapping_Id = (Label)row.FindControl("lbl_Mapping_Id");
                var lbl_Mapping_DefaultAmount = (Label)row.FindControl("lbl_Mapping_DefaultAmount");
                var lbl_Mapping_ConsumptionUnit = (Label)row.FindControl("lbl_Mapping_ConsumptionUnit");
                var lbl_Mapping_WaiverPercentage = (Label)row.FindControl("lbl_Mapping_WaiverPercentage");
                var lbl_Mapping_FullAmount = (Label)row.FindControl("lbl_Mapping_FullAmount");
                var lbl_Mapping_AppliedAmount = (Label)row.FindControl("lbl_Mapping_AppliedAmount");
                var lbl_Comment = (Label)row.FindControl("lbl_Comment");

                if (!string.IsNullOrEmpty(lbl_Fee_Id.Text))
                {
                    var TransectionIdentifier = "ST DUE/" + Guid.NewGuid();
                    var resRow = dal.StudentDue_Insert_BySystem(
                        TransectionIdentifier: TransectionIdentifier,
                        EffectiveYear: Convert.ToInt32(ddlEffectiveYear.SelectedValue),
                        EffectiveMonthSerial: Convert.ToInt32(ddlEffectiveMonth.SelectedValue),
                        StudentId: Convert.ToInt32(lbl_StudentId.Text),
                        FeeHeadId: Convert.ToInt32(lbl_Fee_Id.Text),
                        DefaultAmount: Convert.ToDecimal(lbl_Mapping_DefaultAmount.Text),
                        ConsumptionUnit: !string.IsNullOrEmpty(lbl_Mapping_ConsumptionUnit.Text) ? Convert.ToDecimal(lbl_Mapping_ConsumptionUnit.Text) : -1,
                        WaiverPercentage: !string.IsNullOrEmpty(lbl_Mapping_WaiverPercentage.Text) ? Convert.ToDecimal(lbl_Mapping_WaiverPercentage.Text) : -1,
                        FullAmount: Convert.ToDecimal(lbl_Mapping_FullAmount.Text),
                        AppliedAmount: Convert.ToDecimal(lbl_Mapping_AppliedAmount.Text),
                        ChargeBy: "System",
                        ShortStatus: "Unpaid",
                        LongStatus: "",
                        EntryBy: SessionManager.SessionName.UserName,
                        StudentFeeMappingId: Convert.ToInt32(lbl_Mapping_Id.Text),
                        Note: "",
                        DeveloperNote: ""
                        );
                    if (resRow["return_status"].ToString() == "yes")
                    {
                        lbl_Comment.Text = "Saved";
                    }
                    else
                    {
                        lbl_Comment.Text = resRow["return_message"].ToString();
                    }
                }
            }
        }
        System.Diagnostics.Debug.WriteLine("##################################### End " + DateTime.Now);

    }
    public override void VerifyRenderingInServerForm(Control control)
    {
    }
    #region Get Criteria
    #endregion
}