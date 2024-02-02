using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_FeePaymentModule_ManageStudentFeeMappingForCoaching : BasePage
{
    dalFeePayment dal = new dalFeePayment();
    protected static bool _cbx_Mapping_IsActive_Common = false;
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
            //btnSave.CssClass = Common.SessionInfo.Button;
            //btnEdit.CssClass = Common.SessionInfo.Button;
            LoadInitialData();
            //LoadListData();
        }
    }

    void LoadInitialData()
    {
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
    protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            ddlFeeHead.Items.Clear();
            if (!string.IsNullOrEmpty(ddlClass.SelectedValue))
            {
                ddlFeeHead.DataSource = new dalCommon().GetByQuery("select * from acc_FeeHead where IsActive = 'Active' AND ChargeBy = 'System' and (ClassId = " + ddlClass.SelectedValue + " OR ClassId is null) " +
                    "and (FcCode like '%Course Fee%' or FcCode like '%Transport Fee%' or FcCode like '%Meal Fee%')  order by PriorityOrder;");
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
        if (string.IsNullOrEmpty(ddlClass.SelectedValue))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Class is required')", true);
            return;
        }
        if (string.IsNullOrEmpty(ddlFeeHead.SelectedValue))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Fee Heaed is required')", true);
            return;
        }
        DataTable dt = dal.StudentFeeMapping_Setup_GetByCriteria(
            ClassId: ddlClass.SelectedValue,
            FeeHeadId: ddlFeeHead.SelectedValue,
            GroupId: ddlGroup.SelectedValue,
            ShiftId: ddlShift.SelectedValue,
            SectionId: ddlSection.SelectedValue,
            RegistrationNumber: tbxRegNo.Text
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
    }
    protected void btnToggleIsActive_Click(object sender, EventArgs e)
    {
        _cbx_Mapping_IsActive_Common = !_cbx_Mapping_IsActive_Common;
        foreach (GridViewRow row in gvList.Rows)
        {
            CheckBox chkcheck = (CheckBox)row.FindControl("cbx_Mapping_IsActive");
            chkcheck.Checked = _cbx_Mapping_IsActive_Common;
        }
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
        foreach (GridViewRow row in gvList.Rows)
        {
            CheckBox cbx_WillSave = (CheckBox)row.FindControl("cbx_WillSave");
            var lbl_Fee_Id = (Label)row.FindControl("lbl_Fee_Id");
            var lbl_Fee_DefaultAmount = (Label)row.FindControl("lbl_Fee_DefaultAmount");
            var lbl_Comment = (Label)row.FindControl("lbl_Comment");
            var lbl_StudentId = (Label)row.FindControl("lbl_StudentId");
            var lbl_Mapping_Id = (Label)row.FindControl("lbl_Mapping_Id");
            var tbx_NewConsumptionUnit = (TextBox)row.FindControl("tbx_NewConsumptionUnit");
            var tbx_Mapping_AppliedAmount_New = (TextBox)row.FindControl("tbx_Mapping_AppliedAmount_New");
            var cbx_Mapping_IsActive = (CheckBox)row.FindControl("cbx_Mapping_IsActive");
            if (cbx_WillSave.Checked == true && !string.IsNullOrEmpty(lbl_Fee_Id.Text))
            {
                var resRow = dal.StudentFeeMapping_InsertOrUpdate(
                    Id: string.IsNullOrEmpty(lbl_Mapping_Id.Text) ? 0 : Convert.ToInt32(lbl_Mapping_Id.Text),
                    StudentId: Convert.ToInt32(lbl_StudentId.Text),
                    FeeHeadId: Convert.ToInt32(lbl_Fee_Id.Text),
                    DefaultAmount: Convert.ToDecimal(lbl_Fee_DefaultAmount.Text),
                    WaiverPercentage: -1,
                    ConsumptionUnit: !string.IsNullOrEmpty(tbx_NewConsumptionUnit.Text) ? Convert.ToDecimal(tbx_NewConsumptionUnit.Text) : -1,
                    FullAmount: !string.IsNullOrEmpty(tbx_Mapping_AppliedAmount_New.Text) ? Convert.ToDecimal(tbx_Mapping_AppliedAmount_New.Text) : 0,
                    AppliedAmount: !string.IsNullOrEmpty(tbx_Mapping_AppliedAmount_New.Text) ? Convert.ToDecimal(tbx_Mapping_AppliedAmount_New.Text) : 0,
                    IsActive: cbx_Mapping_IsActive.Checked ? "Active" : "Inactive",
                    EntryBy: SessionManager.SessionName.UserName
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
            else
            {
                lbl_Comment.Text = "";
            }
        }
    }
    #region Get Criteria
    protected string GetCriteria()
    {
        string criteria = "1=1 ";

        if (ddlFeeHead.SelectedValue != "")
        {
            criteria += " and FeeHeadId=" + ddlFeeHead.SelectedValue;
        }
        if (ddlClass.SelectedValue != "")
        {
            criteria += " and CurrentClassId=" + ddlClass.SelectedValue;
        }
        if (ddlGroup.SelectedValue != "")
        {
            criteria += " and CurrentGroupId=" + ddlGroup.SelectedValue;
        }
        if (ddlShift.SelectedValue != "")
        {
            criteria += " and CurrentShiftId=" + ddlShift.SelectedValue;
        }
        if (ddlSection.SelectedValue != "")
        {
            criteria += " and CurrentSectionId=" + ddlSection.SelectedValue;
        }
        if (tbxRegNo.Text != "")
        {
            if (criteria == "")
                criteria = "RegNo='" + tbxRegNo.Text + "'";
            else
                criteria += " and RegNo='" + tbxRegNo.Text + "'";
        }
        return criteria;
    }
    #endregion
}