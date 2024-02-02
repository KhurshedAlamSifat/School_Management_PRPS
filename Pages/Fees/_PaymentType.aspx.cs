using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Fees_PaymentType : BasePage
{
    dalPaymentType obj = new dalPaymentType();
    protected static int ID;
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "/Pages/Fees/" + Path.GetFileName(Request.PhysicalPath) + Request.Url.Query;
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
            BindData();
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (btnSave.Text == "Save")
        {
            ID = obj.Insert(tbxName.Text);
            if (ID != -1)
                MessageController.Show(MessageCode.SaveSucceeded, MessageType.Information, Page);
            else
                MessageController.Show("This payment type name already exists. Please try anothor.", MessageType.Error, Page);
        }
        else
        {
            obj.Update(ID, tbxName.Text);
            MessageController.Show(MessageCode.UpdateSucceeded, MessageType.Information, Page);
        }
        BindData();
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        ClearAll();
    }
    protected void ClearAll()
    {
        tbxName.Text = "";
        btnSave.Text = "Save";
        ((Panel)Page.Master.FindControl("MessagePanel1").FindControl("pnlMessage")).Visible = false;
    }
    protected void BindData()
    {
        DataTable dt = new Common().GetAll("fee_PaymentType");
        rptYear.DataSource = dt;
        rptYear.DataBind();
    }

    protected void btnEdit_Command(object sender, CommandEventArgs e)
    {
        ID = Convert.ToInt32(e.CommandArgument);
        DataTable dt = obj.GetById(ID);
        if (dt.Rows.Count > 0)
        {
            tbxName.Text = dt.Rows[0]["PaymentType"].ToString();
        }
        btnSave.Text = "Edit";
    }
    protected void btnDelete_Command(object sender, CommandEventArgs e)
    {
        ID = Convert.ToInt32(e.CommandArgument);
        new Common().Delete("fee_PaymentType", ID);
        MessageController.Show(MessageCode.DeleteSucceeded, MessageType.Information, Page);
        BindData();
    }
}