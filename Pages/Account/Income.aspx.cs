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

public partial class Pages_Account_Income : BasePage
{
    dalAccount objAccount = new dalAccount();
    protected static int ID;
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "/Pages/Account/" + Path.GetFileName(Request.PhysicalPath) + Request.Url.Query;
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
            LoadIncomeCategory();
            LoadIncome();
        }
    }
    protected void LoadIncomeCategory()
    {
        DataTable dt = new Common().GetAll("acc_IncomeCategory");
        ddlIncome.DataSource = dt;
        ddlIncome.DataBind();
    }
    protected void LoadIncome()
    {
        DataTable dt = objAccount.GetIncome();
        rpt.DataSource = dt;
        rpt.DataBind();
    }
    protected bool ValidImage(FileUpload file)
    {
        bool flag = false;
        string extension = Path.GetExtension(file.FileName).ToLower();
        if (extension == "jpeg" || extension == ".jpg" || extension == ".png")
        {
            if (file.PostedFile.ContentLength < 6218595)
            {
                flag = true;
            }
        }
        return flag;
    }
    protected void btnEdit_Command(object sender, CommandEventArgs e)
    {
        ID = Convert.ToInt32(e.CommandArgument);
        DataTable dt = objAccount.GetIncomeById(ID);
        if(dt.Rows.Count>0)
        {
            tbxDate.Text = Convert.ToDateTime(dt.Rows[0]["Date"]).ToString();
            tbxAmount.Text = dt.Rows[0]["Amount"].ToString();
            tbxNote.Text = dt.Rows[0]["Details"].ToString();
            ddlIncome.SelectedValue = dt.Rows[0]["IncomeCategoryId"].ToString();
            imgAttachment.ImageUrl = "~/VariableContent/Student/" + dt.Rows[0]["Attachment"].ToString();
            imgAttachment.Visible = true;
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string attachment = "";
        if (attachmentUpload.HasFile)
        {
            if (ValidImage(attachmentUpload))
            {
                attachment = Guid.NewGuid() + "-" + attachmentUpload.FileName;
                System.Drawing.Image image = System.Drawing.Image.FromStream(attachmentUpload.FileContent);
                System.Drawing.Image image2 = Controller.resizeImage(image, new Size(700, 750));
                EncoderParameters encoderParameters = new EncoderParameters(1);
                encoderParameters.Param[0] = new EncoderParameter(Encoder.Compression, 100);
                string MediumImagePath = Server.MapPath("~/VariableContent/Attachment/" + attachment);
                image2.Save(string.Concat(MediumImagePath), ImageCodecInfo.GetImageEncoders()[1], encoderParameters);
            }
        }
        objAccount.IncomeInsert(Convert.ToInt32(ddlIncome.SelectedValue), DateTime.ParseExact(tbxDate.Text, "dd/MM/yyyy", null), Convert.ToDouble(tbxAmount.Text), attachment, tbxNote.Text, Page.User.Identity.Name, DateTime.Now);
        MessageController.Show(MessageCode.SaveSucceeded,MessageType.Information,Page);
        LoadIncome();
    }
    protected void btnIncomeCategory_Click(object sender, EventArgs e)
    {
        ID = objAccount.InsertIncomeCategory(tbxName.Text);
        if (ID != -1)
        {
            tbxName.Text = "";
            MessageController.Show(MessageCode.SaveSucceeded, MessageType.Information, Page);
        }
        else
            MessageController.Show("This category already exists. Please try anothor.", MessageType.Error, Page);
        LoadIncomeCategory();
    }
}