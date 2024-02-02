using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_FeePaymentModule_ManageFeeHead : BasePage
{
    dalFeePayment dal = new dalFeePayment();
    protected static int ID;
    List<string> ChargeByList = new List<string>() { "System", "User", "Process" };
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
            btnSave.CssClass = Common.SessionInfo.Button;
            btnEdit.CssClass = Common.SessionInfo.Button;
            LoadInitialData();
            LoadListData();
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        //if (ddlChargeBy.SelectedValue == "System" && string.IsNullOrEmpty(ddlClassId.SelectedValue))
        //{
        //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Class is required when Charged by System')", true);
        //    return;
        //}
        var row = dal.FeeHead_Insert(
            FcCode: tbxFcCode.Text,
            FullName: tbxFullName.Text,
            DisplayName: tbxDisplayName.Text,
            ClassId: string.IsNullOrEmpty(ddlClassId.SelectedValue) ? 0 : Convert.ToInt32(ddlClassId.SelectedValue),
            ChargeBy: ddlChargeBy.SelectedValue,
            IsActive_ForWaiver: chkIsActive_ForWaiver.Checked ? "Active" : "Inactive",
            DefaultAmount: Convert.ToDecimal(tbxDefaultAmount.Text),
            PriorityOrder: Convert.ToInt32(tbxPriorityOrder.Text),
            IsActive: chkIsActive.Checked ? "Active" : "Inactive",
            IsActive_ForDueGenerationBySytem: chkIsActive_ForDueGenerationBySytem.Checked ? "Active" : "Inactive",
            CreatedBy: SessionManager.SessionName.UserName
            );
        if (row["return_status"].ToString() == "yes")
        {
            MessageController.Show(MessageCode.SaveSucceeded, MessageType.Information, Page);
        }
        else
        {
            MessageController.Show(row["return_message"].ToString(), MessageType.Error, Page);
        }
        LoadListData();
        ClearAll();
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        //if (ddlChargeBy.SelectedValue == "System" && string.IsNullOrEmpty(ddlClassId.SelectedValue))
        //{
        //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Class is required when Charged by System')", true);
        //    return;
        //}
        var row = dal.FeeHead_Update(
            Id: ID,
            FcCode: tbxFcCode.Text,
            FullName: tbxFullName.Text,
            DisplayName: tbxDisplayName.Text,
            ClassId: string.IsNullOrEmpty(ddlClassId.SelectedValue) ? 0 : Convert.ToInt32(ddlClassId.SelectedValue),
            ChargeBy: ddlChargeBy.SelectedValue,
            IsActive_ForWaiver: chkIsActive_ForWaiver.Checked ? "Active" : "Inactive",
            DefaultAmount: Convert.ToDecimal(tbxDefaultAmount.Text),
            PriorityOrder: Convert.ToInt32(tbxPriorityOrder.Text),
            IsActive: chkIsActive.Checked ? "Active" : "Inactive",
            IsActive_ForDueGenerationBySytem: chkIsActive_ForDueGenerationBySytem.Checked ? "Active" : "Inactive",
            UpdatedBy: SessionManager.SessionName.UserName
            );
        if (row["return_status"].ToString() == "yes")
        {
            MessageController.Show(MessageCode.SaveSucceeded, MessageType.Information, Page);
        }
        else
        {
            MessageController.Show(row["return_message"].ToString(), MessageType.Error, Page);
        }
        LoadListData();
        ClearAll();
    }
    protected void ClearAll()
    {
        tbxFcCode.Text = "";
        tbxFullName.Text = "";
        tbxDisplayName.Text = "";
        ddlClassId.SelectedIndex = 0;
        ddlChargeBy.SelectedIndex = 0;
        chkIsActive_ForDueGenerationBySytem.Checked = false;
        chkIsActive.Checked = false;
        tbxDefaultAmount.Text = "";
        tbxPriorityOrder.Text = "";
        chkIsActive.Checked = false;
        chkIsActive_ForDueGenerationBySytem.Checked = false;
        btnSave.Visible = true;
        btnEdit.Visible = false;
    }
    protected void LoadInitialData()
    {
        DataTable dt = new Common().GetAll("bs_ClassName");
        ddlClassId.DataSource = dt;
        ddlClassId.DataBind();
        ddlClassId.Items.Insert(0, new ListItem("---Please Select---", ""));

        ddlChargeBy.DataSource = ChargeByList;
        ddlChargeBy.DataBind();
        ddlChargeBy.Items.Insert(0, new ListItem("---Please Select---", ""));
    }
    protected void LoadListData()
    {
        string criteria = "1=1";
        DataTable dt = dal.FeeHead_GetByCriteria(criteria);
        rptYear.DataSource = dt;
        rptYear.DataBind();
    }

    protected void btnEdit_Command(object sender, CommandEventArgs e)
    {
        ID = Convert.ToInt32(e.CommandArgument);
        string criteria = "acc_FeeHead.Id=" + ID;
        DataTable dt = dal.FeeHead_GetByCriteria(criteria);
        if (dt.Rows.Count > 0)
        {
            tbxFcCode.Text = dt.Rows[0]["FcCode"].ToString();
            tbxFullName.Text = dt.Rows[0]["FullName"].ToString();
            tbxDisplayName.Text = dt.Rows[0]["DisplayName"].ToString();
            ddlClassId.SelectedIndex = ddlClassId.Items.IndexOf(ddlClassId.Items.FindByValue(dt.Rows[0]["ClassId"].ToString()));
            ddlChargeBy.SelectedIndex = ddlChargeBy.Items.IndexOf(ddlChargeBy.Items.FindByValue(dt.Rows[0]["ChargeBy"].ToString()));
            chkIsActive_ForWaiver.Checked = dt.Rows[0]["IsActive_ForWaiver"].ToString() == "Active" ? true : false;
            tbxDefaultAmount.Text = dt.Rows[0]["DefaultAmount"].ToString();
            tbxPriorityOrder.Text = dt.Rows[0]["PriorityOrder"].ToString();
            chkIsActive.Checked = dt.Rows[0]["IsActive"].ToString() == "Active" ? true : false;
            chkIsActive_ForDueGenerationBySytem.Checked = dt.Rows[0]["IsActive_ForDueGenerationBySytem"].ToString() == "Active" ? true : false;
        }
        btnSave.Visible = false;
        btnEdit.Visible = true;
    }
    //protected void btnDelete_Command(object sender, CommandEventArgs e)
    //{
    //    //ID = Convert.ToInt32(e.CommandArgument);
    //    //new Common().Delete("bs_Year", ID);
    //    //MessageController.Show(MessageCode.DeleteSucceeded, MessageType.Information, Page);
    //    //BindData();
    //}
}