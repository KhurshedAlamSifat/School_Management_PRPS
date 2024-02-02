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

public partial class Pages_Student_CurrentPaymentStatus : BasePage
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
                    var dueDataTable = dal.StudentDue_Transectional_GetByCriteria(
                        StudentId: dt.Rows[0]["Student_Id"].ToString(),
                        ShortStatus: "Unpaid"
                        );
                    gvStudentDue.DataSource = dueDataTable;
                    gvStudentDue.DataBind();

                    var currentBalance = Convert.ToDecimal(dt.Rows[0]["Student_CurrentBalance"].ToString());
                    var totalPayable = Convert.ToDecimal(dueDataTable.Compute("SUM(StudentDue_AppliedAmount)", string.Empty));
                    tbxTotalPayable.Text = totalPayable.ToString();

                    var netPayable = totalPayable - currentBalance;
                    tbxNetPayable.Text = netPayable.ToString();
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


