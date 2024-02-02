
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for dalRole
/// </summary>
public class dalRole
{
    DatabaseManager dm = new DatabaseManager();
	public dalRole()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public int Insert(string roleId,string roleName,string createdBy, DateTime createDate)
    {
        dm.AddParameteres("@RoleId", roleId);
        dm.AddParameteres("@RoleName", roleName);
        dm.AddParameteres("@CreatedBy", createdBy);
        dm.AddParameteres("@CreateDate", createDate);
        DataTable dt = dm.ExecuteQuery("USP_Role_Insert");
        return Convert.ToInt32(dt.Rows[0][0]);
    }

    public int Update(string roleId, string roleName, string updatedBy, DateTime updateDate)
    {
        dm.AddParameteres("@RoleId", roleId);
        dm.AddParameteres("@RoleName", roleName);
        dm.AddParameteres("@UpdatedBy", updatedBy);
        dm.AddParameteres("@UpdateDate", updateDate);
        return dm.ExecuteNonQuery("USP_Role_Update");
        
    }
    public int UpdateRoles(string roleId,string roleName)
    {
        dm.AddParameteres("@RoleId", roleId);
        dm.AddParameteres("@RoleName", roleName);
        DataTable dt = dm.ExecuteQuery("aspnet_Roles_Update");
        return Convert.ToInt32(dt.Rows[0][0]);
    }

    public DataTable GetByRoleName(string RoleName)
    {
        dm.AddParameteres("@RoleName", RoleName);
        return dm.ExecuteQuery("USP_Role_GetByRoleName");
    }
    public DataTable GetIdByUserName(string userName)
    {
        dm.AddParameteres("@UserName", userName);
        return dm.ExecuteQuery("USP_Role_IdByUserName");
    }

    public DataTable RoleNameById(int id)
    {
        dm.AddParameteres("@Id", id);
        return dm.ExecuteQuery("USP_Role_RoleNameById");
    }

    public int Insert(string roleName, string description, int parentId, int priority, string createdBy, DateTime createDate)
    {
        dm.AddParameteres("@RoleName", roleName);
        dm.AddParameteres("@Description", description);
        dm.AddParameteres("@ParentId", parentId);
        dm.AddParameteres("@Priority", priority);
        dm.AddParameteres("@CreatedBy", createdBy);
        dm.AddParameteres("@CreateDate", createDate);
        DataTable dt = dm.ExecuteQuery("USP_Role_Insert");
        return Convert.ToInt32(dt.Rows[0][0]);
    }

    public int Update(int id, string roleName, string description, int parentId, int priority, string updateBy, DateTime updateDate)
    {
        dm.AddParameteres("@ID", id);
        dm.AddParameteres("@RoleName", roleName);
        dm.AddParameteres("@Description", description);
        dm.AddParameteres("@ParentId", parentId);
        dm.AddParameteres("@Priority", priority);
        dm.AddParameteres("@UpdateBy", updateBy);
        dm.AddParameteres("@UpdateDate", updateDate);
        DataTable dt = dm.ExecuteQuery("USP_Role_Update");
        return Convert.ToInt32(dt.Rows[0][0]);
    }

    public DataTable GetById(int id)
    {
        dm.AddParameteres("@ID", id);
        return dm.ExecuteQuery("USP_Role_GetById");
    }
    public DataTable GetAllRole()
    {
        return dm.ExecuteQuery("USP_Get_AllRole");
    }
    public int Delete(string id)
    {
        dm.AddParameteres("@Id", id);
        return dm.ExecuteNonQuery("USP_Role_Delete");
    }
}