using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;


public class dalAdmissionCircular
{
    DatabaseManager dm = new DatabaseManager();
	public dalAdmissionCircular()
	{
	}
    public int Insert(int Year,int ClassId,DateTime StartDate,DateTime EndDate,decimal ApplicationFee,string Title,
        string Details, string Attachment, string CreatedBy, int Vacancy, decimal AdmissionFee, decimal PassMarks)
    {
        dm.AddParameteres("@Year", Year);
        dm.AddParameteres("@ClassId", ClassId);
        dm.AddParameteres("@StartDate", StartDate);
        dm.AddParameteres("@EndDate", EndDate);
        dm.AddParameteres("@ApplicationFee", ApplicationFee);
        dm.AddParameteres("@Title", Title);
        dm.AddParameteres("@Details", Details);
        dm.AddParameteres("@Attachment", Attachment);
        dm.AddParameteres("@CreatedBy", CreatedBy);
        dm.AddParameteres("@Vacancy", Vacancy);
        dm.AddParameteres("@AdmissionFee", AdmissionFee);
        dm.AddParameteres("@PassMarks", PassMarks);
        return dm.ExecuteNonQuery("USP_AddmisionCircular_Insert");
    }
    public int Update(int Id, int Year, int ClassId, DateTime StartDate, DateTime EndDate, decimal ApplicationFee, string Title,
        string Details, string UpdatedBy, int Vacancy, decimal AdmissionFee, decimal PassMarks)
    {
        dm.AddParameteres("@Id", Id);
        dm.AddParameteres("@Year", Year);
        dm.AddParameteres("@ClassId", ClassId);
        dm.AddParameteres("@StartDate", StartDate);
        dm.AddParameteres("@EndDate", EndDate);
        dm.AddParameteres("@ApplicationFee", ApplicationFee);
        dm.AddParameteres("@Title", Title);
        dm.AddParameteres("@Details", Details);
        dm.AddParameteres("@UpdatedBy", UpdatedBy);
        dm.AddParameteres("@Vacancy", Vacancy);
        dm.AddParameteres("@AdmissionFee", AdmissionFee);
        dm.AddParameteres("@PassMarks", PassMarks);
        return dm.ExecuteNonQuery("USP_AddmisionCircular_Update");
    }
    public DataTable GetAll()
    {
        return dm.ExecuteQuery("USP_AddmisionCircular_GetAll");
    }
    public DataTable GetById(int id)
    {
        dm.AddParameteres("@Id", id);
        return dm.ExecuteQuery("USP_AddmisionCircular_GetById");
    }
    public DataTable GetByYear(int Year)
    {
        dm.AddParameteres("@Year", Year);
        return dm.ExecuteQuery("USP_AddmisionCircular_GetByYear");
    }
}