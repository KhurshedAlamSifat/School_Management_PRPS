
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for dalRoutine
/// </summary>
public class dalRoutine
{
    DatabaseManager dm = new DatabaseManager();
	public dalRoutine()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public int ClassRoutineInsert(DataTable dt,int year, int classId, int groupId, int shiftId, int sectionId,string day)
    {
        DataSet ds = new DataSet("dsRoutine");
        ds.Tables.Add(dt);
        string xml = ds.GetXml();
        dm.AddParameteres("@Xml", xml);
        dm.AddParameteres("@Year", year);
        dm.AddParameteres("@ClassId", classId);
        dm.AddParameteres("@GroupId", groupId);
        dm.AddParameteres("@ShiftId", shiftId);
        dm.AddParameteres("@SectionId", sectionId);
        dm.AddParameteres("@Day", day);
        return dm.ExecuteNonQuery("USP_Routine_ClassRoutineInsert");
    }


    public int ExamRoutineInsert(DataTable dt, int year, int classId, int groupId, int shiftId,int examTypeId)
    {
        DataSet ds = new DataSet("dsRoutine");
        ds.Tables.Add(dt);
        string xml = ds.GetXml();
        dm.AddParameteres("@Xml", xml);
        dm.AddParameteres("@Year", year);
        dm.AddParameteres("@ClassId", classId);
        dm.AddParameteres("@GroupId", groupId);
        dm.AddParameteres("@ShiftId", shiftId);
        dm.AddParameteres("@ExamTypeId", examTypeId);
        return dm.ExecuteNonQuery("USP_Routine_ExamRoutineInsert");
    }
    public int AdmissionRoutineInsert(DataTable dt)
    {
        DataSet ds = new DataSet("dsRoutine");
        ds.Tables.Add(dt);
        string xml = ds.GetXml();
        dm.AddParameteres("@Xml", xml);
        return dm.ExecuteNonQuery("USP_Routine_AdmissionRoutineInsert");
    }
    public int AdmissionRoutineDelete(int CircularId)
    {
        dm.AddParameteres("@CircularId", CircularId);
        return dm.ExecuteNonQuery("USP_Routine_AdmissionRoutineDelete");
    }
    public DataTable AdmissionRoutineGetByYear(int Year)
    {
        dm.AddParameteres("@Year",Year);
        return dm.ExecuteQuery("USP_AddmisionRoutine_GetByYear");
    }
    public DataTable GetByCriteria(string criteria)
    {
        dm.AddParameteres("@Criteria", criteria);
        return dm.ExecuteQuery("USP_Routine_GetByCriteria");
    }

    public DataTable GetExamRoutineByCriteria(string criteria)
    {
        dm.AddParameteres("@Criteria", criteria);
        return dm.ExecuteQuery("USP_Routine_GetExamRoutineByCriteria");
    }
}