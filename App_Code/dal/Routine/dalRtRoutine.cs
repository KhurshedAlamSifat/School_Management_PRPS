using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

public class dalRtRoutine
{
    DatabaseManager dm = new DatabaseManager();
    public dalRtRoutine()
    {
    }
    public int Insert(string Period, string starttime, string endTime, int Orders, int shiftId)
    {
        dm.AddParameteres("@Period", Period);
        dm.AddParameteres("@StartTime", starttime);
        dm.AddParameteres("@EndTime", endTime);
        dm.AddParameteres("@Orders", Orders);
        dm.AddParameteres("@ShiftId", shiftId);
        DataTable dt = dm.ExecuteQuery("USP_Rt_InsertPeriod");
        return Convert.ToInt32(dt.Rows[0][0]);
    }
    public int Update(int id, string Period, string starttime, string endTime, int Orders, int shiftId)
    {
        dm.AddParameteres("@Id", id);
        dm.AddParameteres("@Period", Period);
        dm.AddParameteres("@StartTime", starttime);
        dm.AddParameteres("@EndTime", endTime);
        dm.AddParameteres("@Orders", Orders);
        dm.AddParameteres("@ShiftId", shiftId);
        return dm.ExecuteNonQuery("USP_Rt_UpdatePeriod");
    }
    public DataTable GetByAll()
    {
        return dm.ExecuteQuery("USP_Rt_GetAll");
    }
    public DataTable GetById(int Id)
    {
        dm.AddParameteres("@Id", Id);
        return dm.ExecuteQuery("USP_Rt_PeriodGetById");
    }

    public object GetPeriodByShiftId(int ShiftId)
    {
        dm.AddParameteres("@ShiftId", ShiftId);
        return dm.ExecuteQuery("USP_Rt_PeriodGetByShiftId");
    }
}