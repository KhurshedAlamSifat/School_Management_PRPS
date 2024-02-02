using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_User_Gallery : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("ImageUrl");
            dt.Columns.Add("Title");
            foreach (var files in Directory.GetFiles(Server.MapPath("~/VariableContent/gallery")).OrderByDescending(d=> new FileInfo(d).CreationTime))
            {
                FileInfo info = new FileInfo(files);
                var fileName = Path.GetFileName(info.FullName);
                var title = Path.GetFileNameWithoutExtension(info.Name);
                dt.Rows.Add("/Images/gallery/"+fileName,title);
            }

            rptGallery.DataSource = dt;
            rptGallery.DataBind();
        }
    }
}