﻿using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Admin_District : BasePage
{
    dalDistrict obj = new dalDistrict();
    protected static int ID;
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
            btnSave.CssClass = Common.SessionInfo.Button;
            btnEdit.CssClass = Common.SessionInfo.Button;
            btnReset.CssClass = Common.SessionInfo.Button;
            LoadDivision();
            BindData();
        }

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        ID = obj.Insert(tbxName.Text, Convert.ToInt32(ddlDivision.SelectedValue));
        if (ID != -1)
            MessageController.Show(MessageCode.SaveSucceeded, MessageType.Information, Page);
        else
            MessageController.Show("This District name already exists. Please try anothor.", MessageType.Error, Page);
        BindData();
        ClearAll();
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        obj.Update(ID, tbxName.Text, Convert.ToInt32(ddlDivision.SelectedValue));
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
        if (ddlDivision.SelectedValue != "")
        {
            DataTable dt = obj.GetByDivisionId(Convert.ToInt32(ddlDivision.SelectedValue));
            rptYear.DataSource = dt;
            rptYear.DataBind();
        }
    }

    protected void btnEdit_Command(object sender, CommandEventArgs e)
    {
        ID = Convert.ToInt32(e.CommandArgument);
        DataTable dt = obj.GetById(ID);
        if (dt.Rows.Count > 0)
        {
            tbxName.Text = dt.Rows[0]["District"].ToString();
        }
        btnSave.Visible = false;
        btnEdit.Visible = true;
    }
    protected void btnDelete_Command(object sender, CommandEventArgs e)
    {
        try
        {
            ID = Convert.ToInt32(e.CommandArgument);
            new Common().Delete("bs_District", ID);
            MessageController.Show(MessageCode.DeleteSucceeded, MessageType.Information, Page);
            BindData();
        }
        catch (Exception ex)
        {
            MessageController.Show(ex.Message, MessageType.Error, Page);
        }
    }
    protected void LoadDivision()
    {
        DataTable dt = new Common().GetAll("bs_Division");
        ddlDivision.DataSource = dt;
        ddlDivision.DataBind();
    }
    protected void ddlDivision_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindData();
    }
}