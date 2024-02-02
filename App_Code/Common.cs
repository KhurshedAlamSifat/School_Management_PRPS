using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

using System.Web.UI.WebControls;

public class Common
{
    DatabaseManager dm = new DatabaseManager();
    public Common()
    {
    }

    public static bdoSessionInfo SessionInfo
    {
        get
        {
            try
            {
                if (HttpContext.Current.Session["SessionInfo"] != null)
                    return HttpContext.Current.Session["SessionInfo"] as bdoSessionInfo;
                else
                    return null;
            }
            catch (Exception)
            {

                return null;
            }
        }
        set
        {
            HttpContext.Current.Session["SessionInfo"] = value;
        }
    }
    public static string Button()
    {
        return SessionManager.SessionName.Button;
    }
    public DataTable GetAll(string table)
    {
        dm.AddParameteres("@Table", table);
        return dm.ExecuteQuery("USP_Get_All");
    }
    public DataTable Get_All(string table)
    {
        dm.AddParameteres("@Table", table);
        return dm.ExecuteQuery("USP_GetAll");
    }
    public int Delete(string table, int id)
    {
        dm.AddParameteres("@Table", table);
        dm.AddParameteres("@Id", id);
        return dm.ExecuteNonQuery("USP_Delete");
    }
    public int BackupDB(string filepath)
    {
        dm.AddParameteres("@filepath", filepath);
        return dm.ExecuteNonQuery("USP_BackupDB");
    }
    public DataTable NoticeBoard()
    {
        return dm.ExecuteQuery("USP_Notice_Board");
    }
    public int PersonIdByUserName(string userName)
    {
        dm.AddParameteres("@UserName", userName);
        DataTable dt = dm.ExecuteQuery("USP_PersonId_GetByUserName");
        return Convert.ToInt32(dt.Rows[0][0]);
    }
    public int GetLastRoll(string criteria)
    {
        dm.AddParameteres("@Criteria", criteria);
        DataTable dt = dm.ExecuteQuery("USP_Student_GetLastRoll");
        if (dt.Rows.Count > 0)
        {
            return Convert.ToInt32(dt.Rows[0][0]);
        }
        else
        {
            return 1;
        }

    }

    public static void LoadDropdown(DropDownList ddl, string table, int dataTextField, int dataValueField)
    {
        DataTable dt = new dalCommon().LoadDropdown(table);
        ddl.Items.Add(new ListItem("", ""));
        ddl.DataSource = dt;
        ddl.DataTextField = dt.Columns[dataTextField].ToString();
        ddl.DataValueField = dt.Columns[dataValueField].ToString();
        ddl.DataBind();
        ddl.Items.Insert(0, new ListItem("---Select---", string.Empty));
        ddl.SelectedIndex = 0;
    }
    public static void DropdownByCondition(DropDownList ddl, string table, string tableColumn, string whereby, int dataTextField, int dataValueField)
    {
        DataTable dt = new dalCommon().DropdownByCondition(table, tableColumn, whereby);
        ddl.Items.Add(new ListItem("", ""));
        ddl.DataSource = dt;
        ddl.DataTextField = dt.Columns[dataTextField].ToString();
        ddl.DataValueField = dt.Columns[dataValueField].ToString();
        ddl.DataBind();
        ddl.Items.Insert(0, new ListItem("---Select---", string.Empty));
        ddl.SelectedIndex = 0;
    }

}