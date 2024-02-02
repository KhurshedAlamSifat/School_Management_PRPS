<%@ WebHandler Language="C#" Class="PI" %>

using System;
using System.Web;
using System.Data;

public class PI : IHttpHandler
{
    dalOnlinePayment obj = new dalOnlinePayment();
    public void ProcessRequest(HttpContext context)
    {
        try
        {

            if (!string.IsNullOrEmpty(HttpContext.Current.Request.QueryString["userid"]) && !string.IsNullOrEmpty(HttpContext.Current.Request.QueryString["password"]))
            {
                string username = HttpContext.Current.Request.QueryString["userid"];
                string accessKey = HttpContext.Current.Request.QueryString["password"];
                DataTable dt = obj.ValidateApiRequest(username, accessKey);
                if (dt.Rows.Count > 0)
                {
                    try
                    {
                        string RegNo = HttpContext.Current.Request.QueryString["refNo"];
                        decimal PaidAmount = string.IsNullOrEmpty(HttpContext.Current.Request.QueryString["amount"]) ? 0 : Convert.ToDecimal(HttpContext.Current.Request.QueryString["amount"]);
                        DataTable dtDues = obj.GetDues(RegNo);
                        if (dtDues.Rows.Count > 0 && PaidAmount > 0)
                        {
                            HttpContext.Current.Response.Clear();
                            HttpContext.Current.Response.ContentType = "text/plain";
                            HttpContext.Current.Response.Write("OK");
                            //Response.End();
                            //Response.Write("OK");
                        }
                        else
                        {
                            HttpContext.Current.Response.Clear();
                            HttpContext.Current.Response.ContentType = "text/plain";
                            HttpContext.Current.Response.Write("09|Bill Ref No Missing");
                            //Response.End();
                            //Response.Write("09|Bill Ref No Missing");
                        }
                    }
                    catch
                    {
                        HttpContext.Current.Response.Clear();
                        HttpContext.Current.Response.ContentType = "text/plain";
                        HttpContext.Current.Response.Write("11|Invalid Bill Amount");
                        //Response.End();
                        //Response.Write("11|Invalid Bill Amount");
                    }
                }
                else
                {
                    HttpContext.Current.Response.Clear();
                    HttpContext.Current.Response.ContentType = "text/plain";
                    HttpContext.Current.Response.Write("03|Invalid Authentication");
                    //Response.End();
                    //Response.Write("03|Invalid Authentication");
                }
            }
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.ContentType = "text/plain";
            HttpContext.Current.Response.Write("01|Invalid Basic Authentication");

            //Response.Write("01|Invalid Basic Authentication");
        }
        HttpContext.Current.Response.End();
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}