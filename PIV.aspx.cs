using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PIV : System.Web.UI.Page
{
    dalOnlinePayment obj = new dalOnlinePayment();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!string.IsNullOrEmpty(Request.QueryString["userid"]) && !string.IsNullOrEmpty(Request.QueryString["password"]))
            {
                string username = Request.QueryString["userid"];
                string accessKey = Request.QueryString["password"];
                DataTable dt = obj.ValidateApiRequest(username, accessKey);
                if (dt.Rows.Count > 0)
                {
                    try
                    {
                        string RegNo = Request.QueryString["refNo"];
                        decimal PaidAmount = string.IsNullOrEmpty(Request.QueryString["amount"]) ? 0 : Convert.ToDecimal(Request.QueryString["amount"]);
                        DataTable dtDues = obj.GetDues(RegNo);
                        if (dtDues.Rows.Count > 0 && PaidAmount > 0)
                        {
                            Response.Clear();
                            Response.ContentType = "text/plain";
                            Response.Write("OK");
                            //Response.End();
                            //Response.Write("OK");
                        }
                        else
                        {
                            Response.Clear();
                            Response.ContentType = "text/plain";
                            Response.Write("09|Bill Ref No Missing");
                            //Response.End();
                            //Response.Write("09|Bill Ref No Missing");
                        }
                    }
                    catch
                    {
                        Response.Clear();
                        Response.ContentType = "text/plain";
                        Response.Write("11|Invalid Bill Amount");
                        //Response.End();
                        //Response.Write("11|Invalid Bill Amount");
                    }
                }
                else
                {
                    Response.Clear();
                    Response.ContentType = "text/plain";
                    Response.Write("03|Invalid Authentication");
                    //Response.End();
                    //Response.Write("03|Invalid Authentication");
                }
            }
        }
        catch (Exception ex)
        {
            Response.Clear();
            Response.ContentType = "text/plain";
            Response.Write("01|Invalid Basic Authentication");

            //Response.Write("01|Invalid Basic Authentication");
        }
        Response.End();

        //try
        //{

        //    string username = "dbill";
        //    string password = "dBILL!23";
        //    string remote_url = "http://mbsrv.dutchbanglabank.com/BillPayGWT/BillInfoService?shortcode=555&userid=cfdgc101&password=e43dft4vdytrtht&opcode=GT&txnid=23002451";

        //    //string url = "http://172.17.4.97:13014/cgi-bin/sendsms?username=smsgw&password=smsgw&from=PRPS&to=01912257257&coding=2&charset=UTF-8&text=Dear Sir, This message Generated from PRPS School Management System";
        //    //string url = "http://172.17.4.97:13014/cgi-bin/sendsms?username=" + username + "&password=" + password + "&from=" + SenderTitle + "&to=" + MobileNumber + "&coding=2&charset=UTF-8&text=" + message;

        //    var httpWebRequest = (HttpWebRequest)WebRequest.Create(remote_url);
        //    httpWebRequest.Proxy = WebRequest.DefaultWebProxy;
        //    httpWebRequest.Credentials = System.Net.CredentialCache.DefaultCredentials; ;
        //    httpWebRequest.Proxy.Credentials = System.Net.CredentialCache.DefaultCredentials;
        //    HttpWebResponse response = (HttpWebResponse)httpWebRequest.GetResponse();

        //    string res = response.StatusDescription;
        //    Response.Write(response.StatusDescription);
        //}
        //catch { }
    }
    private void GetDues(string RegNo)
    {

    }
}