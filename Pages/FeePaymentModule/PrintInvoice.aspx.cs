using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_FeePaymentModule_PrintInvoice : BasePage
{
    dalFeePayment dal = new dalFeePayment();
    protected void Page_Load(object sender, EventArgs e)
    {
        MessageController.Clear(Page);
        string url = "/Pages/FeePaymentModule/" + Path.GetFileName(Request.PhysicalPath);
        if (SessionManager.SessionName.UserName == null)
        {
            dalCommon.LoginReturnUrl(url);
        }

        DataTable dt_SchoolInformation = new Common().GetAll("bs_SchoolInformation");
        if (dt_SchoolInformation.Rows.Count > 0)
        {
            lblSchoolName.Text = dt_SchoolInformation.Rows[0]["Name"].ToString();
            lblSchoolAddress.Text = dt_SchoolInformation.Rows[0]["Address"].ToString();
        }

        var TransectionIdentifier = Request.QueryString["TransectionIdentifier"];
        lblTransectionIdentifier.Text = TransectionIdentifier;



        DataTable dt_StudentInvoice = dal.StudentInvoice_Transectional_GetByCriteria(TransectionIdentifier: TransectionIdentifier);
        if (dt_StudentInvoice.Rows.Count > 0)
        {
            lblTrackingId.Text = dt_StudentInvoice.Rows[0]["StudentInvoice_TrackingId"].ToString();
            lblInvoiceDate.Text = Convert.ToDateTime(dt_StudentInvoice.Rows[0]["StudentInvoice_CreatedDate"].ToString()).ToString("dd/MM/yyyy");
            lblReceivedBy.Text = dt_StudentInvoice.Rows[0]["StudentInvoice_CreatedBy"].ToString();
            lblStudentInvoice_OldBalance.Text = dt_StudentInvoice.Rows[0]["StudentInvoice_OldBalance"].ToString();
            lblStudentInvoice_DepositedAmount.Text = dt_StudentInvoice.Rows[0]["StudentInvoice_DepositedAmount"].ToString();
            lblStudentInvoice_NewBalance.Text = dt_StudentInvoice.Rows[0]["StudentInvoice_NewBalance"].ToString();



            DataTable dt_StudentDetail = new dalStudent().GetDetailByCriteria(" ss_Student.Id=" + dt_StudentInvoice.Rows[0]["Student_Id"].ToString() + "");
            if (dt_StudentDetail.Rows.Count > 0)
            {
                lblStudent_Name.Text = dt_StudentDetail.Rows[0]["Student_Name"].ToString();
                lblStudent_RegistrationNumber.Text = dt_StudentDetail.Rows[0]["Student_RegistrationNumber"].ToString();
                lblStudent_Class.Text = dt_StudentDetail.Rows[0]["Student_Class"].ToString();
                lblStudent_Group.Text = dt_StudentDetail.Rows[0]["Student_Group"].ToString();
                lblStudent_Shift.Text = dt_StudentDetail.Rows[0]["Student_Shift"].ToString();
                lblStudent_Section.Text = dt_StudentDetail.Rows[0]["Student_Section"].ToString();
                lblStudentToClass_RollNo.Text = dt_StudentDetail.Rows[0]["StudentToClass_RollNo"].ToString();
            }

            DataTable dt_StudentDue_Short = dal.StudentDue_Transectional_GetByCriteria(Invoice_TransectionIdentifier: TransectionIdentifier);
            if (true)
            {
                rptDue.DataSource = dt_StudentDue_Short;
                rptDue.DataBind();

                decimal totalUnpaidPayable = 0;
                if (dt_StudentDue_Short.AsEnumerable().Any(row => row.Field<String>("StudentDue_ShortStatus") == "Unpaid"))
                {
                    totalUnpaidPayable = dt_StudentDue_Short.Rows.Count > 0 ? Convert.ToDecimal(dt_StudentDue_Short.Compute("Sum(StudentDue_AppliedAmount)", "[StudentDue_ShortStatus]='Unpaid'").ToString()) : 0;
                }

                var remainingBalance = Convert.ToDecimal(dt_StudentInvoice.Rows[0]["StudentInvoice_RemainingBalance"].ToString());

                if (totalUnpaidPayable - remainingBalance > 0)
                {
                    lblFinalBalance.Text = "Net Unpaid Payables: " + (totalUnpaidPayable - remainingBalance).ToString();
                }
                else if (totalUnpaidPayable - remainingBalance < 0)
                {
                    lblFinalBalance.Text = "Net Available Balance: " + (remainingBalance - totalUnpaidPayable).ToString();
                }
                else
                {
                    lblFinalBalance.Text = "";
                }
            }
        }

    }
}