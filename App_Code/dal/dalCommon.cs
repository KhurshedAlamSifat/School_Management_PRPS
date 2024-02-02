using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


/// <summary>
/// Summary description for dalCommon
/// </summary>
public class dalCommon
{
    DatabaseManager dm = new DatabaseManager();
    public dalCommon()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public DataTable GetRegistrationNo()
    {
        return dm.ExecuteQuery("USP_RegistrationNo");
    }

    public int UpdateRegistrationNo()
    {
        return dm.ExecuteNonQuery("USP_RegistrationNo_Update");
    }
    public DataTable DropdownByCondition(string table, string tableColumn, string whereby)
    {
        dm.AddParameteres("@Table", table);
        dm.AddParameteres("@Column", tableColumn);
        dm.AddParameteres("@Condition", whereby);
        return dm.ExecuteQuery("USP_GetById");
    }
    public DataTable LoadDropdown(string table)
    {
        dm.AddParameteres("@Table", table);
        return dm.ExecuteQuery("USP_Get_All");
    }
    public int GetRolePriority(int roleId)
    {
        dm.AddParameteres("@RoleId", roleId);
        DataTable dt = dm.ExecuteQuery("USP_Role_GetPriority");
        return Convert.ToInt32(dt.Rows[0][0]);
    }
    public DataTable GetAll(string table)
    {
        dm.AddParameteres("@Table", table);
        return dm.ExecuteQuery("USP_GetAll");
    }
    public DataTable GetByQuery(string query)
    {
        return dm.ExecuteRawQuery(query);
    }
    public static string RandomString(int length)
    {
        Random random = new Random();
        const string chars = "abcdefghijklmnpqrstuvwxyz123456789";
        return new string(Enumerable.Repeat(chars, length).Select(s => s[random.Next(s.Length)]).ToArray());
    }
    public static DateTime DateFormatYYYYMMDD(string date)
    {
        string[] d = date.Split('/');
        return Convert.ToDateTime(d[2] + "/" + d[1] + "/" + d[0]);
    }
    public static bool IsPermitted(string url)
    {
        bool isPermitted = false;
        if (SessionManager.SessionName.RoleId == 1)
        {
            isPermitted = true;
        }
        else
        {
            DataTable dt = (DataTable)SessionManager.SessionName.TaskList;
            foreach (DataRow dr in dt.Rows)
            {
                if (url == dr["URL"].ToString())
                {
                    isPermitted = true;
                    break;
                }
            }
        }
        return isPermitted;
    }

    public static void LoginReturnUrl(string url)
    {
        if (SessionManager.SessionName.UserName == null)
        {
            string returnUrl = "~/Login.aspx?returnUrl=~" + url;
            HttpContext.Current.Response.Redirect(returnUrl);
            //HttpContext.Current.Server.Transfer(returnUrl);
            return;
        }
    }
    public static void ExportToWord(Panel tdReportInfo, string reportName)
    {
        try
        {
            reportName = reportName + ".doc";
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.Buffer = true;
            HttpContext.Current.Response.ClearContent();
            //HttpContext.Current.Response.ClearHeaders();
            HttpContext.Current.Response.ClearHeaders();
            HttpContext.Current.Response.AddHeader("content-disposition",
            "attachment;filename=" + reportName + "");
            HttpContext.Current.Response.Charset = "";
            HttpContext.Current.Response.ContentType = "application/vnd.ms-word ";
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            tdReportInfo.RenderControl(hw);
            string html = sw.ToString();
            html = Regex.Replace(html, "</?(a|A).*?>", "");
            HttpContext.Current.Response.Output.Write(html);
            HttpContext.Current.Response.Flush();
            HttpContext.Current.Response.End();
        }
        catch (Exception ex)
        {
           

        }
    }

