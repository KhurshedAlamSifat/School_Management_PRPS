using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_RDIM : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["Rdim"] != null && Request.QueryString["CenterId"] != null && Request.QueryString["GateNo"] != null)
        {
            try
            {
                if (Request.QueryString["Rdim"].Length > 5)
                {
                    //new Common().InsertRFID(Request.QueryString["Rdim"],Request.QueryString["CenterId"],Request.QueryString["GateNo"]);
                    Response.Write("0");
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
        else
        {
            Response.Write(Request.QueryString["Rdim"] + Request.QueryString["CenterId"] + Request.QueryString["GateNo"]);
        }
    }
}