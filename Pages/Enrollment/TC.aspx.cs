using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Enrollment_TC : BasePage
{
    dalPaymentType objpaymentType = new dalPaymentType();
    dalStudent objStudent = new dalStudent();
    dalPayment objPayment = new dalPayment();

    dalFeePayment dalFeePayment = new dalFeePayment();
    public static List<Tuple<string, string>> calculatedMonth;
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
        if (!IsPostBack)
        {
            ViewState["id"] = (int)0;
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
    private void loadDues()
    {
        var dueDataTable = dalFeePayment.StudentDue_Transectional_GetByCriteria(
                        StudentId: StudentId.ToString(),
                        ShortStatus: "Unpaid"
                        );
        gvStudentDue.DataSource = dueDataTable;
        gvStudentDue.DataBind();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            if (gvStudentDue.Rows.Count> 0)
            {
                MessageController.Show("Student Has Unpaid Dues. TC Can not be allowed before paying.", MessageType.Warning, Page);
            }
            else
            {
                objStudent.StudentTC(tbxRegNo.Text, tbxReason.Text);
                MessageController.Show("TC Completed.", MessageType.Confirmation, Page);
            }
        }
        catch
        {
            MessageController.Show("Something is wrong. Please contact with admin.", MessageType.Error, Page);
        }

    }
    protected void tbxRegNo_TextChanged(object sender, EventArgs e)
    {
        LoadStudent();
        loadDues();
    }
}