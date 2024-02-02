using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Admin_LocalHomePageFileDownload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            var FileName = Request.QueryString["FileName"];
            var VisibleFileName = Request.QueryString["VisibleFileName"];

            FileInfo file = new FileInfo(Server.MapPath("~/VariableContent/HomePage/" + FileName));
            if (file.Exists)
            {
                Response.Clear();
                Response.AddHeader("Content-Disposition", "attachment; filename=" + VisibleFileName + "." + FileName.Split('.').LastOrDefault());
                Response.AddHeader("Content-Length", file.Length.ToString());
                Response.ContentType = "text/plain";
                Response.Flush();
                Response.TransmitFile(file.FullName);
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
}