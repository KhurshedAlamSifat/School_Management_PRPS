using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using iTextSharp.text;
//using iTextSharp.text.html.simpleparser;
//using iTextSharp.text.pdf;

public partial class Pages_FeePaymentModule_PayStudentDueByInternalUser : BasePage
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
            LoadInitialData();
        }
    }
    void LoadInitialData()
    {
        ddlClass.DataSource = new Common().GetAll("bs_ClassName");
        ddlClass.DataBind();
        ddlClass.Items.Insert(0, new ListItem("---Please Select---", ""));
    }
    protected void btnSearch_Click(object sender, EventArgs e)
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
            btnSave.Visible = true;
            btnPrint.Visible = false;
            tbxStudent_Id.Text = "";
            tbxStudent_RegistrationNumber.Text = "";
            tbxStudent_Name.Text = "";
            tbxStudent_Class.Text = "";
            tbxStudent_Section.Text = "";
            tbxCurrentBalance.Text = "";
            var Student_Id = ((Button)sender).CommandArgument;
            DataTable studentDetailDataTable = new dalStudent().GetDetailByCriteria(" ss_Student.Id=" + Student_Id);
            if (studentDetailDataTable.Rows.Count > 0)
            {
                tbxStudent_Id.Text = studentDetailDataTable.Rows[0]["Student_Id"].ToString();
                tbxStudent_RegistrationNumber.Text = studentDetailDataTable.Rows[0]["Student_RegistrationNumber"].ToString();
                tbxStudent_Name.Text = studentDetailDataTable.Rows[0]["Student_Name"].ToString();
                tbxStudent_Class.Text = studentDetailDataTable.Rows[0]["Student_Class"].ToString();
                tbxStudent_Section.Text = studentDetailDataTable.Rows[0]["Student_Section"].ToString();
                tbxCurrentBalance.Text = studentDetailDataTable.Rows[0]["Student_CurrentBalance"].ToString();
                {
                    var dueDataTable = dal.StudentDue_Transectional_GetByCriteria(
                        StudentId: studentDetailDataTable.Rows[0]["Student_Id"].ToString(),
                        ShortStatus: "Unpaid"
                        );
                    gvStudentDue.DataSource = dueDataTable;
                    gvStudentDue.DataBind();

                    var currentBalance = Convert.ToDecimal(studentDetailDataTable.Rows[0]["Student_CurrentBalance"].ToString());
                    var totalPayable = dueDataTable.Rows.Count > 0 ? Convert.ToDecimal(dueDataTable.Compute("SUM(StudentDue_AppliedAmount)", string.Empty)) : 0;
                    tbxTotalPayable.Text = totalPayable.ToString();

                    var netPayable = totalPayable - currentBalance;
                    tbxNetPayable.Text = netPayable.ToString();
                    btnSave.Visible = true;
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            var Invoice_TransectionIdentifier = "ST INVOICE/" + Guid.NewGuid();
            var invoiceResRow = dal.StudentInvoice_Insert_ByInternalUser(
                TransectionIdentifier: Invoice_TransectionIdentifier,
                StudentId: Convert.ToInt32(tbxStudent_Id.Text),
                DepositedAmount: Convert.ToDecimal(tbxDepositedAmount.Text),
                Status: "",
                CreatedBy: SessionManager.SessionName.UserName,
                Note: "",
                DeveloperNote: ""
                );
            if (invoiceResRow[0].ToString() == "yes")
            {
                var ShallPay = "Yes";
                foreach (GridViewRow row in gvStudentDue.Rows)
                {
                    var lbl_StudentDue_TransectionIdentifier = (Label)row.FindControl("lbl_StudentDue_TransectionIdentifier");
                    var lbl_Comment = (Label)row.FindControl("lbl_Comment");
                    var resRow = dal.StudentDue_Transectional_Pay_ByInternalUser(
                            TransectionIdentifier: lbl_StudentDue_TransectionIdentifier.Text,
                            Invoice_TransectionIdentifier: Invoice_TransectionIdentifier,
                            PaidBy: SessionManager.SessionName.UserName,
                            ShallPay: ShallPay
                           );
                    if (resRow["return_status"].ToString() == "yes")
                    {
                        lbl_Comment.Text = "Paid";
                    }
                    else
                    {
                        ShallPay = "No";
                        lbl_Comment.Text = resRow["return_message"].ToString();
                    }
                }
                btnSave.Visible = false;
                btnPrint.Visible = true;
                ClearAllAdd();
                btnPrint.CommandArgument = Invoice_TransectionIdentifier.ToString();
                MessageController.Show(MessageCode.SaveSucceeded, MessageType.Information, Page);
            }
            else
            {
                MessageController.Show(invoiceResRow[2].ToString(), MessageType.Error, Page);
            }
        }
        catch (Exception exception)
        {
            MessageController.Show("Save Failed. Please contact with admin.", MessageType.Error, Page);
        }
    }
    protected void btnPrint_Click(object sender, EventArgs e)
    {
        try
        {
            var url = "/Pages/FeePaymentModule/PrintInvoice.aspx?TransectionIdentifier=" + btnPrint.CommandArgument;
            Response.Write("<script>window.open ('" + url + "','_blank');</script>");
        }
        catch (Exception exception)
        {
            MessageController.Show("Print Failed. Please contact with admin.", MessageType.Error, Page);
        }
    }
    protected void ClearAllAdd()
    {
        tbxStudent_Id.Text = "";
        tbxStudent_RegistrationNumber.Text = "";
        tbxStudent_Name.Text = "";
        tbxStudent_Class.Text = "";
        tbxStudent_Section.Text = "";

        tbxCurrentBalance.Text = "";
        tbxTotalPayable.Text = "";
        tbxNetPayable.Text = "";
        tbxDepositedAmount.Text = "0";
        tbxNextBalance.Text = "";
    }
}


