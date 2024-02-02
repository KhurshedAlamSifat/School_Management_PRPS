using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_User_Notice : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            LoadNews();
    }

    protected void LoadNews()
    {
        DataTable dt = new Common().NoticeBoard();
        rptNews.DataSource = dt;
        rptNews.DataBind();
    }
}