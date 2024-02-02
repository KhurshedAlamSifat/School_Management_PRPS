using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_SMS_SMSTemplete : BasePage
{
    dalSMS obj = new dalSMS();
    protected static int ID;
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "/Pages/SMS/" + Path.GetFileName(Request.PhysicalPath) + Request.Url.Query;
        if (SessionManager.SessionName.UserName == null)
        {
            dalCommon.LoginReturnUrl(url);
        }
        else if (!dalCommon.IsPermitted(url))
        {
            Response.Redirect("~/Login.aspx");
        }
        if(!IsPostBack)
        BindData();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (btnSave.Text == "Save")
        {
            ID = obj.Insert(txtTemplateName.Text, tbxVariables.Text, tbxDetails.Content);
            if (ID != -1)
                MessageController.Show(MessageCode.SaveSucceeded, MessageType.Information, Page);
            else
                MessageController.Show("This templete name already exists. Please try anothor.", MessageType.Error, Page);
        }
        else
        {
            obj.Update(ID, txtTemplateName.Text,tbxVariables.Text, tbxDetails.Content);
            MessageController.Show(MessageCode.UpdateSucceeded, MessageType.Information, Page);
        }
        BindData();
        ClearAll();
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        ClearAll();
        ((Panel)Page.Master.FindControl("MessagePanel1").FindControl("pnlMessage")).Visible = false;
    }
    protected void ClearAll()
    {
        txtTemplateName.Text = string.Empty;
        tbxDetails.Content = string.Empty;
        tbxVariables.Text = string.Empty;
    }
    protected void BindData()
    {
        DataTable dt = new Common().GetAll("SMSTemplete");
        rptSMS.DataSource = dt;
        rptSMS.DataBind();
    }

    protected void btnEdit_Command(object sender, CommandEventArgs e)
    {
        ID = Convert.ToInt32(e.CommandArgument);
        DataTable dt = obj.GetById(ID);
        if (dt.Rows.Count > 0)
        {
            txtTemplateName.Text = dt.Rows[0]["Name"].ToString();
            tbxVariables.Text = dt.Rows[0]["Variable"].ToString();
            tbxDetails.Content = dt.Rows[0]["Message"].ToString();
        }
        btnSave.Text = "Edit";
        tbxVariables.Enabled = false;
    }
}