using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;


/// <summary>
/// Summary description for dalUser
/// </summary>
public class dalUser
{
    DatabaseManager dm = new DatabaseManager();   
    public dalUser()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public int CreateUsers(string userName, int roleId, string password, string email, string createBy, DateTime createDate)
    {
        dm.AddParameteres("@UserName", userName);
        dm.AddParameteres("@RoleId", roleId);
        dm.AddParameteres("@Password", password);
        dm.AddParameteres("@Email", email);
        dm.AddParameteres("@CreateBy", createBy);
        dm.AddParameteres("@CreateDate", createDate);
        DataTable dt = dm.ExecuteQuery("USP_Users_Insert");
        return Convert.ToInt32(dt.Rows[0][0]);
    }
    public int Inset(int userId,string name, string mobile, string email)
    {
        dm.AddParameteres("@UserId", userId);
        dm.AddParameteres("@Name", name);
        dm.AddParameteres("@Mobile", mobile);
        dm.AddParameteres("@Email", email);
        DataTable dt = dm.ExecuteQuery("USP_Users_PersonInsert");
        return Convert.ToInt32(dt.Rows[0][0]);
    }
    public int UpdateUsers(int id, int roleId, string email, string udpateBy, DateTime updateDate)
    {
        dm.AddParameteres("@Id", id);
        dm.AddParameteres("@RoleId", roleId);
        dm.AddParameteres("@Email", email);
        dm.AddParameteres("@UpdateBy", udpateBy);
        dm.AddParameteres("@UpdateDate", updateDate);
        DataTable dt = dm.ExecuteQuery("USP_Users_Update");
        return Convert.ToInt32(dt.Rows[0][0]);
    }
    public int Delete(int id)
    {
        dm.AddParameteres("@Id", id);
        return dm.ExecuteNonQuery("USP_Users_Delete");
    }
    public int ActiveUser(string id)
    {
        dm.AddParameteres("@Id", id);
        return dm.ExecuteNonQuery("USP_Users_Active");
    }
    public int InActiveUser(string id)
    {
        dm.AddParameteres("@Id", id);
        return dm.ExecuteNonQuery("USP_Users_InActive");
    }

    public int LastLoginDate(int id)
    {
        dm.AddParameteres("@Id", id);
        return dm.ExecuteNonQuery("USP_Users_LastLogin");
    }
    public int WrongPasswordAttempt(int id)
    {
        dm.AddParameteres("@Id", id);
        return dm.ExecuteNonQuery("USP_Users_WrongPasswordAttempt");
    }

    public DataTable GetUsers()
    {
        return dm.ExecuteQuery("USP_Users_GetAll");
    }
    public DataTable GetUserById(int id)
    {
        dm.AddParameteres("@Id", id);
        return dm.ExecuteQuery("USP_Users_GetByUserId");
    }
    public DataTable GetUserByUserName(string UserName)
    {
        dm.AddParameteres("@UserName", UserName);
        return dm.ExecuteQuery("USP_Users_GetByUserName");
    }

    public DataTable GetLoginInfo(string userName, string password)
    {
        dm.AddParameteres("@UserName", userName);
        dm.AddParameteres("@Password", password);
        return dm.ExecuteQuery("USP_Users_GetLoginInfo");
    }
    public int ChangePassword(string userName, string password)
    {
        dm.AddParameteres("@UserName", userName);
        dm.AddParameteres("@Password", password);
        return dm.ExecuteNonQuery("USP_Users_ChangePassword");
    }
}