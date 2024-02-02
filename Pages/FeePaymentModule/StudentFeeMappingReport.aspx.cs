using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_FeePaymentModule_StudentFeeMappingReport : BasePage
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
        ddlFeeHead.DataSource = new dalCommon().GetByQuery("select * from acc_FeeHead where IsActive = 'Active' order by PriorityOrder;");
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
        DataTable dt = dal.StudentFeeMapping_GetByCriteria(
            ClassId: ddlClass.SelectedValue,
            FeeHeadId: ddlFeeHead.SelectedValue,
            GroupId: ddlGroup.SelectedValue,
            ShiftId: ddlShift.SelectedValue,
            SectionId: ddlSection.SelectedValue,
            RegistrationNumber: tbxRegNo.Text,
            FeeHeadIsActive: "Active",
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
    }

    #region Get Criteria
    #endregion
}