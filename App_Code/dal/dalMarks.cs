
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for dalMarks
/// </summary>
public class dalMarks
{
    DatabaseManager dm = new DatabaseManager();
    public dalMarks()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public int InsertMarks(DataTable dt, int year,double baseMarks, int examTypeId,decimal CTOutOf, string createdBy)
    {
        DataSet ds = new DataSet("dsMarks");
        ds.Tables.Add(dt);
        string xml = ds.GetXml();
        dm.AddParameteres("@XML",xml);
        dm.AddParameteres("@Year", year);
        dm.AddParameteres("@ExamType", examTypeId);
        dm.AddParameteres("@BaseMarks", baseMarks);
        dm.AddParameteres("@CTOutOf", CTOutOf);
        dm.AddParameteres("@CreatedBy", createdBy);
        return dm.ExecuteNonQuery("USP_Marks_InserXml");
    }
    public int UpdateMarks(DataTable dt, int year, double baseMarks, int examTypeId, decimal CTOutOf, string updatedBy)
    {
        DataSet ds = new DataSet("dsMarks");
        ds.Tables.Add(dt);
        string xml = ds.GetXml();
        dm.AddParameteres("@XML", xml);
        dm.AddParameteres("@Year", year);
        dm.AddParameteres("@BaseMarks", baseMarks);
        dm.AddParameteres("@ExamType", examTypeId);
        dm.AddParameteres("@CTOutOf", CTOutOf);
        dm.AddParameteres("@UpdatedBy", updatedBy);
        return dm.ExecuteNonQuery("USP_Marks_UpdateXml");
    }

    public DataTable GetStudentMarks(int StudentToClassId, int Year, int ExamType)
    {
        dm.AddParameteres("@StudentToClassId", StudentToClassId);
        dm.AddParameteres("@Year", Year);
        dm.AddParameteres("@ExamType", ExamType);
        return dm.ExecuteQuery("USP_Result_MarksDetails");
    }
}