﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Administration_LeaveApplication : BasePage
{
    dalTeacher obj = new dalTeacher();
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "/Pages/Administration/" + Path.GetFileName(Request.PhysicalPath) + Request.Url.Query;
        if (SessionManager.SessionName.UserName == null)
        {
            dalCommon.LoginReturnUrl(url);
        }
        else if (!dalCommon.IsPermitted(url))
        {
            Response.Redirect("~/Login.aspx");
        }
        if(!IsPostBack)
        {
            ddlDesignation.DataSource = new Common().GetAll("bs_Designation");
            ddlDesignation.DataBind();
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        obj.LeaveApplication(tbxName.Text, tbxPinCode.Text, Convert.ToInt32(ddlDesignation.SelectedValue), tbxSubject.Text, 
            Convert.ToDateTime(tbxFromDate.Text), Convert.ToDateTime(tbxToDate.Text),
            tbxDetails.Content);
        MessageController.Show(MessageCode.SaveSucceeded,MessageType.Information,Page);
    }
}