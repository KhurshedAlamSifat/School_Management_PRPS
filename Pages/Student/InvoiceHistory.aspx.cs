using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using iTextSharp.text;
//using iTextSharp.text.html.simpleparser;
//using iTextSharp.text.pdf;

public partial class Pages_Student_InvoiceHistory : BasePage
{
    dalFeePayment dal = new dalFeePayment();
    protected void Page_Load(object sender, EventArgs e)
    {

        string url = "/Pages/Student/" + Path.GetFileName(Request.PhysicalPath) + Request.Url.Query;
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
            LoadInitialData();
        }
    }
    void LoadInitialData()
    {
        try
        {
            tbxStudent_Id.Text = "";
            tbxStudent_RegistrationNumber.Text = "";
            tbxStudent_Name.Text = "";
            tbxStudent_Class.Text = "";
            tbxStudent_Section.Text = "";
            tbxCurrentBalance.Text = "";
            var Student_Id = Common.SessionInfo.StudentId;
            DataTable dt = new dalStudent().GetDetailByCriteria(" ss_Student.Id=" + Student_Id);
            if (dt.Rows.Count > 0)
            {
                tbxStudent_Id.Text = dt.Rows[0]["Student_Id"].ToString();
                tbxStudent_RegistrationNumber.Text = dt.Rows[0]["Student_RegistrationNumber"].ToString();
                tbxStudent_Name.Text = dt.Rows[0]["Student_Name"].ToString();
                tbxStudent_Class.Text = dt.Rows[0]["Student_Class"].ToString();
                tbxStudent_Section.Text = dt.Rows[0]["Student_Section"].ToString();
                tbxCurrentBalance.Text = dt.Rows[0]["Student_CurrentBalance"].ToString();
                {
                    var invoiceDataTable = dal.StudentInvoice_Transectional_GetByCriteria(
                        StudentId: dt.Rows[0]["Student_Id"].ToString()
                        );
                    gvStudentDue.DataSource = invoiceDataTable;
                    gvStudentDue.DataBind();

                    lblTotalDepositedAmount.Text = invoiceDataTable.Compute("Sum(StudentInvoice_DepositedAmount)", "").ToString();
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
    protected void btnLoadStudent_Click(object sender, EventArgs e)
    {

    }
}


