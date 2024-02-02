using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_UserManagement_UserSetup : BasePage
{
    dalUser objUser = new dalUser();
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "/Pages/UserManagement/" + Path.GetFileName(Request.PhysicalPath) + Request.Url.Query;
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
            Common.LoadDropdown(ddlRole, "RoleSetup", 1, 0);
            BindData();
        }
    }
    int Id
    {
        set { ViewState["Id"] = value; }
        get
        {
            try
            {
                return Convert.ToInt32(ViewState["Id"]);
            }
            catch
            {
                return 0;
            }
        }
    }

    protected void BindData()
    {
        DataTable dt = objUser.GetUsers();
        if (dt.Rows.Count > 0)
        {
            rpt.DataSource = dt;
            rpt.DataBind();
        }
        else
        {
            rpt.DataSource = null;
            rpt.DataBind();
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        Id = objUser.CreateUsers(tbxUserName.Text, Convert.ToInt32(ddlRole.SelectedValue), EncryptionDecryption.Encrypt(tbxpassword.Text,true),tbxEmail.Text, "", DateTime.Now);
        if (Id > 0)
        {
            objUser.Inset(Id,tbxName.Text, tbxMobile.Text, tbxEmail.Text);
            MessageController.Show(MessageCode.SaveSucceeded, MessageType.Confirmation, Page);
        }
        else
        {
            MessageController.Show("This user name already exists. Please try another.", MessageType.Error, Page);
        }
        BindData();
        Clear();
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        try
        {
            objUser.UpdateUsers(Id,Convert.ToInt32(ddlRole.SelectedValue), tbxEmail.Text, SessionManager.SessionName.UserName, DateTime.Now);
            MessageController.Show(MessageCode.UpdateSucceeded, MessageType.Confirmation, Page);
        }
        catch { }
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        Clear();
    }
    protected void btnEdit_Command(object sender, CommandEventArgs e)
    {
        Id = Convert.ToInt32(e.CommandArgument);
        DataTable dt = objUser.GetUserById(Id);
        if (dt.Rows.Count > 0)
        {
            tbxName.Text = dt.Rows[0]["NameEng"].ToString();
            tbxMobile.Text = dt.Rows[0]["Mobile"].ToString();
            tbxEmail.Text = dt.Rows[0]["Email"].ToString();
            ddlRole.SelectedValue = dt.Rows[0]["RoleId"].ToString();
            tbxUserName.Text = dt.Rows[0]["UserName"].ToString();
        }
        btnEdit.Visible = true;
        btnSave.Visible = false;
        tbxpassword.Enabled = false;
        tbxConfirmPass.Enabled = false;
    }
    private void Clear()
    {
        btnEdit.Visible = false;
        btnSave.Visible = true;
        tbxpassword.Enabled = true;
        tbxConfirmPass.Enabled = true;
    }
    protected void btnDelete_Command(object sender, CommandEventArgs e)
    {

    }
}