using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Enrollment_SubjectToClass : BasePage
{
    dalSubject obj = new dalSubject();
    protected static int ID;
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "/Pages/Enrollment/" + Path.GetFileName(Request.PhysicalPath) + Request.Url.Query;
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
            LoadAll();
            BindData();
        }
    }

    protected void LoadAll()
    {
        ddlClass.DataSource = new Common().GetAll("bs_ClassName");
        ddlClass.DataBind();

        ddlGroup.DataSource = new Common().GetAll("bs_Group");
        ddlGroup.DataBind();

        ddlSubject.DataSource = new Common().GetAll("bs_SubjectName");
        ddlSubject.DataBind();

        ddlCategory.DataSource = new Common().GetAll("bs_SubjectCategory");
        ddlCategory.DataBind();

        rptCategory.DataSource = new Common().GetAll("bs_SubjectCategory");
        rptCategory.DataBind();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (btnSave.Text == "Save")
        {
            if (ddlCategory.SelectedValue == "2" || ddlCategory.SelectedValue == "3")
            {
                for (int i = 1; i <= 2; i++)
                {
                    ID = obj.Insert(Convert.ToInt32(ddlClass.SelectedValue), Convert.ToInt32(ddlGroup.SelectedValue), Convert.ToInt32(ddlSubject.SelectedValue),
                Convert.ToInt32(ddlCategory.SelectedValue), i,Convert.ToBoolean(chkOPtional.Checked), Convert.ToBoolean(chkResultCount.Checked), SessionManager.SessionName.UserName);
                }
            }
            else
            {
                ID = obj.Insert(Convert.ToInt32(ddlClass.SelectedValue), Convert.ToInt32(ddlGroup.SelectedValue), Convert.ToInt32(ddlSubject.SelectedValue),
                    Convert.ToInt32(ddlCategory.SelectedValue), 0,Convert.ToBoolean(chkOPtional.Checked), Convert.ToBoolean(chkResultCount.Checked), SessionManager.SessionName.UserName);
            }
            if (ID != -1)
                MessageController.Show(MessageCode.SaveSucceeded, MessageType.Information, Page);
            else
                MessageController.Show("This subject already exists in this class. Please try anothor.", MessageType.Error, Page);
        }
        else
        {

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
        btnSave.Text = "Save";
        ((Panel)Page.Master.FindControl("MessagePanel1").FindControl("pnlMessage")).Visible = false;
    }
    protected void BindData()
    {
        DataTable dt = obj.GetByClassId(Convert.ToInt32(ddlClass.SelectedValue));
        rptSubject.DataSource = dt;
        rptSubject.DataBind();
    }
    protected void btnDelete_Command(object sender, CommandEventArgs e)
    {
        //ID = Convert.ToInt32(e.CommandArgument);
        //new Common().Delete("bs_Gender", ID);
        //MessageController.Show(MessageCode.DeleteSucceeded, MessageType.Information, Page);
        //BindData();
    }
    protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindData();
    }
}