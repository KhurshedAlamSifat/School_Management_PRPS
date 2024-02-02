using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class xx : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!string.IsNullOrEmpty(Request.QueryString["username"]) && !string.IsNullOrEmpty(Request.QueryString["pasx"]) && !string.IsNullOrEmpty(Request.QueryString["mobile"]) && !string.IsNullOrEmpty(Request.QueryString["msg"]))
            {
                if (Request.QueryString["username"] == "lsmsprg" && Request.QueryString["pasx"] == "123456EWD3215gf432yu")
                {
                    dalCommon.SendSMS("", "", Request.QueryString["senderTitle"], Request.QueryString["mobile"], Request.QueryString["msg"]);
                    Response.Write("OK");
                }
                else
                {
                    Response.Write("Something is wrong.");
                }
            }
            else
            {
                Response.Write("Something is wrong.");
            }

        }
        catch (Exception ex)
        {

            Response.Write("Something is wrong.");
        }
    }
}