using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_User_NewsDetails : BasePage
{
    dalNews obj = new dalNews();
    public static int ID;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["ID"] != null)
            {
                ID = Convert.ToInt32(Request.QueryString["ID"]);
                LoadNews();
            }
        }
    }

    protected void LoadNews()
    {
        DataTable dt = obj.GetById(ID);
        if(dt.Rows.Count>0)
        {
            lblTitle.Text=dt.Rows[0]["Title"].ToString();
            litDetails.Text = dt.Rows[0]["Details"].ToString();
        }
    }
}