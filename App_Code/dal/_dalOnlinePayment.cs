using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

public class dalOnlinePayment
{
    DatabaseManager dm = new DatabaseManager();
    public dalOnlinePayment()
    {
    }
    public DataTable GetDues(string RegNo)
    {
        dm.AddParameteres("@RegNo", RegNo);
        return dm.ExecuteQuery("USP_Payment_GetDuesByRegNo");
    }
    public DataTable GetDuesByMonthAndReg(string RegNo, int Year, int Month)
    {
        dm.AddParameteres("@RegNo", RegNo);
        dm.AddParameteres("@Year", Year);
        dm.AddParameteres("@Month", Month);
        return dm.ExecuteQuery("USP_Payment_GetDuesByMonthRegNo");
    }
    public DataTable ValidateApiRequest(string username, string AccessKey)
    {
        dm.AddParameteres("@UserName", username);
        dm.AddParameteres("@AccessKey", AccessKey);
        return dm.ExecuteQuery("USP_APIAccess_GetById");
    }
    public void InsertPaymentOnline(int StudentId, int Year, int Month, decimal Amount, string CreatedBy, string Mobile, string TxnId, int PaymentTypeId, string PayMode)
    {
        dm.AddParameteres("@StudentId", StudentId);
        dm.AddParameteres("@Year", Year);
        dm.AddParameteres("@Month", Month);
        dm.AddParameteres("@Amount", Amount);
        dm.AddParameteres("@CreatedBy", CreatedBy);
        dm.AddParameteres("@Mobile", Mobile);
        dm.AddParameteres("@TxnID", TxnId);
        dm.AddParameteres("@PaymentTypeId", PaymentTypeId);
        dm.AddParameteres("@PayMode", PayMode);
        dm.ExecuteNonQuery("USP_Payment_InsertStudentPaymentOnline");
    }
    public void InsertPaymentForStudent(int StudentId, int Year, int Month, decimal Amount, string CreatedBy, int PaymentTypeId)
    {
        dm.AddParameteres("@StudentId", StudentId);
        dm.AddParameteres("@Year", Year);
        dm.AddParameteres("@Month", Month);
        dm.AddParameteres("@Amount", Amount);
        dm.AddParameteres("@PaymentTypeId", PaymentTypeId);
        dm.AddParameteres("@CreatedBy", CreatedBy);
        dm.ExecuteNonQuery("USP_Payment_InsertForStudent");
    }
    public void InsertdbblLog(int StudentId, decimal Amount, string Mobile, string TxnId)
    {
        dm.AddParameteres("@StudentId", StudentId);
        dm.AddParameteres("@Amount", Amount);
        dm.AddParameteres("@Mobile", Mobile);
        dm.AddParameteres("@TxnID", TxnId);
        dm.ExecuteNonQuery("USP_Payment_InsertdbblLog");
    }
    public void UpdateStatus(string TxnId)
    {
        dm.AddParameteres("@TxnId", TxnId);
        dm.ExecuteQuery("USP_Payment_ConfirmOnlinePayment");
    }
}