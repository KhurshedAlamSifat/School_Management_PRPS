<%@ WebHandler Language="C#" Class="PIC" %>

using System;
using System.Web;
using System.Data;

public class PIC : IHttpHandler
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
                    string RegNo = HttpContext.Current.Request.QueryString["refNo"];
                    decimal PaidAmount = string.IsNullOrEmpty(HttpContext.Current.Request.QueryString["amount"]) ? 0 : Convert.ToDecimal(HttpContext.Current.Request.QueryString["amount"]);
                    DataTable dtDues = obj.GetDues(RegNo);
                    if (dtDues.Rows.Count > 0 && PaidAmount > 0)
                    {
                        int StudentId = Convert.ToInt32(dtDues.Rows[0]["Id"]);
                        int Year = 0;
                        int Month = 0;
                        decimal Amount = 0;
                        int payTypeId = 0;
                        string CreatedBy = HttpContext.Current.Request.QueryString["userid"];
                        string Mobile = "";
                        string txnNumber = HttpContext.Current.Request.QueryString["txnid"];
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
                                    break;
                                }

                            }
                            catch (Exception ex)
                            {
                                HttpContext.Current.Response.Clear();
                                HttpContext.Current.Response.ContentType = "text/plain";
                                HttpContext.Current.Response.Write(ex.Message);
                            }

                        }
                        DataTable dtStudent = new dalStudent().GetStudentInformation(" RegNo='" + RegNo + "'");

                        string msg = "Dear " + dtStudent.Rows[0]["NameEng"].ToString() + ", Your payment of BDT " + HttpContext.Current.Request.QueryString["amount"] + " is successfull. Your transaction ID is " + txnNumber + ". Keep paying your dues on time.  ---PRPS";
                        dalCommon.SendSMS("", "", "PRPS", dtStudent.Rows[0]["Mobile"].ToString(), msg);

                        HttpContext.Current.Response.Clear();
                        HttpContext.Current.Response.ContentType = "text/plain";
                        HttpContext.Current.Response.Write("OK");
                    }
                    else
                    {
                        HttpContext.Current.Response.Clear();
                        HttpContext.Current.Response.ContentType = "text/plain";
                        HttpContext.Current.Response.Write("03|Invalid Authentication");
                    }
                }
            }
        }
        catch
        {
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.ContentType = "text/plain";
            HttpContext.Current.Response.Write("99|Application Error");
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