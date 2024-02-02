using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for dalClass
/// </summary>
public class dalClass
{
    DatabaseManager dm = new DatabaseManager();

    public dalClass()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public int Insert(string name, int ClassNumber)
    {
        dm.AddParameteres("@Class", name);
        dm.AddParameteres("@ClassNumber", ClassNumber);
        DataTable dt= dm.ExecuteQuery("USP_Class_Insert");
        return Convert.ToInt32(dt.Rows[0][0]);
    }
    public int Update(int id, string name, int ClassNumber)
    {
        dm.AddParameteres("@Id", id);
        dm.AddParameteres("@Class", name);
        dm.AddParameteres("@ClassNumber", ClassNumber);
        return dm.ExecuteNonQuery("USP_Class_Update");
    }
    public DataTable GetById(int id)
    {
        dm.AddParameteres("@Id", id);
        return dm.ExecuteQuery ("USP_Class_GetById");
    }
}