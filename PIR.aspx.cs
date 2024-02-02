using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PIR : System.Web.UI.Page
{
    dalOnlinePayment obj = new dalOnlinePayment();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!string.IsNullOrEmpty(Request.QueryString["User_id"]) && !string.IsNullOrEmpty(Request.QueryString["Password"]))
            {
                string username = Request.QueryString["User_id"];
                string accessKey = Request.QueryString["Password"];
                DataTable dt = obj.ValidateApiRequest(username, accessKey);
                if (dt.Rows.Count > 0)
                {
                    string txnNumber = Request.QueryString["Txn_id"];
                    obj.UpdateStatus(txnNumber);
                    Response.Write("0");
                }
            }
            else
            {
                Response.Write("-1");
            }
        }
        catch (Exception ex)
        {
            Response.Write("-1");
        }
    }
}