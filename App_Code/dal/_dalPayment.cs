using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;


/// <summary>
/// Summary description for dalPayment
/// </summary>
public class dalPayment
{
    DatabaseManager dm = new DatabaseManager();
    public dalPayment()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public DataTable GetPaymentByCriteria(string criteria)
    {
        dm.AddParameteres("@Criteria", criteria);
        return dm.ExecuteQuery("USP_Payment_GetByCriteria");
    }
    public int StudentPaymentInsert(string year, string month, int studentId, double total, double given, string createdBy)
    {
        dm.AddParameteres("@Year", year);
        dm.AddParameteres("@Month", month);
        dm.AddParameteres("@StudentId", studentId);
        dm.AddParameteres("@Total", total);
        dm.AddParameteres("@GivenAmount", given);
        dm.AddParameteres("@CreatedBy", createdBy);
        return dm.ExecuteNonQuery("USP_Payment_StudentPaymentInsert");
    }
    public DataTable GetPreviousPaymentByStudentId(int studentId)
    {
        dm.AddParameteres("@StudentId", studentId);
        return dm.ExecuteQuery("USP_Payment_GetPreviousPaymentByStudentId");
    }
    public DataTable GetPaymentHistoryByStudentId(int studentId)
    {
        dm.AddParameteres("@StudentId", studentId);
        return dm.ExecuteQuery("USP_Payment_GetPaymentHistoryByStudentId");
    }
    public int UpdateDues(int studentId)
    {
        dm.AddParameteres("@StudentId", studentId);
        return dm.ExecuteNonQuery("USP_Payment_UpdateDueByStudentId");
    }
    public int InsertStudentPayment(DataTable dt, string CreatedBy, DateTime CreatedDate)
    {
        DataSet ds = new DataSet("dsStudentPayment");
        ds.Tables.Add(dt);
        string xml = ds.GetXml();
        dm.AddParameteres("@XML", xml);
        dm.AddParameteres("@CreatedDate", CreatedDate);
        dm.AddParameteres("@CreatedBy", CreatedBy);
        return dm.ExecuteNonQuery("USP_Payment_InsertStudentPayment");
    }
    public int InsertScholarship(int studentid, int Year, int month, decimal amount, string remarks)
    {
        dm.AddParameteres("@StudentId", studentid);
        dm.AddParameteres("@Year", Year);
        dm.AddParameteres("@Month", month);
        dm.AddParameteres("@Amount", amount);
        dm.AddParameteres("@Remarks", remarks);
        dm.AddParameteres("@CreatedBy", SessionManager.SessionName.UserName);
        return dm.ExecuteNonQuery("USP_Payment_InsertScholarship");
    }
    public DataTable GetAllScholarshipByStudentId(int studentid)
    {
        dm.AddParameteres("@StudentId", studentid);
        return dm.ExecuteQuery("USP_Payment_ScholarshipByStudentId");
    }
    public DataTable GetAllScholarshipByStudentIdYearMonth(int studentid,int Year,int Month)
    {
        dm.AddParameteres("@StudentId", studentid);
        dm.AddParameteres("@Year", Year);
        dm.AddParameteres("@Month", Month);
        return dm.ExecuteQuery("USP_Payment_ScholarshipByStudentIdYearMonth");
    }
    public DataTable GetById(int Id)
    {
        dm.AddParameteres("@Id", Id);
        return dm.ExecuteQuery("USP_Payment_GetById");
    }
    public void UpdatePayment(int Id, int Year, int Month, decimal Amount, decimal TotalGiven, decimal DueAmount, string Mobile, string TxnId, int PaymentTypeId)
    {
        dm.AddParameteres("@Id", Id);
        dm.AddParameteres("@Year", Year);
        dm.AddParameteres("@Month", Month);
        dm.AddParameteres("@Amount", Amount);
        dm.AddParameteres("@TotalGiven", TotalGiven);
        dm.AddParameteres("@DueAmount", DueAmount);
        dm.AddParameteres("@Mobile", Mobile);
        dm.AddParameteres("@TxnID", TxnId);
        dm.AddParameteres("@PaymentTypeId",PaymentTypeId);
        dm.ExecuteNonQuery("USP_Payment_Update");
    }

    public DataTable GetPaymentSummery(string Criteria)
    {
        dm.AddParameteres("@Criteria", Criteria);
        return dm.ExecuteQuery("USP_Payment_SummeryByCriteria");
    }

    public DataTable GetPaymentHistory(string Criteria)
    {
        dm.AddParameteres("@Criteria", Criteria);
        return dm.ExecuteQuery("USP_Payment_HistoryByCriteria");
    }

    public DataTable GetDues(string Criteria)
    {
        dm.AddParameteres("@Criteria", Criteria);
        return dm.ExecuteQuery("USP_Payment_GetDues");
    }
}