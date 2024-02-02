using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Helper_FileDownload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            var SubDirecotry = Request.QueryString["SubDirecotry"];
            var FileName = Request.QueryString["FileName"];
            //Int64 FgIqcFileId = Convert.ToInt64(Request.QueryString["FgIqcFileId"]);
            //var FgIqcFile = new FgIqcDa(false).GetFgIqcFileById(FgIqcFileId);
            FileInfo file = new FileInfo(Server.MapPath("~/VariableContent/" + SubDirecotry + "/" + FileName));
            if (file.Exists)
            {
                Response.Clear();
                Response.AddHeader("Content-Disposition", "attachment; filename=" + FileName);
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