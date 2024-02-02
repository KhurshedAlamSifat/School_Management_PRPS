
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for dalLibrary
/// </summary>
public class dalContent
{
    DatabaseManager dm = new DatabaseManager();
    public dalContent()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    #region 
    public DataTable InsertContent(int ClassId, int GroupId, int ShiftId, int SectionId, int Sequence, string Title, string FileName, string VisibleFileName, string YoutubeId, string Status, string CreatedBy)
    {
        if (ClassId == 0)
        {
            dm.AddParameteres("@ClassId", DBNull.Value);
        }
        else
        {
            dm.AddParameteres("@ClassId", ClassId);
        }

        if (GroupId == 0)
        {
            dm.AddParameteres("@GroupId", DBNull.Value);
        }
        else
        {
            dm.AddParameteres("@GroupId", GroupId);
        }
        if (ShiftId == 0)
        {
            dm.AddParameteres("@ShiftId", DBNull.Value);
        }
        else
        {
            dm.AddParameteres("@ShiftId", ShiftId);
        }
        if (SectionId == 0)
        {
            dm.AddParameteres("@SectionId", DBNull.Value);
        }
        else
        {
            dm.AddParameteres("@SectionId", SectionId);
        }
        dm.AddParameteres("@Sequence", Sequence);
        dm.AddParameteres("@Title", Title);
        if (string.IsNullOrEmpty(FileName))
        {
            dm.AddParameteres("@FileName", DBNull.Value);
        }
        else
        {
            dm.AddParameteres("@FileName", FileName);
        }
        if (string.IsNullOrEmpty(VisibleFileName))
        {
            dm.AddParameteres("@VisibleFileName", DBNull.Value);
        }
        else
        {
            dm.AddParameteres("@VisibleFileName", VisibleFileName);
        }
        if (string.IsNullOrEmpty(YoutubeId))
        {
            dm.AddParameteres("@YoutubeId", DBNull.Value);
        }
        else
        {
            dm.AddParameteres("@YoutubeId", YoutubeId);
        }
        dm.AddParameteres("@Status", Status);
        dm.AddParameteres("@CreatedBy", CreatedBy);
        return dm.ExecuteQuery("USP_Content_Insert");
    }
    public DataTable UpdateContent(int Id, int ClassId, int GroupId, int ShiftId, int SectionId, int Sequence, string Title, string FileName, string VisibleFileName, string YoutubeId, string Status, string UpdatedBy)
    {
        dm.AddParameteres("@Id", Id);
        dm.AddParameteres("@ClassId", ClassId);
        dm.AddParameteres("@GroupId", GroupId);
        dm.AddParameteres("@ShiftId", ShiftId);
        dm.AddParameteres("@SectionId", SectionId);
        dm.AddParameteres("@Sequence", Sequence);
        dm.AddParameteres("@Title", Title);
        dm.AddParameteres("@FileName", FileName);
        dm.AddParameteres("@VisibleFileName", VisibleFileName);
        dm.AddParameteres("@YoutubeId", YoutubeId);
        dm.AddParameteres("@Status", Status);
        dm.AddParameteres("@UpdatedBy", SessionManager.SessionName.UserName);
        return dm.ExecuteQuery("USP_Content_Update");
    }
    public DataTable GetContentByCriteria(string criteria)
    {
        dm.AddParameteres("@Criteria", criteria);
        return dm.ExecuteQuery("USP_Content_GetByCriteria");
    }
    public DataTable GetContentById(int id)
    {
        dm.AddParameteres("@Id", id);
        return dm.ExecuteQuery("USP_Content_GetById");
    }
    #endregion

}