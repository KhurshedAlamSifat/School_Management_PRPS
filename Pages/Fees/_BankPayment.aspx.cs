using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Fees_BankPayment : BasePage
{
    dalPaymentType objpaymentType = new dalPaymentType();
    dalStudent objStudent = new dalStudent();
    dalPayment objPayment = new dalPayment();
    dalOnlinePayment op = new dalOnlinePayment();
    public static List<Tuple<string, string>> calculatedMonth;
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "/Pages/Fees/" + System.IO.Path.GetFileName(Request.PhysicalPath) + Request.Url.Query;
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
            ViewState["id"] = (int)0;
            LoadData();
            imgPerson.ImageUrl = "~/Images/Common/student.png";
        }
    }
    protected void LoadData()
    {
        Common.LoadDropdown(ddlYear, "bs_Year", 1, 1);
        DataTable dt = new dalYear().GetDefault();
        if (dt.Rows.Count > 0)
        {
            ddlYear.SelectedValue = dt.Rows[0][1].ToString();
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
    protected string GetCriteria()
    {
        string criteria = "";
        if (tbxRegNo.Text != "")
        {
            if (criteria == "")
                criteria = "ss_Student.RegNo like '%" + tbxRegNo.Text + "'";
            else
                criteria += " and ss_Student.RegNo like '%" + tbxRegNo.Text + "'";
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
            tbxRegNo.Text = dt.Rows[0]["RegistrationNo"].ToString();
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
    private void loadDues()
    {
        rptDues.DataSource = op.GetDues(tbxRegNo.Text);
        rptDues.DataBind();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            DataTable dt = op.GetDuesByMonthAndReg(tbxRegNo.Text, Convert.ToInt32(ddlYear.SelectedValue), Convert.ToInt32(ddlMonth.SelectedValue));
            decimal amount = 0;
            decimal paidAmount = 0;
            if (dt.Rows.Count > 0)
            {
                amount = Convert.ToDecimal(tbxPaid.Text);
                foreach (DataRow dr in dt.Rows)
                {
                    paidAmount = Convert.ToDecimal(dr["Amount"]);
                    if (amount > paidAmount)
                    {
                        op.InsertPaymentOnline(StudentId, Convert.ToInt32(ddlYear.SelectedValue), Convert.ToInt32(ddlMonth.SelectedValue), paidAmount, SessionManager.SessionName.UserName, tbxMobile.Text, tbxTxnId.Text, Convert.ToInt32(dr["PaymentTypeId"]), "Pubali Bank");
                        amount -= paidAmount;
                    }
                    else
                    {
                        op.InsertPaymentOnline(StudentId, Convert.ToInt32(ddlYear.SelectedValue), Convert.ToInt32(ddlMonth.SelectedValue), amount, SessionManager.SessionName.UserName, tbxMobile.Text, tbxTxnId.Text, Convert.ToInt32(dr["PaymentTypeId"]), "Pubali Bank");
                    }
                }
            }
            btnSave.Text = "Save";
            LoadPaymentHistory();
            loadDues();
        }
        catch
        {
            MessageController.Show("Something is wrong. Please contact with admin.", MessageType.Error, Page);
        }

    }
    protected void LoadPaymentHistory()
    {
        DataTable dt = objPayment.GetPaymentHistoryByStudentId(StudentId);
        rptHistory.DataSource = dt;
        rptHistory.DataBind();
        decimal amt = 0;
        foreach (DataRow dr in dt.Rows)
        {
            amt += Convert.ToDecimal(dr["TotalGiven"]);
        }
        lblTotal.Text = amt.ToString();
        btnSave.Text = "Save";
    }
    protected void tbxRegNo_TextChanged(object sender, EventArgs e)
    {
        LoadStudent();
        loadDues();
    }
}