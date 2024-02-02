using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;


public class DatabaseManager : IDisposable
{
    private String conString;
    private SqlConnection _cn;
    private DataTable _dt;
    private SqlCommand _cmd;
    private SqlDataReader _reader;
    private Dictionary<string, object> ParamList;
    public DatabaseManager()
    {
        //string db = SessionManager.SessionName.Branch == 2 ? "school2" : "school";

        //conString = "Data Source=172.17.5.103;Initial Catalog=" + db + ";Integrated Security=false; user id=sa;password=W3lc0m3;";
        //conString = "Data Source=172.17.4.235;Initial Catalog=school;Integrated Security=false; user id=sa;password=W3lc0m3;";
        ParamList = new Dictionary<string, object>();
    }
    public void Dispose()
    {
        Dispose(true);
        GC.SuppressFinalize(this);
    }

    protected virtual void Dispose(bool disposing)
    {
        if (disposing)
        {
            if (_cn != null)
            {
                _cn.Dispose();
                _cn = null;
            }
            if (_dt != null)
            {
                _dt.Dispose();
                _dt = null;
            }
            if (_cmd != null)
            {
                _cmd.Dispose();
                _cmd = null;
            }
            if (_reader != null)
            {
                _reader.Dispose();
                _reader = null;
            }
        }
    }

    ~DatabaseManager()
    {
        Dispose(false);
    }

    private static readonly Lazy<DatabaseManager> VLazy = new Lazy<DatabaseManager>(() => new DatabaseManager());

    public static DatabaseManager Instance
    {
        get { return VLazy.Value; }
    }

    public int ClearParameters()
    {
        if (ParamList != null)
        {
            if (ParamList.Count > 0)
                ParamList.Clear();
        }
        if (_cmd != null)
        {
            if (_cmd.Parameters.Count > 0)
                _cmd.Parameters.Clear();
        }
        return 1;
    }

    public void AddParameteres(string param, object value)
    {
        ParamList.Add(param, value);
    }

    public int ExecuteNonQuery(string strSql)
    {
        try
        {
            int intResult;
            string db = SessionManager.SessionName == null ? "school" : SessionManager.SessionName.Branch == 1 ? "school" : SessionManager.SessionName.Branch == 2 ? "school2" : "school3";

            var IsLiveVersion = ConfigurationManager.AppSettings["IsLiveVersion"];
            conString = IsLiveVersion == "yes" ? "Data Source=172.17.10.136;Initial Catalog=" + db + ";Integrated Security=false; user id=sa;password=asdf@1234;"
                : "Data Source=202.55.72.108,53136;Initial Catalog=" + db + ";Integrated Security=false; user id=sa;password=asdf@1234;";
            conString = "Data Source=202.55.72.108,53136;Initial Catalog=" + db + ";Integrated Security=false; user id=sa;password=asdf@1234;";
            using (_cn = new SqlConnection(conString))
            {
                _cn.Open();
                using (_cmd = new SqlCommand(strSql, _cn))
                {
                    _cmd.CommandType = CommandType.StoredProcedure;
                    foreach (KeyValuePair<string, object> dc in ParamList)
                    {
                        _cmd.Parameters.AddWithValue(dc.Key, dc.Value);
                    }

                    intResult = _cmd.ExecuteNonQuery();
                }
            }
            return intResult;
        }
        catch (Exception ex)
        {
            return 0;
            //throw (new Exception(ex.Message));

        }
        finally
        {
            ClearParameters();
        }
    }

    public DataTable ExecuteQuery(string strSql)
    {
        try
        {
            string db = SessionManager.SessionName.Branch == 1 ? "school" : SessionManager.SessionName.Branch == 2 ? "school2" : "school3";
            var IsLiveVersion = ConfigurationManager.AppSettings["IsLiveVersion"];
            conString = IsLiveVersion == "yes" ? "Data Source=172.17.10.136;Initial Catalog=" + db + ";Integrated Security=false; user id=sa;password=asdf@1234;"
                : "Data Source=202.55.72.108,53136;Initial Catalog=" + db + ";Integrated Security=false; user id=sa;password=asdf@1234;";
            conString = "Data Source=202.55.72.108,53136;Initial Catalog=" + db + ";Integrated Security=false; user id=sa;password=asdf@1234;";

            using (_cn = new SqlConnection(conString))
            {
                _cn.Open();


                using (_cmd = new SqlCommand(strSql, _cn))
                {
                    _cmd.CommandType = CommandType.StoredProcedure;
                    foreach (KeyValuePair<string, object> dc in ParamList)
                    {
                        _cmd.Parameters.AddWithValue(dc.Key, dc.Value);
                    }

                    using (_reader = _cmd.ExecuteReader())
                    {
                        _dt = new DataTable();
                        try
                        {
                            _dt.Load(_reader);
                        }
                        catch { }
                    }
                }
            }

            return _dt;
        }
        catch (Exception ex)
        {
            return null;
            //throw (new Exception(ex.Message));
        }
        finally
        {
            ClearParameters();
        }
    }
    public DataTable ExecuteRawQuery(string strSql)
    {
        try
        {
            string db = SessionManager.SessionName.Branch == 1 ? "school" : SessionManager.SessionName.Branch == 2 ? "school2" : "school3";
            var IsLiveVersion = ConfigurationManager.AppSettings["IsLiveVersion"];
            conString = IsLiveVersion == "yes" ? "Data Source=172.17.10.136;Initial Catalog=" + db + ";Integrated Security=false; user id=sa;password=asdf@1234;"
                : "Data Source=202.55.72.108,53136;Initial Catalog=" + db + ";Integrated Security=false; user id=sa;password=asdf@1234;";
            conString = "Data Source=202.55.72.108,53136;Initial Catalog=" + db + ";Integrated Security=false; user id=sa;password=asdf@1234;";

            using (_cn = new SqlConnection(conString))
            {
                _cn.Open();


                using (_cmd = new SqlCommand(strSql, _cn))
                {
                    _cmd.CommandType = CommandType.Text;
                    foreach (KeyValuePair<string, object> dc in ParamList)
                    {
                        _cmd.Parameters.AddWithValue(dc.Key, dc.Value);
                    }

                    using (_reader = _cmd.ExecuteReader())
                    {
                        _dt = new DataTable();
                        try
                        {
                            _dt.Load(_reader);
                        }
                        catch { }
                    }
                }
            }

            return _dt;
        }
        catch (Exception ex)
        {
            return null;
            //throw (new Exception(ex.Message));
        }
        finally
        {
            ClearParameters();
        }
    }
}
