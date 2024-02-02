using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;

/// <summary>
/// Summary description for dalTeacher
/// </summary>
public class dalTeacher
{
    DatabaseManager dm = new DatabaseManager();
    public dalTeacher()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public int Insert(int personId, int designationId, string teacherPin, string NId, DateTime joinDate, string createdBy, DateTime createdDate)
    {
        dm.AddParameteres("@PersonId", personId);
        dm.AddParameteres("@DesignationId", designationId);
        dm.AddParameteres("@TeacherPin", teacherPin);
        dm.AddParameteres("@NId", NId);
        dm.AddParameteres("@JoinDate", joinDate);
        dm.AddParameteres("@CreatedBy", createdBy);
        dm.AddParameteres("@CreatedDate", createdDate);
        DataTable dt = dm.ExecuteQuery("USP_Teacher_Insert");
        return Convert.ToInt32(dt.Rows[0][0]);
    }


    public int Update(int Id, int personId, int designationId, string teacherPin, string NId, DateTime joinDate, string createdBy, DateTime createdDate)
    {
        dm.AddParameteres("@Id", Id);
        dm.AddParameteres("@PersonId", personId);
        dm.AddParameteres("@DesignationId", designationId);
        dm.AddParameteres("@TeacherPin", teacherPin);
        dm.AddParameteres("@NId", NId);
        dm.AddParameteres("@JoinDate", joinDate);
        dm.AddParameteres("@CreatedBy", createdBy);
        dm.AddParameteres("@CreatedDate", createdDate);
        DataTable dt = dm.ExecuteQuery("USP_Teacher_Update");
        return Convert.ToInt32(dt.Rows[0][0]);
    }
    public int EducationInsert(int teacherId,DataTable dt)
    {
        DataSet ds = new DataSet("dsEducation");
        ds.Tables.Add(dt);
        string xml = ds.GetXml();
        dm.AddParameteres("@TeacherId", teacherId);
        dm.AddParameteres("@Xml", xml);
        return dm.ExecuteNonQuery("USP_Teacher_EducationInsert");
    }

    public int EducationUpdate(int teacherId,DataTable dt)
    {
        DataSet ds = new DataSet("dsEducation");
        ds.Tables.Add(dt);
        string xml = ds.GetXml();
        dm.AddParameteres("@TeacherId", teacherId);
        dm.AddParameteres("@Xml", xml);
        return dm.ExecuteNonQuery("USP_Teacher_EducationUpdate");
    }
    public int TrainingInsert(int teacherId,DataTable dt)
    {
        DataSet ds = new DataSet("dsTraining");
        ds.Tables.Add(dt);
        string xml = ds.GetXml();
        dm.AddParameteres("@TeacherId", teacherId);
        dm.AddParameteres("@Xml", xml);
        return dm.ExecuteNonQuery("USP_Teacher_TrainingInsert");
    }

    public int TrainingUpdate(int teacherId,DataTable dt)
    {
        DataSet ds = new DataSet("dsTraining");
        ds.Tables.Add(dt);
        string xml = ds.GetXml();
        dm.AddParameteres("@TeacherId", teacherId);
        dm.AddParameteres("@Xml", xml);
        return dm.ExecuteNonQuery("USP_Teacher_TrainingUpdate");
    }

    public DataTable GetAll()
    {
        return dm.ExecuteQuery("USP_Teacher_GetAll");
    }

    public int AttendenceInsert(DataTable dt, string year, string month, string createdBy, DateTime createdDate)
    {
        DataSet ds = new DataSet("dsAttendence");
        ds.Tables.Add(dt);
        string xml = ds.GetXml();
        dm.AddParameteres("@XML", xml);
        dm.AddParameteres("@Year", year);
        dm.AddParameteres("@Month", month);
        dm.AddParameteres("@CreatedBy", createdBy);
        dm.AddParameteres("@CreatedDate", createdDate);
        return dm.ExecuteNonQuery("USP_Teacher_AttendenceInsert");
    }
    public DataTable GetByDate(DateTime date)
    {
        dm.AddParameteres("@Date", date);
        return dm.ExecuteQuery("USP_Teacher_AttendenceGetByDate");
    }
    public DataTable GetByPersonId(int personId)
    {
        dm.AddParameteres("@PersonId", personId);
        return dm.ExecuteQuery("USP_Teacher_GetByPersonId");
    }
    public DataTable EducationByTeacherId(int teacherId)
    {
        dm.AddParameteres("@TeacherId", teacherId);
        return dm.ExecuteQuery("USP_TeacherEducation_GetByPersonId");
    }
    public DataTable TrainingByTeacherId(int teacherId)
    {
        dm.AddParameteres("@TeacherId", teacherId);
        return dm.ExecuteQuery("USP_TeacherTraining_GetByPersonId");
    }
    public int LeaveApplication(string name, string pinCode, int designation, string subject, DateTime fromDate, DateTime toDate, string description)
    {
        dm.AddParameteres("@Name", name);
        dm.AddParameteres("@Designation", designation);
        dm.AddParameteres("@PinCode", pinCode);
        dm.AddParameteres("@Subject", subject);
        dm.AddParameteres("@FromDate", fromDate);
        dm.AddParameteres("@ToDate", toDate);
        dm.AddParameteres("@Desctiption", description);
        return dm.ExecuteNonQuery("USP_Teacher_LeaveInsert");
    }
    public int ApproveLeaveApplication(int id, DateTime approveFromDate, DateTime approveToDate, string approvedBy, DateTime approvedDate, bool status, string comment)
    {
        dm.AddParameteres("@Id", id);
        dm.AddParameteres("@ApproveFromDate", approveFromDate);
        dm.AddParameteres("@ApproveToDate", approveToDate);
        dm.AddParameteres("@ApprovedBy", approvedBy);
        dm.AddParameteres("@ApprovedDate", approvedDate);
        dm.AddParameteres("@Status", status);
        dm.AddParameteres("@Comment", comment);
        return dm.ExecuteNonQuery("USP_Teacher_LeaveApprove");
    }

    public int InsertPayScale(int typeId, int personId)
    {
        dm.AddParameteres("@TypeId", typeId);
        dm.AddParameteres("@PersonId",personId);
        return dm.ExecuteNonQuery("USP_Teacher_InsertPayScale");
    }

    public DataTable TeacherDetailsByTeacherId(int teacherId)
    {
        dm.AddParameteres("@TeacherId", teacherId);
        return dm.ExecuteQuery("USP_Teacher_GetDetailsById");
    }

}