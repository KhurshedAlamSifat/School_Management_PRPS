using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for SessionInfo
/// </summary>
public class bdoSessionInfo
{
    string _ColorTheme;
    string _DateFormat;
    string _TimeFormat;
    string _TimeZone;
    string _Button;
    string _Panel;
    int _StudentToClassId;
    int _StudentId;
    int _ClassId;
    int _GroupId;
    int _ShiftId;
    int _SectionId;
    string _RegNo;

    int _userId;
    string _userName;
    int _roleId;
    int _personId;
    int _branch;
    int _rolePriority;
    DataTable _TaskList;

    public bdoSessionInfo()
    {
    }

    #region Common Members

    public string SessionID
    {
        get { return HttpContext.Current.Session.SessionID; }
    }
    public int TimeOut
    {
        get
        {
            try
            {
                return HttpContext.Current.Session.Timeout;
            }
            catch (Exception)
            {
                return 0;
            }
        }
        set
        {
            HttpContext.Current.Session.Timeout = value;
        }
    }
    #endregion

    #region GeneralConfiguration

    public string ColorTheme
    {
        get
        {
            return _ColorTheme;
        }
        set
        {
            _ColorTheme = value;
        }
    }

    public string DateFormat
    {
        get
        {
            return _DateFormat;
        }
        set
        {
            _DateFormat = value;
        }
    }
    public string Button
    {
        get
        {
            return _Button;
        }
        set
        {
            _Button = value;
        }
    }
    public string Panel
    {
        get
        {
            return _Panel;
        }
        set
        {
            _Panel = value;
        }
    }
    public string TimeZone
    {
        get
        {
            return _TimeZone;
        }
        set
        {
            _TimeZone = value;
        }
    }
    #endregion GeneralConfiguration

    #region Class Information
    public int StudentToClassId
    {
        get
        {
            return _StudentToClassId;
        }
        set
        {
            _StudentToClassId = value;
        }
    }
    public int Branch
    {
        get
        {
            return _branch;
        }
        set
        {
            _branch = value;
        }
    }

    public int StudentId
    {
        get
        {
            return _StudentId;
        }
        set
        {
            _StudentId = value;
        }
    }
    public int ClassId
    {
        get
        {
            return _ClassId;
        }
        set
        {
            _ClassId = value;
        }
    }
    public int GroupId
    {
        get
        {
            return _GroupId;
        }
        set
        {
            _GroupId = value;
        }
    }
    public int ShiftId
    {
        get
        {
            return _ShiftId;
        }
        set
        {
            _ShiftId = value;
        }
    }
    public int SectionId
    {
        get
        {
            return _SectionId;
        }
        set
        {
            _SectionId = value;
        }
    }
    public string RegNo
    {
        get
        {
            return _RegNo;
        }
        set
        {
            _RegNo = value;
        }
    }
    #endregion

    #region Users
    public int UserId
    {
        get
        {
            return _userId;
        }
        set
        {
            _userId = value;
        }
    }

    public string UserName
    {
        get
        {
            return _userName;
        }
        set
        {
            _userName = value;
        }
    }

    public int RoleId
    {
        get
        {
            return _roleId;
        }
        set
        {
            _roleId = value;
        }
    }

    public int RolePriority
    {
        get
        {
            return _rolePriority;
        }
        set
        {
            _rolePriority = value;
        }
    }

    public int PersonId
    {
        get
        {
            return _personId;
        }
        set
        {
            _personId = value;
        }
    }
    #endregion
    public DataTable TaskList
    {
        get
        {
            return _TaskList;
        }
        set
        {
            _TaskList = value;
        }
    }
}
