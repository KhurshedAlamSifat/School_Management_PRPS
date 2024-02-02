using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sms : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request.QueryString["m"])&& !string.IsNullOrEmpty(Request.QueryString["s"]))
        {
            try
            {
                dalCommon.SendSMS("", "", "YOUR ADMIN", Request.QueryString["m"], Request.QueryString["s"]);
                Response.Write("1");
            }
            catch
            {
                Response.Write("-1");
            }
        }
        else
        {
            Response.Write("-1");
        }
    }
}