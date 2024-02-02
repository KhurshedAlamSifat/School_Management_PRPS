using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

public class dalAdmissionMarks
{
    DatabaseManager dm = new DatabaseManager();
    public dalAdmissionMarks()
    {
    }
    public DataTable GetApplicant(int CircularId)
    {
        dm.AddParameteres("@CircularId", CircularId);
        return dm.ExecuteQuery("USP_AddmisionMarks_GetApplicant");
    }
    public int Update(long Id, decimal Marks)
    {
        dm.AddParameteres("@Id", Id);
        dm.AddParameteres("@Marks", Marks);
        dm.AddParameteres("@UpdatedBy", SessionManager.SessionName.UserName);
        return dm.ExecuteNonQuery("USP_ApplicationMarks_Update");
    }
    public int ResultPublish(int Id)
    {
        dm.AddParameteres("@Id", Id);
        dm.AddParameteres("@UpdatedBy", SessionManager.SessionName.UserName);
        return dm.ExecuteNonQuery("USP_AdmissionResultPublish");
    }
    public DataTable AdmissionResult(string Conditions, string Limits)
    {
        dm.AddParameteres("@Conditions", Conditions);
        dm.AddParameteres("@Limit", Limits);
        return dm.ExecuteQuery("USP_AddmisionResult");
    }
    public DataTable AdmissionSelection(long Id)
    {
        dm.AddParameteres("@Id", Id);
        dm.AddParameteres("@UpdatedBy",SessionManager.SessionName.UserName);
        return dm.ExecuteQuery("USP_AddmisionSelection");
    }
    public DataTable GetApplicantQuota(long Id)
    {
        dm.AddParameteres("@Id", Id);
        return dm.ExecuteQuery("USP_Addmision_GetApplicantQuota");
    }
}