using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Result_Grade : BasePage
{
    dalGrade obj = new dalGrade();
    protected static int ID;
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "/Pages/Result/" + Path.GetFileName(Request.PhysicalPath) + Request.Url.Query;
        if (SessionManager.SessionName.UserName == null)
        {
            dalCommon.LoginReturnUrl(url);
        }
        else if (!dalCommon.IsPermitted(url))
        {
            Response.Redirect("~/Login.aspx");
        }

        if (!IsPostBack)
            BindData();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (btnSave.Text == "Save")
        {
            ID = obj.Insert(tbxGradeName.Text, Convert.ToDouble(tbxGradePoint.Text), Convert.ToDouble(tbxStartMarks.Text), Convert.ToDouble(tbxEndMarks.Text));
            if (ID != -1)
                MessageController.Show(MessageCode.SaveSucceeded, MessageType.Information, Page);
            else
                MessageController.Show("This Grade already exists. Please try anothor.", MessageType.Error, Page);
        }
        else
        {
            obj.Update(ID, tbxGradeName.Text, Convert.ToDouble(tbxGradePoint.Text), Convert.ToDouble(tbxStartMarks.Text), Convert.ToDouble(tbxEndMarks.Text));
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
        tbxGradeName.Text = "";
        tbxGradePoint.Text = "";
        tbxStartMarks.Text = "";
        tbxEndMarks.Text = "";
        btnSave.Text = "Save";
        ((Panel)Page.Master.FindControl("MessagePanel1").FindControl("pnlMessage")).Visible = false;
    }
    protected void BindData()
    {
        DataTable dt = new Common().GetAll("rs_Grade");
        rptYear.DataSource = dt;
        rptYear.DataBind();
    }

    protected void btnEdit_Command(object sender, CommandEventArgs e)
    {
        ID = Convert.ToInt32(e.CommandArgument);
        DataTable dt = obj.GetById(ID);
        if (dt.Rows.Count > 0)
        {
            tbxGradeName.Text = dt.Rows[0]["GradeName"].ToString();
            tbxGradePoint.Text = dt.Rows[0]["GradePoint"].ToString();
            tbxStartMarks.Text = dt.Rows[0]["StartMarks"].ToString();
            tbxEndMarks.Text = dt.Rows[0]["EndMarks"].ToString();
        }
        btnSave.Text = "Edit";
    }
    protected void btnDelete_Command(object sender, CommandEventArgs e)
    {
        ID = Convert.ToInt32(e.CommandArgument);
        new Common().Delete("rs_Grade", ID);
        MessageController.Show(MessageCode.DeleteSucceeded, MessageType.Information, Page);
        BindData();
    }
}