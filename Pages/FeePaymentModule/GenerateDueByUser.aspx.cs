using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_FeePaymentModule_GenerateDueByUser : BasePage
{
    dalFeePayment dal = new dalFeePayment();
    List<int> EffectiveYearList = new List<int>() { 2023 };
    Dictionary<int, string> EffectiveMonthDict = new Dictionary<int, string>() { { 1, "January" }, { 2, "February" }, { 3, "March" }, { 4, "April" }, { 5, "May" }, { 6, "June" }, { 7, "July" }, { 8, "August" }, { 9, "September" }, { 10, "October" }, { 11, "November" }, { 12, "December" } };
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
            ViewState["ID"] = (int)0;
            LoadInitialData();
        }
    }

    void LoadInitialData()
    {
        ddlClass.DataSource = new Common().GetAll("bs_ClassName");
        ddlClass.DataBind();
        ddlClass.Items.Insert(0, new ListItem("---Please Select---", ""));

        ddlEffectiveYear.DataSource = EffectiveYearList;
        ddlEffectiveYear.DataBind();
        ddlEffectiveYear.Items.Insert(0, new ListItem("---Please Select---", ""));

        ddlEffectiveMonth.DataSource = EffectiveMonthDict;
        ddlEffectiveMonth.DataBind();
        ddlEffectiveMonth.Items.Insert(0, new ListItem("---Please Select---", ""));
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            var TransectionIdentifier = "ST DUE/" + Guid.NewGuid();
            var resDataRow = dal.StudentDue_Insert_ByUser(
                IsMultipleEntry: cbxMultipleEntry.Checked,
                TransectionIdentifier: TransectionIdentifier,
                EffectiveYear: Convert.ToInt32(ddlEffectiveYear.SelectedValue),
                EffectiveMonthSerial: Convert.ToInt32(ddlEffectiveMonth.SelectedValue),
                StudentId: Convert.ToInt32(tbxStudent_Id.Text),
                FeeHeadId: Convert.ToInt32(ddlFeeHead.SelectedValue),
                DefaultAmount: Convert.ToDecimal(lbl_DefaultAmount.Text),
                ConsumptionUnit: !string.IsNullOrEmpty(lbl_Mapping_ConsumptionUnit.Text) ? Convert.ToDecimal(lbl_Mapping_ConsumptionUnit.Text) : -1,
                WaiverPercentage: !string.IsNullOrEmpty(lbl_Mapping_WaiverPercentage.Text) ? Convert.ToDecimal(lbl_Mapping_WaiverPercentage.Text) : -1,
                FullAmount: Convert.ToDecimal(tbxFullAmount.Text),
                AppliedAmount: Convert.ToDecimal(tbxAppliedAmount.Text),
                ChargeBy: "User",
                ShortStatus: "Unpaid",
                LongStatus: "",
                EntryBy: SessionManager.SessionName.UserName,
                StudentFeeMappingId: string.IsNullOrEmpty(lbl_Mapping_Id.Text) ? -1 : Convert.ToInt32(lbl_Mapping_Id.Text),
                Note: "",
                DeveloperNote: ""
                );
            if (resDataRow[0].ToString() == "yes")
            {
                MessageController.Show(MessageCode.SaveSucceeded, MessageType.Information, Page);
                ClearAllAdd();
            }
            else
            {
                MessageController.Show(resDataRow[2].ToString(), MessageType.Error, Page);
            }
        }
        catch (Exception exception)
        {
            MessageController.Show("Save Failed. Please contact with admin.", MessageType.Error, Page);
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string criteria = GetCriteria();
        DataTable dt = new dalStudent().GetDetailByCriteria(criteria);
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
    protected void btnLoadStudent_Click(object sender, EventArgs e)
    {
        try
        {
            ClearAllAdd();
            var Student_Id = ((Button)sender).CommandArgument;
            DataTable dt = new dalStudent().GetDetailByCriteria(" ss_Student.Id=" + Student_Id);
            if (dt.Rows.Count > 0)
            {
                tbxStudent_Id.Text = dt.Rows[0]["Student_Id"].ToString();
                tbxStudent_RegistrationNumber.Text = dt.Rows[0]["Student_RegistrationNumber"].ToString();
                tbxStudent_Name.Text = dt.Rows[0]["Student_Name"].ToString();
                var Class_Id = dt.Rows[0]["Class_Id"].ToString();

                {
                    ddlFeeHead.Items.Clear();
                    ddlFeeHead.DataSource = new dalCommon().GetByQuery("select Id,FullName from acc_FeeHead where IsActive = 'Active'  AND (ClassId = " + dt.Rows[0]["Class_Id"].ToString() + " OR ClassId is null) order by PriorityOrder;");
                    ddlFeeHead.DataBind();
                    ddlFeeHead.Items.Insert(0, new ListItem("---Please Select---", ""));
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }

    protected void ddlFeeHead_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            lbl_DefaultAmount.Text = "";
            lbl_Mapping_Id.Text = "";
            lbl_Mapping_WaiverPercentage.Text = "";
            lbl_Mapping_ConsumptionUnit.Text = "";
            tbxFullAmount.Text = "";
            tbxAppliedAmount.Text = "";
            if (!string.IsNullOrEmpty(ddlFeeHead.SelectedValue))
            {
                DataRow row = dal.StudentFeeMapping_GetAppliedAmount(Convert.ToInt32(ddlFeeHead.SelectedValue), Convert.ToInt32(tbxStudent_Id.Text));
                lbl_DefaultAmount.Text = row["DefaultAmount"].ToString();
                lbl_Mapping_Id.Text = row["Mapping_Id"].ToString();
                lbl_Mapping_WaiverPercentage.Text = row["Mapping_WaiverPercentage"].ToString();
                lbl_Mapping_ConsumptionUnit.Text = row["Mapping_ConsumptionUnit"].ToString();
                tbxFullAmount.Text = row["FullAmount"].ToString();
                tbxAppliedAmount.Text = row["AppliedAmount"].ToString();
            }
        }
        catch (Exception ex)
        {
        }
    }
    protected string GetCriteria()
    {
        string criteria = " 1 = 1 ";
        if (!string.IsNullOrEmpty(ddlClass.SelectedValue))
        {
            criteria += " AND bs_ClassName.Id = " + ddlClass.SelectedValue + "";
        }
        if (tbxRegNo.Text != "")
        {
            criteria += " AND ss_Student.RegNo like '%" + tbxRegNo.Text + "%'";
        }
        return criteria;
    }

    protected void btnEdit_Command(object sender, CommandEventArgs e)
    {
        //int ID = Convert.ToInt32(e.CommandArgument);
        //DataTable dt = obj.GetBookLendingById(ID);
        //if (dt.Rows.Count > 0)
        //{
        //    tbxEdit_BookTrId.Text = dt.Rows[0]["TrackingId"].ToString();
        //    tbxEdit_Note.Text = dt.Rows[0]["Note"].ToString();
        //    tbxEdit_UserName.Text = dt.Rows[0]["UserName"].ToString();
        //}
        //ViewState["ID"] = ID;
        //pnlEdit.Visible = true;
        //pnlAdd.Visible = false;
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        //try
        //{
        //    int Id = (int)ViewState["ID"];
        //    var Note = tbxEdit_Note.Text;
        //    DateTime StatusUpdationDate = dalCommon.DateFormatYYYYMMDD(tbxEdit_StatusUpdationDate.Text);
        //    Button clickedButton = (Button)sender;
        //    var Status = clickedButton.CommandArgument;
        //    //int Id, DateTime ActualReturnDateTime, string Status, string Note
        //    var resDataTable = obj.UpdateBookLending(Id, StatusUpdationDate, Status, Note);

        //    if (resDataTable.Rows[0][0].ToString() == "yes")
        //    {
        //        MessageController.Show(MessageCode.SaveSucceeded, MessageType.Information, Page);
        //        ClearAllEdit();
        //        LoadGridView();
        //    }
        //    else
        //    {
        //        MessageController.Show(resDataTable.Rows[0][1].ToString(), MessageType.Warning, Page);
        //    }
        //}
        //catch (Exception ex)
        //{
        //    MessageController.Show(MessageCode.UpdateFailed, MessageType.Error, Page);
        //}
    }
    protected void ClearAllAdd()
    {
        tbxStudent_Id.Text = "";
        tbxStudent_RegistrationNumber.Text = "";
        ddlFeeHead.Items.Clear();
        tbxNote.Text = "";
        tbxStudent_Name.Text = "";
        lbl_DefaultAmount.Text = "";
        lbl_Mapping_Id.Text = "";
        lbl_Mapping_WaiverPercentage.Text = "";
        lbl_Mapping_ConsumptionUnit.Text = "";
        tbxFullAmount.Text = "";
        tbxAppliedAmount.Text = "";
        cbxMultipleEntry.Checked = false;
        //ddlEffectiveYear.SelectedIndex = 0;
        //ddlEffectiveMonth.SelectedIndex = 0;
    }

    //# Helper Methods
}


