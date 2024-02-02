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

public partial class Pages_Library_BookLending : BasePage
{
    dalLibrary obj = new dalLibrary();
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
            pnlEdit.Visible = false;
        }

    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            string BookTrId = tbxAdd_BookTrId.Text;
            var book = obj.GetBookByTrackingId(BookTrId);
            if (book.Rows.Count == 0)
            {
                MessageController.Show("Invalid Book Tracking Id", MessageType.Warning, Page);
                return;
            }
            var BookId = Convert.ToInt32(book.Rows[0][0]);

            string UserName = tbxAdd_UserName.Text;
            var user = new dalUser().GetUserByUserName(UserName);
            if (user.Rows.Count == 0)
            {
                MessageController.Show("Invalid User Name", MessageType.Warning, Page);
                return;
            }
            var UserId = Convert.ToInt32(user.Rows[0][0]);


            DateTime IssueDate = dalCommon.DateFormatYYYYMMDD(tbxAdd_IssueDate.Text);
            DateTime TargatedReturnDate = dalCommon.DateFormatYYYYMMDD(tbxAdd_TargatedReturnDate.Text);

            var Note = tbxAdd_Note.Text;


            var resDataTable = obj.InsertBookLending(BookId, UserId, IssueDate, TargatedReturnDate, Note);

            if (resDataTable.Rows[0][0].ToString() == "yes")
            {
                MessageController.Show(MessageCode.SaveSucceeded, MessageType.Information, Page);
                ClearAllAdd();
                LoadGridView();
            }
            else
            {
                MessageController.Show(resDataTable.Rows[0][2].ToString(), MessageType.Error, Page);
            }
        }
        catch (Exception)
        {
            MessageController.Show("Save Failed. Please contact with admin.", MessageType.Error, Page);
        }
    }
    
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        LoadGridView();
    }
    void LoadGridView() {
        string criteria = GetCriteria();
        DataTable dt = obj.GetBookLendingByCriteria(criteria);
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
        string criteria = "lb_BookLending.Status != 'Returned'";
        if (tbxSearch_BookTrId.Text != "")
        {
            criteria += " AND TrackingId = '" + tbxSearch_BookTrId.Text + "'";
        }
        if (tbxSearch_UserName.Text != "")
        {
            criteria += " AND UserName = '" + tbxSearch_UserName.Text + "'";
        }
        return criteria;
    }
    protected void btnShowAddPanel_Click(object sender, EventArgs e)
    {
        pnlEdit.Visible = false;
        pnlAdd.Visible = true;
        ClearAllAdd();
        LoadGridView();
    }

    protected void btnEdit_Command(object sender, CommandEventArgs e)
    {
        int ID = Convert.ToInt32(e.CommandArgument);
        DataTable dt = obj.GetBookLendingById(ID);
        if (dt.Rows.Count > 0)
        {
            tbxEdit_BookTrId.Text = dt.Rows[0]["TrackingId"].ToString();
            tbxEdit_Note.Text = dt.Rows[0]["Note"].ToString();
            tbxEdit_UserName.Text = dt.Rows[0]["UserName"].ToString();
        }
        ViewState["ID"] = ID;
        pnlEdit.Visible = true;
        pnlAdd.Visible = false;
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        try
        {
            int Id = (int)ViewState["ID"];
            var Note = tbxEdit_Note.Text;
            DateTime StatusUpdationDate = dalCommon.DateFormatYYYYMMDD(tbxEdit_StatusUpdationDate.Text);
            Button clickedButton = (Button)sender;
            var Status = clickedButton.CommandArgument;
            //int Id, DateTime ActualReturnDateTime, string Status, string Note
            var resDataTable = obj.UpdateBookLending(Id, StatusUpdationDate, Status, Note);

            if (resDataTable.Rows[0][0].ToString() == "yes")
            {
                MessageController.Show(MessageCode.SaveSucceeded, MessageType.Information, Page);
                ClearAllEdit();
                LoadGridView();
            }
            else
            {
                MessageController.Show(resDataTable.Rows[0][1].ToString(), MessageType.Warning, Page);
            }
        }
        catch (Exception ex)
        {
            MessageController.Show(MessageCode.UpdateFailed, MessageType.Error, Page);
        }
    }
    protected void ClearAllAdd()
    {
        tbxAdd_BookTrId.Text = "";
        tbxAdd_IssueDate.Text = "";
        tbxAdd_Note.Text = "";
        tbxAdd_UserName.Text = "";
        tbxAdd_TargatedReturnDate.Text = "";
    }
    protected void ClearAllEdit()
    {
        tbxEdit_BookTrId.Text = "";
        tbxEdit_Note.Text = "";
        tbxEdit_UserName.Text = "";
        tbxEdit_StatusUpdationDate.Text = "";
    }
   

    //# Helper Methods
    protected bool ValidImage(FileUpload file)
    {
        bool flag = false;
        string extension = Path.GetExtension(file.FileName).ToLower();
        if (extension == ".jpeg" || extension == ".jpg" || extension == ".png")
        {
            flag = true;
            //if (file.PostedFile.ContentLength < 524288)
            //{
            //    flag = true;
            //}
        }
        return flag;
    }
}


