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

public partial class Pages_Library_AddBook : BasePage
{
    dalLibraryBasic obj = new dalLibraryBasic();
    dalLibrary objLibrary = new dalLibrary();

    protected Dictionary<string, string> StatusDict = new Dictionary<string, string>() { { "Active", "Active" }, { "Lost", "Lost" }, { "Deleted", "Deleted" } };
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "/Pages/Library/" + Path.GetFileName(Request.PhysicalPath) + Request.Url.Query;
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
            Load();
            LoadSubCategory();
            if (Request.QueryString["Id"] != null)
            {
                int ID = Convert.ToInt32(Request.QueryString["Id"]);
                ViewState["ID"] = ID;
                LoadDefault(ID);
                btnSave.Visible = false;
                btnEdit.Visible = true;
            }

        }
    }
    #region Load Data

    protected void LoadDefault(int ID)
    {
        DataTable dt = objLibrary.GetBookById(ID);
        if (dt.Rows.Count > 0)
        {
            ddlCategory.SelectedValue = dt.Rows[0]["CategoryId"].ToString();
            ddlSubCategory.SelectedValue = dt.Rows[0]["SubCategoryId"].ToString();
            ddlCountry.SelectedValue = dt.Rows[0]["CountryId"].ToString();
            ddlLanguage.SelectedValue = dt.Rows[0]["LanguageId"].ToString();
            ddlPublisher.SelectedValue = dt.Rows[0]["PublisherId"].ToString();
            ddlEdtion.SelectedValue = dt.Rows[0]["EditionId"].ToString();
            ddlStatus.SelectedValue = dt.Rows[0]["Status"].ToString();
            tbxISBN.Text = dt.Rows[0]["ISBN"].ToString();
            tbxVolume.Text = dt.Rows[0]["VolumeNo"].ToString();
            tbxSelfNo.Text = dt.Rows[0]["SelfNo"].ToString();
            tbxCellNo.Text = dt.Rows[0]["CellNo"].ToString();
            tbxTrackingId.Text = dt.Rows[0]["TrackingId"].ToString();
            tbxTitleEng.Text = dt.Rows[0]["TitleEng"].ToString();
            tbxTitleBan.Text = dt.Rows[0]["TitleBan"].ToString();
            tbxAuthor.Text = dt.Rows[0]["Author"].ToString();
            tbxKeyWord.Text = dt.Rows[0]["KeyWords"].ToString();
            tbxDescription.Text = dt.Rows[0]["Description"].ToString();
            if (dt.Rows[0]["CoverPhoto"].ToString() == "")
            {
                imgCover.ImageUrl = "~/Images/Common/no-photo.jpg";
            }
            else
            {
                imgCover.ImageUrl = "~/VariableContent/Book/" + dt.Rows[0]["CoverPhoto"].ToString();
                imgCover.Visible = true;
                lblBrowse.Text = "Change Photo";
            }

        }
    }
    protected void Load()
    {
        var categoryDataTable = new Common().GetAll("lb_Category");
        categoryDataTable.DefaultView.Sort = "Category ASC";
        ddlCategory.DataSource = categoryDataTable.DefaultView.ToTable();
        ddlCategory.DataBind();

        ddlLanguage.DataSource = new Common().GetAll("lb_Language");
        ddlLanguage.DataBind();

        var publisherDataTable = new Common().GetAll("lb_Publisher");
        publisherDataTable.DefaultView.Sort = "Publisher ASC";
        ddlPublisher.DataSource = publisherDataTable.DefaultView.ToTable();
        ddlPublisher.DataBind();

        var countryDataTable = new Common().GetAll("lb_Country");
        countryDataTable.DefaultView.Sort = "Country ASC";
        ddlCountry.DataSource = countryDataTable.DefaultView.ToTable();
        ddlCountry.DataBind();

        var editionDataTable = new Common().GetAll("lb_Edition");
        editionDataTable.DefaultView.Sort = "Edition ASC";
        ddlEdtion.DataSource = editionDataTable .DefaultView.ToTable();
        ddlEdtion.DataBind();

        ddlStatus.DataSource = StatusDict;
        ddlStatus.DataBind();
    }
    protected void LoadSubCategory()
    {
        if (ddlCategory.SelectedValue != "")
        {
            DataTable dt = obj.GetByCategoryId(Convert.ToInt32(ddlCategory.SelectedValue));
            ddlSubCategory.DataSource = dt;
            ddlSubCategory.DataBind();
        }
    }
    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadSubCategory();
    }
    #endregion
    protected bool ValidImage(FileUpload file)
    {
        string extension = Path.GetExtension(file.FileName).ToLower();
        if (extension == "jpeg" || extension == ".jpg" || extension == ".png")
        {
            return true;
        }
        return false;
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string fileName = "";
        if (fuCoverPhoto.HasFile)
        {
            if (ValidImage(fuCoverPhoto))
            {
                fileName = Guid.NewGuid().ToString() + "." + fuCoverPhoto.FileName.Split('.').LastOrDefault();
                System.Drawing.Image image = System.Drawing.Image.FromStream(fuCoverPhoto.FileContent);
                System.Drawing.Image image2 = Controller.resizeImage(image, new Size(150, 210));
                EncoderParameters encoderParameters = new EncoderParameters(1);
                encoderParameters.Param[0] = new EncoderParameter(Encoder.Compression, 100);
                string MediumImagePath = Server.MapPath("~/VariableContent/Book/" + fileName);
                image2.Save(string.Concat(MediumImagePath), ImageCodecInfo.GetImageEncoders()[1], encoderParameters);
            }
        }
        int ID = objLibrary.InsertBook(Convert.ToInt32(ddlCategory.SelectedValue), Convert.ToInt32(ddlSubCategory.SelectedValue), Convert.ToInt32(ddlCountry.SelectedValue),
            Convert.ToInt32(ddlPublisher.SelectedValue), Convert.ToInt32(ddlLanguage.SelectedValue), Convert.ToInt32(ddlEdtion.SelectedValue), tbxTrackingId.Text, ddlStatus.SelectedValue, tbxTitleEng.Text, tbxTitleBan.Text, tbxAuthor.Text,
            tbxISBN.Text, tbxVolume.Text, tbxSelfNo.Text, tbxCellNo.Text, tbxKeyWord.Text, tbxDescription.Text, fileName, SessionManager.SessionName.UserName);

        if (ID > 0)
        {
            MessageController.Show(MessageCode.SaveSucceeded, MessageType.Information, Page);
        }
        else
        {
            MessageController.Show(MessageCode.SaveFailed, MessageType.Error, Page);
        }
        ClearAll();
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        DataTable dt = objLibrary.GetBookById(Convert.ToInt32(ViewState["ID"]));
        var fileName = dt.Rows[0]["CoverPhoto"].ToString();
        if (fuCoverPhoto.HasFile)
        {
            if (ValidImage(fuCoverPhoto))
            {
                //#delete old image
                if (fileName != "")
                {
                    if (System.IO.File.Exists(Server.MapPath("/Images/Book/" + fileName)))
                    {
                        System.IO.File.Delete(Server.MapPath("/Images/Book/" + fileName));
                    }
                }

                fileName = Guid.NewGuid().ToString() + "." + fuCoverPhoto.FileName.Split('.').LastOrDefault();
                System.Drawing.Image image = System.Drawing.Image.FromStream(fuCoverPhoto.FileContent);
                System.Drawing.Image image2 = Controller.resizeImage(image, new Size(150, 210));
                EncoderParameters encoderParameters = new EncoderParameters(1);
                encoderParameters.Param[0] = new EncoderParameter(Encoder.Compression, 100);
                string MediumImagePath = Server.MapPath("~/VariableContent/Book/" + fileName);
                image2.Save(string.Concat(MediumImagePath), ImageCodecInfo.GetImageEncoders()[1], encoderParameters);
            }
        }
        int ID = objLibrary.UpdateBook(Convert.ToInt32(ViewState["ID"]), Convert.ToInt32(ddlCategory.SelectedValue), Convert.ToInt32(ddlSubCategory.SelectedValue), Convert.ToInt32(ddlCountry.SelectedValue),
            Convert.ToInt32(ddlPublisher.SelectedValue), Convert.ToInt32(ddlLanguage.SelectedValue), Convert.ToInt32(ddlEdtion.SelectedValue), tbxTrackingId.Text, ddlStatus.SelectedValue, tbxTitleEng.Text, tbxTitleBan.Text, tbxAuthor.Text,
            tbxISBN.Text, tbxVolume.Text, tbxSelfNo.Text, tbxCellNo.Text, tbxKeyWord.Text, tbxDescription.Text, fileName, SessionManager.SessionName.UserName);
        if (ID > 0)
        {
            MessageController.Show(MessageCode.SaveSucceeded, MessageType.Information, Page);
            Response.Redirect(Request.RawUrl);
        }
        else
        {
            MessageController.Show(MessageCode.SaveFailed, MessageType.Error, Page);
        }
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        ClearAll();
    }
    protected void ClearAll()
    {
        tbxVolume.Text = "";
        tbxCellNo.Text = "";
        tbxDescription.Text = "";
        tbxISBN.Text = "";
        tbxKeyWord.Text = "";
        tbxTrackingId.Text = "";
        tbxTitleEng.Text = "";
        tbxTitleBan.Text = "";
        tbxSelfNo.Text = "";
        tbxAuthor.Text = "";
    }
}