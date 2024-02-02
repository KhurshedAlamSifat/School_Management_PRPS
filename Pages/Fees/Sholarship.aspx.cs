using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Fees_Sholarship : BasePage
{
    dalPaymentType objpaymentType = new dalPaymentType();
    dalStudent objStudent = new dalStudent();
    dalPayment objPayment = new dalPayment();
    public static List<Tuple<string, string>> calculatedMonth;
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "/Pages/Fees/" + Path.GetFileName(Request.PhysicalPath) + Request.Url.Query;
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
            LoadData();
            imgPerson.ImageUrl = "~/Images/Common/student.png";
        }
    }
    #region variable
    int StudentId
    {
        set { ViewState["StudentId"] = value; }
        get
        {
            try
            {
                return Convert.ToInt32(ViewState["StudentId"]);
            }
            catch
            {
                return 0;
            }
        }
    }
    double Total
    {
        set { ViewState["Total"] = value; }
        get
        {
            try
            {
                return Convert.ToDouble(ViewState["Total"]);
            }
            catch
            {
                return 0;
            }
        }
    }

    #endregion
    protected void LoadData()
    {
        Common.LoadDropdown(ddlYear, "bs_Year", 1, 1);
        DataTable dt = new dalYear().GetDefault();
        if (dt.Rows.Count > 0)
        {
            ddlYear.SelectedValue = dt.Rows[0][1].ToString();
        }
    }
    protected string GetCriteria()
    {
        string criteria = "";
        if (tbxRegNo.Text != "")
        {
            if (criteria == "")
                criteria = "ss_Student.RegNo = '" + tbxRegNo.Text + "'";
            else
                criteria += " and ss_Student.RegNo = '" + tbxRegNo.Text + "'";
        }
        return criteria;
    }
    protected void LoadStudent()
    {

        string criteria = GetCriteria();
        DataTable dt = objStudent.GetStudentInformation(criteria);
        if (dt.Rows.Count > 0)
        {

            lblMessage.Text = "";
            pnlStudentInfo.Visible = true;
            StudentId = Convert.ToInt32(dt.Rows[0]["StudentId"].ToString());
            LoadPaymentHistory();
            lblNameEng.Text = dt.Rows[0]["NameEng"].ToString();
            lblNameBan.Text = dt.Rows[0]["NameBan"].ToString();
            lblClass.Text = dt.Rows[0]["Class"].ToString();
            lblGroup.Text = dt.Rows[0]["GroupName"].ToString();
            lblSection.Text = dt.Rows[0]["Section"].ToString();
            lblShift.Text = dt.Rows[0]["Shift"].ToString();
            lblFName.Text = dt.Rows[0]["FatherNameEng"].ToString();
            lblMName.Text = dt.Rows[0]["MotherNameEng"].ToString();
            if (dt.Rows[0]["PersonImage"].ToString() != "")
                imgPerson.ImageUrl = "~/VariableContent/Person/" + dt.Rows[0]["PersonImage"].ToString();
            else
                imgPerson.ImageUrl = "~/Images/Common/student.png";

        }
        else
        {
            StudentId = 0;
            pnlStudentInfo.Visible = false;
            lblMessage.Text = "No Student found. Please try another registration no.";
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            if (Convert.ToInt32(ddlYear.SelectedValue) >= DateTime.Now.Year && StudentId > 0)
            {
                foreach (ListItem l in chkMonth.Items)
                {

                    if (l.Selected)
                    {
                        if (Convert.ToInt32(l.Value) >= DateTime.Now.Month || Convert.ToInt32(ddlYear.SelectedValue) > DateTime.Now.Year)
                        {
                            objPayment.InsertScholarship(StudentId, Convert.ToInt32(ddlYear.SelectedValue), Convert.ToInt32(l.Value), Convert.ToDecimal(tbxAmount.Text), tbxRemarks.Text);
                        }
                    }
                }
                MessageController.Show(MessageCode.SaveSucceeded, MessageType.Confirmation, Page);
                LoadPaymentHistory();
            }
            else
            {
                MessageController.Show("Invalid Year or Registration No.", MessageType.Error, Page);
            }
        }
        catch
        {
            MessageController.Show("Something is wrong. Please contact with admin.", MessageType.Error, Page);
        }

    }
    protected void LoadPaymentHistory()
    {
        DataTable dt = objPayment.GetAllScholarshipByStudentId(StudentId);
        rptHistory.DataSource = dt;
        rptHistory.DataBind();
    }
    protected void tbxRegNo_TextChanged(object sender, EventArgs e)
    {
        LoadStudent();
    }
    protected void btnDelete_Command(object sender, CommandEventArgs e)
    {
        int ID = Convert.ToInt32(e.CommandArgument);
        new Common().Delete("fee_Scholarship", ID);
        MessageController.Show(MessageCode.DeleteSucceeded, MessageType.Information, Page);
        LoadPaymentHistory();
    }
}