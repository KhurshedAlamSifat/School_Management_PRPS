using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Admin_PaymentMethod : BasePage
{
    dalPaymentMethod obj = new dalPaymentMethod();
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
        if (!IsPostBack)
        {
            ViewState["ID"] = (int)0;
            BindData();
        }

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        int ID = obj.Insert(tbxName.Text);
        MessageController.Show(MessageCode.SaveSucceeded, MessageType.Information, Page);

        BindData();
        ClearAll();
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        obj.Update(Convert.ToInt32(ViewState["ID"]), tbxName.Text);
        MessageController.Show(MessageCode.UpdateSucceeded, MessageType.Information, Page);
        BindData();
        ClearAll();
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        ClearAll();
        tbxName.Text = "";
    }
    protected void ClearAll()
    {
        tbxName.Text = "";
        btnSave.Visible = true;
        btnEdit.Visible = false;
    }
    protected void BindData()
    {
        DataTable dt = new Common().GetAll("bs_PaymentMethod");
        rptYear.DataSource = dt;
        rptYear.DataBind();
    }

    protected void btnEdit_Command(object sender, CommandEventArgs e)
    {
        int ID = Convert.ToInt32(e.CommandArgument);
        DataTable dt = obj.GetById(ID);
        if (dt.Rows.Count > 0)
        {
            tbxName.Text = dt.Rows[0]["MethodName"].ToString();
        }
        ViewState["ID"] = ID;
        btnSave.Visible = false;
        btnEdit.Visible = true;
    }
    protected void btnDelete_Command(object sender, CommandEventArgs e)
    {
        int ID = Convert.ToInt32(e.CommandArgument);
        new Common().Delete("bs_PaymentMethod", ID);
        MessageController.Show(MessageCode.DeleteSucceeded, MessageType.Information, Page);
        BindData();
    }
}