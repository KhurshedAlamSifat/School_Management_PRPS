using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Admin_DbBackup : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "/Pages/Admin/" + Path.GetFileName(Request.PhysicalPath) + Request.Url.Query;
        if (SessionManager.SessionName.UserName == null)
        {
            dalCommon.LoginReturnUrl(url);
        }
        else if (!dalCommon.IsPermitted(url))
        {
            Response.Redirect("~/Login.aspx");
        }
    }
    protected void btnBackup_Click(object sender, EventArgs e)
    {
        try
        {
              string filepath = Server.MapPath("~/VariableContent/DbBackup/") + DateTime.Now.ToString("ddMMyyyy_HHmmss") + ".bak";
            new Common().BackupDB(filepath);
            string files = Path.GetFileName(filepath);
            Response.ContentType = "file/bak";
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + files);
            Response.TransmitFile(Server.MapPath("~/VariableContent/DbBackup/") + files);
            Response.End();
            MessageController.Show("Backup Completed.", MessageType.Confirmation, Page);
        }
        catch (Exception ex)
        {
            MessageController.Show("Something is wrong. Please contact with admin immediately.", MessageType.Error, Page);
        }
    }
}