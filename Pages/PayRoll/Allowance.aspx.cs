﻿using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_PayRoll_Allowance : System.Web.UI.Page
{
    dalPayrollBasic obj = new dalPayrollBasic();
    protected static int ID;
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "/Pages/PayRoll/" + Path.GetFileName(Request.PhysicalPath) + Request.Url.Query;
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
            //btnSave.CssClass = Common.SessionInfo.Button;
            //btnEdit.CssClass = Common.SessionInfo.Button;
            //btnReset.CssClass = Common.SessionInfo.Button;
            BindData();
        }

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        ID = obj.AllowanceInsert(tbxName.Text);
        if (ID != -1)
            MessageController.Show(MessageCode.SaveSucceeded, MessageType.Information, Page);
        else
            MessageController.Show("This allowance name already exists. Please try anothor.", MessageType.Error, Page);

        BindData();
        ClearAll();
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        obj.AllowanceUpdate(ID, tbxName.Text);
        MessageController.Show(MessageCode.UpdateSucceeded, MessageType.Information, Page);
        BindData();
        ClearAll();
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        ClearAll();
    }
    protected void ClearAll()
    {
        tbxName.Text = "";
        btnSave.Visible = true;
        btnEdit.Visible = false;
    }
    protected void BindData()
    {
        DataTable dt = new Common().GetAll("pr_Allowance");
        rpt.DataSource = dt;
        rpt.DataBind();
    }

    protected void btnEdit_Command(object sender, CommandEventArgs e)
    {
        ID = Convert.ToInt32(e.CommandArgument);
        DataTable dt = obj.TypeGetById(ID);
        if (dt.Rows.Count > 0)
        {
            tbxName.Text = dt.Rows[0]["Allowance"].ToString();
        }
        btnSave.Visible = false;
        btnEdit.Visible = true;
    }
    protected void btnDelete_Command(object sender, CommandEventArgs e)
    {
        ID = Convert.ToInt32(e.CommandArgument);
        new Common().Delete("pr_Allowance", ID);
        MessageController.Show(MessageCode.DeleteSucceeded, MessageType.Information, Page);
        BindData();
    }
}