using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_ScheduledExecution_AutoProcessStudentInvoice : BasePage
{
    dalFeePayment dal = new dalFeePayment();
    protected void Page_Load(object sender, EventArgs e)
    {
        var response = "";
        SessionManager.SessionName.Branch = 2;
        string root_query = @"select distinct(ss_Student.Id) as Student_Id, ISNULL(ss_Student.CurrentBalance,0) as Student_CurrentBalance from ss_Student
                            join ttv_acc_StudentDue on ss_Student.Id = ttv_acc_StudentDue.StudentId
                            join acc_FeeHead on ttv_acc_StudentDue.FeeHeadId = acc_FeeHead.Id
                            where ttv_acc_StudentDue.ShortStatus = 'Unpaid' 
                            and (ttv_acc_StudentDue.AppliedAmount = 0 or ss_Student.CurrentBalance >= ttv_acc_StudentDue.AppliedAmount)";
        var root_dt = new dalCommon().GetByQuery(root_query);
        var res_TotalStudentWithAdvanceBalance = root_dt.Rows.Count;
        var res_TotalInvoiceCreated = 0;
        var res_TotalNumberOfDueFound = 0;
        var res_TotalNumberOfDuePaid = 0;

        if (root_dt.Rows.Count > 0)
        {
            foreach (DataRow root_row in root_dt.Rows)
            {
                var Student_Id = root_row["Student_Id"].ToString();
                var Student_CurrentBalance = Convert.ToDecimal(root_row["Student_CurrentBalance"]);
                try
                {
                    var dueDataTable = dal.StudentDue_Transectional_GetByCriteria(
                        StudentId: Student_Id,
                        ShortStatus: "Unpaid"
                        );
                    res_TotalNumberOfDueFound = res_TotalNumberOfDueFound + dueDataTable.Rows.Count;
                    if (dueDataTable.Rows.Count > 0)
                    {
                        if (Convert.ToDecimal(dueDataTable.Rows[0]["StudentDue_AppliedAmount"].ToString()) == 0 || Student_CurrentBalance >= Convert.ToDecimal(dueDataTable.Rows[0]["StudentDue_AppliedAmount"].ToString()))
                        {
                            var Invoice_TransectionIdentifier = "ST INVOICE/" + Guid.NewGuid();
                            var invoiceResRow = dal.StudentInvoice_Insert_ByInternalUser(
                                TransectionIdentifier: Invoice_TransectionIdentifier,
                                StudentId: Convert.ToInt32(Student_Id),
                                DepositedAmount: 0,//Convert.ToDecimal(tbxDepositedAmount.Text),
                                Status: "",
                                CreatedBy: "process",
                                Note: "",
                                DeveloperNote: ""
                                );
                            if (invoiceResRow[0].ToString() == "yes")
                                if (true)
                                {
                                    res_TotalInvoiceCreated = res_TotalInvoiceCreated + 1;
                                    var ShallPay = "Yes";
                                    foreach (DataRow due_row in dueDataTable.Rows)
                                    {
                                        var StudentDue_TransectionIdentifier = due_row["StudentDue_TransectionIdentifier"].ToString();
                                        var resRow = dal.StudentDue_Transectional_Pay_ByProcess(
                                                TransectionIdentifier: StudentDue_TransectionIdentifier,
                                                Invoice_TransectionIdentifier: Invoice_TransectionIdentifier,
                                                PaidBy: "process",
                                                ShallPay: ShallPay
                                               );
                                        if (resRow["return_status"].ToString() == "yes")
                                        {
                                            res_TotalNumberOfDuePaid = res_TotalNumberOfDuePaid + 1;
                                            //lbl_Comment.Text = "Paid";
                                        }
                                        else
                                        {
                                            ShallPay = "No";
                                            //lbl_Comment.Text = resRow["return_message"].ToString();
                                        }
                                    }
                                }
                        }
                    }
                }
                catch (Exception exception)
                {
                    var exceptionMessage = "";
                    while (exception != null)
                    {
                        exceptionMessage = exceptionMessage + exception.Message + " | ";
                        exception = exception.InnerException;
                    }
                    response = "res_TotalStudentWithAdvanceBalance=" + res_TotalStudentWithAdvanceBalance + " res_TotalInvoiceCreated=" + res_TotalInvoiceCreated +
                        " res_TotalNumberOfDueFound=" + res_TotalNumberOfDueFound + " res_TotalNumberOfDuePaid=" + res_TotalNumberOfDuePaid +
                        "   exceptionMessage= " + exceptionMessage;
                }
            }
        }
        response = "TotalStudentWithAdvanceBalance=" + res_TotalStudentWithAdvanceBalance + "  TotalInvoiceCreated=" + res_TotalInvoiceCreated +
                        "  TotalNumberOfDueFound=" + res_TotalNumberOfDueFound + "  TotalNumberOfDuePaid=" + res_TotalNumberOfDuePaid;
        resLabel.Text = response;
    }
}