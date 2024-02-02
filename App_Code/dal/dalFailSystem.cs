
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for dalFailSystem
/// </summary>
public class dalFailSystem
{
    DatabaseManager dm = new DatabaseManager();
	public dalFailSystem()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public int Insert(int subjectToClassId,double theory, double objective, string createdBy,double Practical)
    {
        dm.AddParameteres("@SubjectToClassId",subjectToClassId);
        dm.AddParameteres("@Theory", theory);
        dm.AddParameteres("@Objective", objective);
        dm.AddParameteres("@CreatedBy", createdBy);
        dm.AddParameteres("@Practical", Practical);
        DataTable dt=dm.ExecuteQuery("USP_FailSystem_Insert");
        return Convert.ToInt32(dt.Rows[0][0]);
    }

    public int Update(int id,int subjectToClassId, double theory, double objective, string updatedBy, double Practical)
    {
        dm.AddParameteres("@Id", id);
        dm.AddParameteres("@SubjectToClassId", subjectToClassId);
        dm.AddParameteres("@Theory", theory);
        dm.AddParameteres("@Objective", objective);
        dm.AddParameteres("@UpdatedBy", updatedBy);
        dm.AddParameteres("@Practical", Practical);
        return dm.ExecuteNonQuery("USP_FailSystem_Update");
    }
    public DataTable GetFailSystem(int classId,int groupId)
    {
        dm.AddParameteres("@ClassId", classId);
        dm.AddParameteres("@GroupId", groupId);
        return dm.ExecuteQuery("USP_FailSystem_GetByClassAndGroupId");
    }
    public DataTable GetById(int Id)
    {
        dm.AddParameteres("@Id", Id);
        return dm.ExecuteQuery("USP_FailSystem_GetById");
    }
    public DataTable GetBySubjectId(int subjectId)
    {
        dm.AddParameteres("@Id", subjectId);
        return dm.ExecuteQuery("USP_FailSystem_GetBySubjectId");
    }
}