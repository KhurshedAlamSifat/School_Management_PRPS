using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Library_BookList : System.Web.UI.Page
{
    dalLibrary obj = new dalLibrary();
    protected static int ID;
    protected Dictionary<string, string> StatusDict = new Dictionary<string, string>() { { "", "Select" }, { "Active", "Active" }, { "Lost", "Lost" } };

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
            LoadDropDowns();
        }
    }
    protected void LoadDropDowns()
    {
        Common.LoadDropdown(ddlCategory, "lb_Category", 1, 0);
        Common.LoadDropdown(ddlLanguage, "lb_Language", 1, 0);
        Common.LoadDropdown(ddlPublisher, "lb_Publisher", 1, 0);
        Common.LoadDropdown(ddlCountry, "lb_Country", 1, 0);
        Common.LoadDropdown(ddlEdtion, "lb_Edition", 1, 0);

        ddlStatus.DataSource = StatusDict;
        ddlStatus.DataBind();
    }
    protected void LoadSubCategory()
    {
        if (ddlCategory.SelectedValue != "")
        {
            DataTable dt = new dalLibraryBasic().GetByCategoryId(Convert.ToInt32(ddlCategory.SelectedValue));
            ddlSubCategory.DataSource = dt;
            ddlSubCategory.DataBind();
        }
    }
    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadSubCategory();
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string criteria = GetCriteria();
        DataTable dt = obj.GetBookByCriteria(criteria);
        if (dt.Rows.Count > 0)
        {
            rpt.DataSource = dt;
            rpt.DataBind();
        }
        else
        {
            rpt.DataSource = null;
            rpt.DataBind();
        }
    }
    protected string GetCriteria()
    {
        string criteria = "Status != 'Deleted'";
        if (ddlCategory.SelectedValue != "")
        {
            criteria += " AND CategoryId = '" + ddlCategory.SelectedValue + "'";
        }
        if (ddlSubCategory.SelectedValue != "")
        {
            criteria += " AND SubCategoryId = '" + ddlSubCategory.SelectedValue + "'";
        }
        if (ddlLanguage.SelectedValue != "")
        {
            criteria += " AND LanguageId = '" + ddlLanguage.SelectedValue + "'";
        }
        if (ddlPublisher.SelectedValue != "")
        {
            criteria += " AND PublisherId = '" + ddlPublisher.SelectedValue + "'";
        }
        if (ddlCountry.SelectedValue != "")
        {
            criteria += " AND CountryId = '" + ddlCountry.SelectedValue + "'";
        }
        if (ddlEdtion.SelectedValue != "")
        {
            criteria += " AND EdtionId = '" + ddlEdtion.SelectedValue + "'";
        }
        if (tbxISBN.Text != "")
        {
            criteria += " AND ISBN = '" + tbxISBN.Text + "'";
        }
        if (tbxVolume.Text != "")
        {
            criteria += " AND VolumeNo = '" + tbxVolume.Text + "'";
        }
        if (tbxSelfNo.Text != "")
        {
            criteria += " AND SelfNo = '" + tbxSelfNo.Text + "'";
        }
        if (tbxCellNo.Text != "")
        {
            criteria += " AND CellNo = '" + tbxCellNo.Text + "'";
        }
        if (tbxTrackingId.Text != "")
        {
            criteria += " AND TrackingId LIKE '%" + tbxTrackingId.Text + "%'";
        }
        if (ddlStatus.SelectedValue != "")
        {
            criteria += " AND Status = '" + ddlStatus.SelectedValue + "'";
        }
        return criteria;
    }
    protected void LoadBookList()
    {
        string criteria = " Status != 'Deleted'";
        DataTable dt = obj.GetBookByCriteria(criteria);
        rpt.DataSource = dt;
        rpt.DataBind();
    }
    protected void btnView_Command(object sender, CommandEventArgs e)
    {
        ID = Convert.ToInt32(e.CommandArgument);
        DataTable dt = obj.GetBookById(ID);
        if (dt.Rows.Count > 0)
        {
            lblTrackingId.Text = dt.Rows[0]["TrackingId"].ToString();
            lblTitleEng.Text = dt.Rows[0]["TitleEng"].ToString();
            lblTitleBan.Text = dt.Rows[0]["TitleBan"].ToString();
            lblStatus.Text = dt.Rows[0]["Status"].ToString();
            lblCategory.Text = dt.Rows[0]["Category"].ToString();
            lblSubCategory.Text = dt.Rows[0]["SubCategory"].ToString();
            lblCountry.Text = dt.Rows[0]["Country"].ToString();
            lblLanguage.Text = dt.Rows[0]["Language"].ToString();
            lblPublisher.Text = dt.Rows[0]["Publisher"].ToString();
            lblEdtion.Text = dt.Rows[0]["Edition"].ToString();
            lblISBN.Text = dt.Rows[0]["ISBN"].ToString();
            lblVolume.Text = dt.Rows[0]["VolumeNo"].ToString();
            lblSelfNo.Text = dt.Rows[0]["SelfNo"].ToString();
            lblCellNo.Text = dt.Rows[0]["CellNo"].ToString();
            lblAuthor.Text = dt.Rows[0]["Author"].ToString();
            lblKeyWord.Text = dt.Rows[0]["KeyWords"].ToString();
            lblDescription.Text = dt.Rows[0]["Description"].ToString();
            if (dt.Rows[0]["CoverPhoto"].ToString() == "")
            {
                imgCover.ImageUrl = "~/Images/Common/no-photo.jpg";
            }
            else
            {
                imgCover.ImageUrl = "~/VariableContent/Book/" + dt.Rows[0]["CoverPhoto"].ToString();
            }

        }
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
    }

}