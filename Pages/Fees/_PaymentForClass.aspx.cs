using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Fees_PaymentForClass : BasePage
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
            LoadData();
            LoadPaymentType();
            LoadPaymentByClass();
            pnlNew.Visible = true;
            pnlEdit.Visible = false;
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        ID = obj.Insert(tbxName.Text);
        if (ID != -1)
            MessageController.Show(MessageCode.SaveSucceeded, MessageType.Information, Page);
        else
            MessageController.Show("This payment type name already exists. Please try anothor.", MessageType.Error, Page);
        LoadPaymentType();
    }

    protected void LoadPaymentType()
    {
        DataTable dt = new Common().GetAll("fee_PaymentType");
        rptPaymentType.DataSource = dt;
        rptPaymentType.DataBind();
    }

    protected void LoadPaymentByClass()
    {
        DataTable dt = obj.GetByYear(Convert.ToInt32(ddlYear.SelectedValue), ddlMonth.SelectedValue, Convert.ToInt32(ddlClass.SelectedValue), Convert.ToInt32(ddlGroup.SelectedValue));
        if (dt.Rows.Count > 0)
        {
            rptPaymentByClass.DataSource = dt;
            rptPaymentByClass.DataBind();
            btnEdit.Visible = true;
        }
        else
        {
            rptPaymentByClass.DataSource = null;
            rptPaymentByClass.DataBind();
            btnEdit.Visible = false;
        }
    }
    protected void btnDelete_Command(object sender, CommandEventArgs e)
    {

    }
    protected void LoadData()
    {
        ddlYear.DataSource = new dalYear().GetDefault();
        ddlYear.DataBind();

        ddlClass.DataSource = new Common().GetAll("bs_ClassName");
        ddlClass.DataBind();
        ddlGroup.DataSource = new Common().GetAll("bs_Group");
        ddlGroup.DataBind();
    }
    protected DataTable Payment()
    {
        DataTable dt = new DataTable("dtPayment");
        dt.Columns.Add("PayID", typeof(int));
        dt.Columns.Add("YId", typeof(int));
        dt.Columns.Add("MID", typeof(int));
        dt.Columns.Add("CID", typeof(string));
        dt.Columns.Add("Amount", typeof(int));
        dt.Columns.Add("GroupId", typeof(int));
        return dt;
    }
    protected void btnPayment_Click(object sender, EventArgs e)
    {
        if (btnPayment.Text == "Update")
        {
            foreach (RepeaterItem item in rptEdit.Items)
            {
                TextBox tbxAmmount = (TextBox)item.FindControl("tbxPaymentType");
                HiddenField hdnId = (HiddenField)item.FindControl("hdnId");
                if (tbxAmmount.Text != "")
                {
                    obj.PaymentUpdate(Convert.ToInt32(hdnId.Value), tbxAmmount.Text, Convert.ToInt32(ddlYear.SelectedValue), Convert.ToInt32(ddlMonth), Convert.ToInt32(ddlClass.SelectedValue), Convert.ToInt32(ddlGroup.SelectedValue));
                }
                else
                {
                    new Common().Delete("fee_PaymentForClass", Convert.ToInt32(hdnId.Value));
                }
            }
        }
        else
        {
            DataTable dt = Payment();
            string months = "";

            foreach (ListItem month in chkMonth.Items)
            {
                if (month.Selected)
                {
                    if (months.Length > 0)
                    {
                        months += "," + month.Value;
                    }
                    else
                    {
                        months += month.Value;
                    }
                    foreach (RepeaterItem item in rptPaymentType.Items)
                    {
                        TextBox tbxAmmount = (TextBox)item.FindControl("tbxPaymentType");
                        HiddenField hdnId = (HiddenField)item.FindControl("hdnId");
                        if (tbxAmmount.Text != "")
                        {
                            dt.Rows.Add(Convert.ToInt32(hdnId.Value), Convert.ToInt32(ddlYear.SelectedValue), month.Value, Convert.ToInt32(ddlClass.SelectedValue), tbxAmmount.Text, Convert.ToInt32(ddlGroup.SelectedValue));
                        }
                    }
                }
            }
            if (dt.Rows.Count > 0)
            {
                obj.PaymentInsert(dt, SessionManager.SessionName.UserName, DateTime.Now, months, Convert.ToInt32(ddlYear.SelectedValue));
                MessageController.Show(MessageCode.SaveSucceeded, MessageType.Information, Page);
            }
            else
            {
                MessageController.Show("No data available for entry", MessageType.Information, Page);
            }
        }
        pnlNew.Visible = true;
        pnlEdit.Visible = false;
        btnPayment.Text = "Submit";
    }
    protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadPaymentByClass();
    }
    protected void ddlMonth_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadPaymentByClass();
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        DataTable dt = obj.GetByYear(Convert.ToInt32(ddlYear.SelectedValue), ddlMonth.SelectedValue, Convert.ToInt32(ddlClass.SelectedValue), Convert.ToInt32(ddlGroup.SelectedValue));
        if (dt.Rows.Count > 0)
        {
            rptEdit.DataSource = dt;
            rptEdit.DataBind();
            pnlNew.Visible = false;
            pnlEdit.Visible = true;
            btnPayment.Text = "Update";
        }
    }
}