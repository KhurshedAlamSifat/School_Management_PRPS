using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_UserManagement_ChangePassword : System.Web.UI.Page
{
    dalUser obj = new dalUser();
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "/Pages/UserManagement/" + Path.GetFileName(Request.PhysicalPath) + Request.Url.Query;
        if (SessionManager.SessionName.UserName == null)
        {
            dalCommon.LoginReturnUrl(url);
        }
        if (!IsPostBack)
        {
            if (Request.QueryString["UserId"] != null)
            {
                UserId = Request.QueryString["UserId"].ToString();
            }
            else
            {
                if (Common.SessionInfo != null)
                {
                    UserId = Common.SessionInfo.UserName;
                }

            }
            tbxResetUser.Text = UserId;
        }

    }

    string UserId
    {
        set { ViewState["UserId"] = value; }
        get
        {
            try
            {
                return ViewState["UserId"].ToString();
            }
            catch
            {
                return "";
            }
        }
    }
    protected void btnResetPassword_Click(object sender, EventArgs e)
    {
        if (tbxPass.Text == tbxConPass.Text)
        {
            if (UserId != "")
            {
                obj.ChangePassword(UserId, EncryptionDecryption.Encrypt(tbxPass.Text,true));
                MessageController.Show("Password change successfull", MessageType.Information, Page);
            }
        }
        else
        {
            MessageController.Show("Password and confirm password does not mathch", MessageType.Error, Page);
        }
    }
}