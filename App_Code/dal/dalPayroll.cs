
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for dalPayroll
/// </summary>
public class dalPayroll
{
    DatabaseManager dm = new DatabaseManager();
	public dalPayroll()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public int InserAllowanceToType(DataTable dt, string CreatedBy, DateTime CreatedDate)
    {
        DataSet ds = new DataSet("dsAllowance");
        ds.Tables.Add(dt);
        string xml = ds.GetXml();
        dm.AddParameteres("@XML", xml);
        dm.AddParameteres("@CreatedDate", CreatedDate);
        dm.AddParameteres("@CreatedBy", CreatedBy);
        return dm.ExecuteNonQuery("USP_Payroll_InserAllowanceToType");
    }


    public int InserDeductionToType(DataTable dt, string CreatedBy, DateTime CreatedDate)
    {
        DataSet ds = new DataSet("dsDeduction");
        ds.Tables.Add(dt);
        string xml = ds.GetXml();
        dm.AddParameteres("@XML", xml);
        dm.AddParameteres("@CreatedDate", CreatedDate);
        dm.AddParameteres("@CreatedBy", CreatedBy);
        return dm.ExecuteNonQuery("USP_Payroll_InserDeductionToType");
    }
    public DataTable GetAllowanceBytypeId(int id)
    {
        dm.AddParameteres("@Id",id);
        return dm.ExecuteQuery("USP_Payroll_GetAllowanceBytypeId");
    }

    public DataTable GetDeductionBytypeId(int id)
    {
        dm.AddParameteres("@Id", id);
        return dm.ExecuteQuery("USP_Payroll_GetDeductionBytypeId");
    }


    public DataTable GetPayrollForTeacher(string pin)
    {
        dm.AddParameteres("@Pin", pin);
        return dm.ExecuteQuery("USP_Payroll_GetPayrollForTeacher");
    }

}