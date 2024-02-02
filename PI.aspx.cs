using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PI : System.Web.UI.Page
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
                    string RegNo = Request.QueryString["refNo"];
                    decimal PaidAmount = string.IsNullOrEmpty(Request.QueryString["amount"]) ? 0 : Convert.ToDecimal(Request.QueryString["amount"]);
                    DataTable dtDues = obj.GetDues(RegNo);
                    if (dtDues.Rows.Count > 0 && PaidAmount > 0)
                    {
                        int StudentId = Convert.ToInt32(dtDues.Rows[0]["Id"]);
                        int Year = 0;
                        int Month = 0;
                        decimal Amount = 0;
                        int payTypeId = 0;
                        string CreatedBy = Request.QueryString["userid"];
                        string Mobile = "";
                        string txnNumber = Request.QueryString["txnid"];
                        obj.InsertdbblLog(StudentId, PaidAmount, Mobile, txnNumber);
                        foreach (DataRow dr in dtDues.Rows)
                        {
                            Year = Convert.ToInt32(dr["Year"]);
                            Month = Convert.ToInt32(dr["Month"]);
                            payTypeId = string.IsNullOrEmpty(dr["PaymentTypeId"].ToString()) ? 0 : Convert.ToInt32(dr["PaymentTypeId"]);

                            Amount = Convert.ToDecimal(dr["Amount"]);
                            try
                            {

                                if (PaidAmount > Amount)
                                {
                                    obj.InsertPaymentOnline(StudentId, Year, Month, Amount, CreatedBy, Mobile, txnNumber, payTypeId, "DBBL");
                                    PaidAmount -= Amount;
                                }
                                else
                                {
                                    obj.InsertPaymentOnline(StudentId, Year, Month, PaidAmount, CreatedBy, Mobile, txnNumber, payTypeId, "DBBL");
                                }

                            }
                            catch (Exception ex)
                            {
                                Response.Write(ex.Message);
                            }

                        }
                        Response.Write("OK");
                        DataTable dtStudent = new dalStudent().GetStudentInformation(" RegNo='" + RegNo + "'");

                        string msg = "Dear " + dtStudent.Rows[0]["NameEng"].ToString() + ", Your payment of BDT " + Request.QueryString["amount"] + " is successfull. Your transaction ID is " + txnNumber + ". Keep paying your dues on time.  ---PRPS";
                        dalCommon.SendSMS("", "", "PRPS", dtStudent.Rows[0]["Mobile"].ToString(), msg);
                    }
                    else
                    {
                        Response.Write("-1");
                    }
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }


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