    public static void ExportToExcel(Panel tdReportInfo, string reportName)
    {
        try
        {
            reportName = reportName + ".xls";
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.Buffer = true;
            HttpContext.Current.Response.AddHeader("content-disposition", "attachment;filename=" + reportName + "");
            HttpContext.Current.Response.Charset = "";
            HttpContext.Current.Response.ContentType = "application/vnd.ms-excel";
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);

            tdReportInfo.RenderControl(hw);

            //style to format numbers to string
            string style = @"<style>.text-left {text-align: left;} .text-right {text-align: right;} .text-center {text-align: center;}.text-justify {text-align: justify;}.text-nowrap {white-space: nowrap;}.text-lowercase {text-transform: lowercase;}.text-uppercase {text-transform: uppercase;}.text-capitalize {text-transform: capitalize;}.img-thumbnail {display: inline-block;max-width: 100%;height: auto;padding: 4px;line-height: 1.42857143;background-color: #fff;border: 1px solid #ddd;border-radius: 4px;-webkit-transition: all .2s ease-in-out;-o-transition: all .2s ease-in-out;transition: all .2s ease-in-out;}.panel-title {margin-top: 0;margin-bottom: 0;font-size: 16px;color: inherit;}.table {width: 100%;max-width: 100%;margin-bottom: 20px;} .table {border-collapse: collapse !important;}.table td, .table th {background-color: #fff !important;}.table-bordered th, .table-bordered td {border: 1px solid #ddd !important;}.table > thead > tr > th, .table > tbody > tr > th, .table > tfoot > tr > th, .table > thead > tr > td, .table > tbody > tr > td, .table > tfoot > tr > td {padding: 8px;line-height: 1.42857143; vertical-align: top;border-top: 1px solid #ddd; text-align:left }.table > thead > tr > th {vertical-align: bottom;border-bottom: 2px solid #ddd;}.table > caption + thead > tr:first-child > th, .table > colgroup + thead > tr:first-child > th, .table > thead:first-child > tr:first-child > th, .table > caption + thead > tr:first-child > td, .table > colgroup + thead > tr:first-child > td, .table > thead:first-child > tr:first-child > td {border-top: 0;}.table > tbody + tbody {border-top: 2px solid #ddd;}.table .table {background-color: #fff;}.table-bordered {border: 1px solid #ddd;}.table-bordered > thead > tr > th, .table-bordered > tbody > tr > th, .table-bordered > tfoot > tr > th, .table-bordered > thead > tr > td, .table-bordered > tbody > tr > td, .table-bordered > tfoot > tr > td {border: 1px solid #ddd;}.table-bordered > thead > tr > th, .table-bordered > thead > tr > td {border-bottom-width: 2px;} .textmode { mso-number-format:\@; } </style>";
            HttpContext.Current.Response.Write(style);
            string html = sw.ToString();
            html = Regex.Replace(html, "</?(a|A).*?>", "");
            HttpContext.Current.Response.Output.Write(html);
            HttpContext.Current.Response.Flush();
            HttpContext.Current.Response.End();
        }
        catch (Exception ex)
        {
            
        }
    }
     public static void SendSMS(string username, string password, string SenderTitle, string MobileNumber, string message)
    {
       // string url = "https://vas.banglalinkgsm.com/sendSMS/sendSMS?msisdn=88" + MobileNumber + "&message=" + message + "&userID=PRANRFL1&passwd=d96b9e93e260c88a85b7e15fbc2afaf0&sender=" + SenderTitle;
	string url = "http://172.17.2.113/postman/api/sendsms?userid=40692&password=6a11345c43bcad458b8b632ce2d3bbc9&msisdn="+MobileNumber+"&masking=PRAN&message="+message;
        try
        {
            //string url = "http://172.17.4.97:13014/cgi-bin/sendsms?username=smsgw&password=smsgw&from=PRPS&to=01912257257&coding=2&charset=UTF-8&text=Dear Sir, This message Generated from PRPS School Management System";
            //string url = "http://172.17.4.97:13014/cgi-bin/sendsms?username=" + username + "&password=" + password + "&from=" + SenderTitle + "&to=" + MobileNumber + "&coding=2&charset=UTF-8&text=" + message;


            var httpWebRequest = (HttpWebRequest)WebRequest.Create(url);
            HttpWebResponse response = (HttpWebResponse)httpWebRequest.GetResponse();
            //WriteLog(url);
        }
        catch (Exception ex)
        {
            ErrorLog(ex.Message);
            ErrorLog(url);
        }
    }

    internal void DeleteIncomplete()
    {
        dm.ExecuteQuery("USP_DeleteIncomplete");
    }
    public static void WriteLog(string strLog)
    {
        StreamWriter log;
        FileStream fileStream = null;
        DirectoryInfo logDirInfo = null;
        FileInfo logFileInfo;

        string logFilePath = "C:\\Logs\\";
        logFilePath = logFilePath + "Log-" + System.DateTime.Today.ToString("dd-MM-yyyy") + "." + "txt";
        logFileInfo = new FileInfo(logFilePath);
        logDirInfo = new DirectoryInfo(logFileInfo.DirectoryName);
        if (!logDirInfo.Exists) logDirInfo.Create();
        if (!logFileInfo.Exists)
        {
            fileStream = logFileInfo.Create();
        }
        else
        {
            fileStream = new FileStream(logFilePath, FileMode.Append);
        }
        log = new StreamWriter(fileStream);
        log.WriteLine(SessionManager.SessionName.UserName + ": " + DateTime.Now.ToString() + " - " + strLog);
        log.Close();
    }
    public static void ErrorLog(string strLog)
    {
        StreamWriter log;
        FileStream fileStream = null;
        DirectoryInfo logDirInfo = null;
        FileInfo logFileInfo;

        string logFilePath = "C:\\Logs\\";
        logFilePath = logFilePath + "ErrorLog-" + System.DateTime.Today.ToString("dd-MM-yyyy") + "." + "txt";
        logFileInfo = new FileInfo(logFilePath);
        logDirInfo = new DirectoryInfo(logFileInfo.DirectoryName);
        if (!logDirInfo.Exists) logDirInfo.Create();
        if (!logFileInfo.Exists)
        {
            fileStream = logFileInfo.Create();
        }
        else
        {
            fileStream = new FileStream(logFilePath, FileMode.Append);
        }
        log = new StreamWriter(fileStream);
        log.WriteLine(SessionManager.SessionName.UserName + ": " + DateTime.Now.ToString() + " - " + strLog);
        log.Close();
    }
}