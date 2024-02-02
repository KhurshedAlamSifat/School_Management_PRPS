
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for dalPaymentType
/// </summary>
public class dalPaymentType
{
    public dalPaymentType()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    DatabaseManager dm = new DatabaseManager();
    public int Insert(string name)
    {
        dm.AddParameteres("@Type", name);
        DataTable dt = dm.ExecuteQuery("USP_PaymentType_Insert");
        return Convert.ToInt32(dt.Rows[0][0]);
    }
    public int Update(int id, string name)
    {
        dm.AddParameteres("@Id", id);
        dm.AddParameteres("@Type", name);
        return dm.ExecuteNonQuery("USP_PaymentType_Update");
    }
    public DataTable GetById(int id)
    {
        dm.AddParameteres("@Id", id);
        return dm.ExecuteQuery("USP_PaymentType_GetById");
    }

    public DataTable GetByYear(int year, string month, int classId, int GroupId)
    {
        dm.AddParameteres("@YearId", year);
        dm.AddParameteres("@Month", month);
        dm.AddParameteres("@ClassId", classId);
        dm.AddParameteres("@GroupId", GroupId);
        return dm.ExecuteQuery("USP_PaymentType_GetByYear");
    }
    public int PaymentInsert(DataTable dt, string CreatedBy, DateTime CreatedDate,string months, int Year)
    {
        DataSet ds = new DataSet("dsPayment");
        ds.Tables.Add(dt);
        string xml = ds.GetXml();
        dm.AddParameteres("@XML", xml);
        dm.AddParameteres("@CreatedDate", CreatedDate);
        dm.AddParameteres("@CreatedBy", CreatedBy);
        dm.AddParameteres("@months", months);
        dm.AddParameteres("@Year", Year);
        return dm.ExecuteNonQuery("USP_Payment_InsertForClass");
    }
    public void PaymentInsertExcel(DataTable dt, string CreatedBy)
    {
        foreach (DataRow dr in dt.Rows)
        {
            dm.AddParameteres("@RegNo", dr["RegNo"]);
            dm.AddParameteres("@Amount", dr["Amount"]);
            dm.AddParameteres("@Year", dr["Year"]);
            dm.AddParameteres("@Month", dr["Month"]);
            dm.AddParameteres("@Feetype", dr["Feetype"]);
            dm.AddParameteres("@CreatedBy", CreatedBy);
            dm.ExecuteNonQuery("USP_Payment_InsertExcel");
        }
    }
    public void PaymentUpdate(int id, string amount,int Year, int month, int classs, int group)
    {
        dm.AddParameteres("@Id", id);
        dm.AddParameteres("@Amount", Convert.ToDecimal(amount));
        dm.AddParameteres("@UpdateddBy", SessionManager.SessionName.UserName);
        dm.AddParameteres("@Year", Year);
        dm.AddParameteres("@month", SessionManager.SessionName.UserName);
        dm.AddParameteres("@classs", classs);
        dm.AddParameteres("@group", group);
        dm.ExecuteNonQuery("USP_Payment_UpdateForClass");
    }
}