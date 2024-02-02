using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Admin_HomePageSetup : BasePage
{
    dalHomePageSetup obj = new dalHomePageSetup();
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
            LoadDropdown();
            ClearAll();
            BindData();
        }

    }
    protected void LoadDropdown()
    {
        var categoryList = new Dictionary<string, string>();
        if (SessionManager.SessionName.Branch == 1)
        {
            categoryList = new Dictionary<string, string>() { { "", "Select" },
                { "Global Notice", "Global Notice" },
                { "Local Notice", "Local Notice" },
                { "Text With Image", "Text With Image" },
                { "Text With Youtube Video", "Text With Youtube Video" },
                { "Image For Gallery", "Image For Gallery" },
                { "Class Routine", "Class Routine" },
                { "Syllabus","Syllabus"},
                { "Acedemic Calander","Acedemic Calander"}
            };
        }
        else
        {
            categoryList = new Dictionary<string, string>() { { "", "Select" },
                { "Local Notice", "Local Notice" },
                { "Text With Image", "Text With Image" },
                { "Text With Youtube Video", "Text With Youtube Video" },
                { "Image For Gallery", "Image For Gallery" },
                { "Class Routine", "Class Routine" },
                { "Syllabus","Syllabus"},
                { "Acedemic Calander","Acedemic Calander"}
            };
        }
        ddlCategory.DataSource = categoryList;
        ddlCategory.DataBind();

        var ActiveStatuses = new Dictionary<string, string>() { { "", "Select" }, { "Active", "Active" }, { "Inactive", "Inactive" } };
        ddlStatus.DataSource = ActiveStatuses;
        ddlStatus.DataBind();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            var Category = ddlCategory.SelectedValue;
            var Title = tbxTitle.Text;
            var Content = edtrContent.Content;
            var YoutubeLink = tbxYoutubeLink.Text;
            int Sequence = string.IsNullOrEmpty(tbxSequence.Text) ? 0 : Convert.ToInt32(tbxSequence.Text);
            var Status = ddlStatus.Text;

            var fileName = "";

            if (Category == "Text With Youtube Video" && YoutubeLink == "")
            {
                MessageController.Show("Failed. Need Youtube Video Link", MessageType.Warning, Page);
                return;
            }
            if (Category == "Text With Image" && !flImage.HasFile)
            {
                MessageController.Show("Failed. Need Image", MessageType.Warning, Page);
                return;
            }
            if (Category == "Image For Gallery" && !flImage.HasFile)
            {
                MessageController.Show("Failed. Need Image", MessageType.Warning, Page);
                return;
            }

            if (flImage.HasFile)
            {
                if (IsValidFile(flImage) == false)
                {
                    MessageController.Show("Failed. The provided file exceeds max file size(5 mb).", MessageType.Warning, Page);
                    return;
                }
                else
                {
                    fileName = Category + " " + Guid.NewGuid().ToString() + "." + flImage.FileName.Split('.').LastOrDefault();
                    string serverPath = Server.MapPath("~/VariableContent/HomePage/" + fileName);
                    flImage.SaveAs(string.Concat(serverPath));
                }
            }
            int ID = obj.Insert(Category, Sequence, Title, Content, fileName, YoutubeLink, Status, SessionManager.SessionName.UserName);
            if (ID > 0)
            {
                MessageController.Show(MessageCode.SaveSucceeded, MessageType.Information, Page);
            }
            else
            {
                MessageController.Show(MessageCode.SaveFailed, MessageType.Error, Page);
            }

            BindData();
            ClearAll();
        }
        catch (Exception)
        {
            MessageController.Show("Save Failed. Please contact with admin.", MessageType.Error, Page);
        }
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        try
        {
            int Id = (int)ViewState["ID"];
            var Category = ddlCategory.SelectedValue;
            var Title = tbxTitle.Text;
            var Content = edtrContent.Content;
            var YoutubeLink = tbxYoutubeLink.Text;
            int Sequence = string.IsNullOrEmpty(tbxSequence.Text) ? 0 : Convert.ToInt32(tbxSequence.Text);
            var Status = ddlStatus.Text;

            DataTable dt = obj.GetById(Id);
            var fileName = dt.Rows[0]["ImageLink"].ToString();

            if (Category == "Text With Youtube Video" && YoutubeLink == "")
            {
                MessageController.Show("Failed. Need Youtube Video Link", MessageType.Warning, Page);
                return;
            }
            if (Category == "Text With Image" && !flImage.HasFile)
            {
                MessageController.Show("Failed. Need Image", MessageType.Warning, Page);
                return;
            }
            if (Category == "Image For Gallery" && !flImage.HasFile)
            {
                MessageController.Show("Failed. Need Image", MessageType.Warning, Page);
                return;
            }
            if (Category == "Class Routine" && !flImage.HasFile)
            {
                MessageController.Show("Failed. Need File", MessageType.Warning, Page);
                return;
            }
            if (Category == "Syllabus" && !flImage.HasFile)
            {
                MessageController.Show("Failed. Need File", MessageType.Warning, Page);
                return;
            }
            if (Category == "Acedemic Calander" && !flImage.HasFile)
            {
                MessageController.Show("Failed. Need File", MessageType.Warning, Page);
                return;
            }

            if (flImage.HasFile == true)
            {
                if (IsValidFile(flImage) == false)
                {
                    MessageController.Show("Failed. The provided file exceeds max file size(5 mb).", MessageType.Warning, Page);
                    return;
                }
                else
                {
                    //#delete old image
                    if (fileName != "")
                    {
                        if (System.IO.File.Exists(Server.MapPath("/Images/HomePage/" + fileName)))
                        {
                            try
                            {
                                System.IO.File.Delete(Server.MapPath("/Images/HomePage/" + fileName));
                            }
                            catch (Exception)
                            {
                            }
                        }
                    }

                    //#save new
                    fileName = Category + " " + Guid.NewGuid().ToString() + "." + flImage.FileName.Split('.').LastOrDefault();
                    string serverPath = Server.MapPath("~/VariableContent/HomePage/" + fileName);
                    flImage.SaveAs(string.Concat(serverPath));
                }
            }

            var dataTable = obj.Update(Id, Category, Sequence, Title, Content, fileName, YoutubeLink, Status, SessionManager.SessionName.UserName);
            MessageController.Show(MessageCode.UpdateSucceeded, MessageType.Information, Page);
            BindData();
            ClearAll();
        }
        catch (Exception ex)
        {
            MessageController.Show(MessageCode.UpdateFailed, MessageType.Error, Page);
        }
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        ClearAll();
    }
    protected void ClearAll()
    {
        ddlCategory.SelectedValue = "";
        tbxTitle.Text = "";
        edtrContent.Content = null;
        tbxYoutubeLink.Text = "";
        tbxSequence.Text = "";
        ddlStatus.SelectedValue = "";

        pnlCurrentImage.Visible = false;
        btnSave.Visible = true;
        btnEdit.Visible = false;
    }
    protected void BindData()
    {
        DataTable dt = new Common().GetAll("bs_HomePageSetup");
        rptDataList.DataSource = dt;
        rptDataList.DataBind();
    }

    protected void btnEdit_Command(object sender, CommandEventArgs e)
    {
        int ID = Convert.ToInt32(e.CommandArgument);
        DataTable dt = obj.GetById(ID);
        if (dt.Rows.Count > 0)
        {
            ddlCategory.SelectedValue = dt.Rows[0]["Category"].ToString();
            tbxTitle.Text = dt.Rows[0]["Title"].ToString();
            edtrContent.Content = dt.Rows[0]["Content"].ToString();
            tbxYoutubeLink.Text = dt.Rows[0]["YoutubeLink"].ToString();
            tbxSequence.Text = dt.Rows[0]["Sequence"].ToString();
            ddlStatus.SelectedValue = dt.Rows[0]["Status"].ToString();
            if (dt.Rows[0]["ImageLink"].ToString() != "")
            {
                pnlCurrentImage.Visible = true;
                imgCurrent.ImageUrl = "~/VariableContent/HomePage/" + dt.Rows[0]["ImageLink"].ToString();
            }
            else
            {
                pnlCurrentImage.Visible = false;
                imgCurrent.ImageUrl = "";
            }
        }
        ViewState["ID"] = ID;
        btnSave.Visible = false;
        btnEdit.Visible = true;
    }
    protected void btnDelete_Command(object sender, CommandEventArgs e)
    {
        int ID = Convert.ToInt32(e.CommandArgument);
        DataTable dt = obj.GetById(ID);
        var fileName = dt.Rows[0]["ImageLink"].ToString();
        if (fileName != "")
        {
            if (System.IO.File.Exists(Server.MapPath("/Images/HomePage/" + fileName)))
            {
                System.IO.File.Delete(Server.MapPath("/Images/HomePage/" + fileName));
            }
        }
        new Common().Delete("bs_HomePageSetup", ID);
        MessageController.Show(MessageCode.DeleteSucceeded, MessageType.Information, Page);
        BindData();
    }


    //# Helper Methods
    protected bool IsValidFile(FileUpload file)
    {
        bool flag = true;
        if (file.PostedFile.ContentLength < 524288)
        {
            flag = true;
        }
        return flag;
    }
}


