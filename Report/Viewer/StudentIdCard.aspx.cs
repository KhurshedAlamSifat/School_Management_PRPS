using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Report_Viewer_StudentIdCard : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "/Report/Viewer/" + Path.GetFileName(Request.PhysicalPath) + Request.Url.Query;
        if (SessionManager.SessionName.UserName == null)
        {
            dalCommon.LoginReturnUrl(url);
        }
        else if (!dalCommon.IsPermitted(url))
        {
            Response.Redirect("~/Login.aspx");
        }
        if (!IsPostBack)
        {
            Load();
        }
    }
    protected void btnReport_Click(object sender, EventArgs e)
    {
        string criteria = "";
        if (ddlYear.SelectedValue != "")
        {
            if (criteria == "")
                criteria = "er_StudentToClass.Year=" + ddlYear.SelectedItem.Text;
            else
                criteria += " er_StudentToClass.Year=" + ddlYear.SelectedItem.Text;
        }

        if (ddlClass.SelectedValue != "")
        {
            if (criteria == "")
                criteria = "er_StudentToClass.ClassId=" + ddlClass.SelectedValue;
            else
                criteria += " and er_StudentToClass.ClassId=" + ddlClass.SelectedValue;
        }
        if (criteria != "")
            Response.Redirect("../../Report/Viewer/ReportView.aspx?query=" + EncryptionDecryption.EncryptDecryptString(criteria) + "&report=IdCard");
    }
    #region Load Data
    protected void Load()
    {
        ddlYear.DataSource = new Common().GetAll("bs_Year");
        ddlYear.DataBind();

        ddlClass.DataSource = new Common().GetAll("bs_ClassName");
        ddlClass.DataBind();
    }
    #endregion

}