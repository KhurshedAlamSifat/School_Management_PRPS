using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;

/// <summary>
/// Summary description for dalSubject
/// </summary>
public class dalSubject
{
    DatabaseManager dm=new DatabaseManager();
	public dalSubject()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    

    public int Insert(int classId, int groupId, int subjectId, int categoryId, int paperNo,bool isOptional,bool ResultCount, string createdBy)
    {
        dm.AddParameteres("@ClassId",classId);
        dm.AddParameteres("@GroupId",groupId);
        dm.AddParameteres("@SubjectId",subjectId);
        dm.AddParameteres("@CategoryId",categoryId);
        dm.AddParameteres("@PaperNo",paperNo);
        dm.AddParameteres("@IsOPtional", isOptional);
        dm.AddParameteres("@ResultCount", ResultCount);
        dm.AddParameteres("@CreatedBy", createdBy);
        DataTable dt = dm.ExecuteQuery("USP_SubjectToClass_Insert");
        return Convert.ToInt32(dt.Rows[0][0]);
    }
    public DataTable GetByClassId(int classId)
    {
        dm.AddParameteres("@ClassId", classId);
        return dm.ExecuteQuery("USP_Subject_GetByClassId");
    }

    public DataTable GetByClassAndGroupId(int classId,int groupId)
    {
        dm.AddParameteres("@ClassId", classId);
        dm.AddParameteres("@GroupId", groupId);
        return dm.ExecuteQuery("USP_Subject_GetByGetByClassAndGroupId");
    }

    public int SubjectToStudentInsert(string createdBy,DataTable dt)
    {
        DataSet ds = new DataSet("dsSubject");
        ds.Tables.Add(dt);
        string xml = ds.GetXml();
        dm.AddParameteres("@CreatedBy", createdBy);
        dm.AddParameteres("@XML", xml);
        return dm.ExecuteNonQuery("USP_Subject_SubjectToStudentInsert");
    }
}