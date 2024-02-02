using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Fees_StudentPayment : BasePage
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
            dtPayment = Payment();
            dtTotalPayment = TotalPayment();
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

    DataTable dtPayment
    {
        set { ViewState["dtPayment"] = value; }
        get
        {
            try
            {
                return (DataTable)ViewState["dtPayment"];
            }
            catch
            {
                return null;
            }
        }
    }
    DataTable dtTotalPayment
    {
        set { ViewState["dtTotalPayment"] = value; }
        get
        {
            try
            {
                return (DataTable)ViewState["dtTotalPayment"];
            }
            catch
            {
                return null;
            }
        }
    }
    #endregion
    protected void LoadData()
    {
        ddlYear.DataSource = new dalYear().GetDefault();
        ddlYear.DataBind();

        ddlClass.DataSource = new Common().GetAll("bs_ClassName");
        ddlClass.DataBind();
        ddlGroup.DataSource = new Common().GetAll("bs_Group");
        ddlGroup.DataBind();
    }

    protected void LoadPaymentByClass()
    {
        DataTable dt = objpaymentType.GetByYear(Convert.ToInt32(ddlYear.SelectedValue), chkMonth.SelectedValue, Convert.ToInt32(ddlClass.SelectedValue), Convert.ToInt32(ddlGroup.SelectedValue));
        if (dt.Rows.Count > 0)
        {
            rptPaymentByClass.DataSource = dt;
            rptPaymentByClass.DataBind();
            lblTotal.Text = dt.Rows[0]["Total"].ToString();
            if (lblPreviousDue.Text != "")
            {
                lblGrandTotal.Text = (Convert.ToDouble(lblTotal.Text) + Convert.ToDouble(lblPreviousDue.Text)).ToString();
            }
            else
            {
                lblGrandTotal.Text = lblTotal.Text;
            }
        }
        else
        {
            rptPaymentByClass.DataSource = null;
            rptPaymentByClass.DataBind();
            lblGrandTotal.Text = "";
            lblTotal.Text = "";
        }
    }

    protected string GetCriteria()
    {
        string criteria = "";
        if (ddlYear.SelectedValue != "0")
        {
            if (criteria == "")
                criteria = "er_StudentToClass.Year = " + ddlYear.SelectedItem.Text;
            else
                criteria += " and er_StudentToClass.Year = " + ddlYear.SelectedItem.Text;
        }
        if (ddlClass.SelectedValue != "0")
        {
            if (criteria == "")
                criteria = "er_StudentToClass.ClassId = " + ddlClass.SelectedValue;
            else
                criteria += " and er_StudentToClass.ClassId = " + ddlClass.SelectedValue;
        }
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
            btnSubmit.Visible = true;
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

            //Bind for Print
            printName.Text = dt.Rows[0]["NameEng"].ToString();
            PrintClass.Text = dt.Rows[0]["Class"].ToString();
            printGroup.Text = dt.Rows[0]["GroupName"].ToString();
            printSection.Text = dt.Rows[0]["Section"].ToString();
            printShift.Text = dt.Rows[0]["Shift"].ToString();
            printReg.Text = tbxRegNo.Text;
        }
        else
        {
            btnSubmit.Visible = false;
            pnlStudentInfo.Visible = false;
            lblMessage.Text = "No Student found. Please try another registration no.";
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
    }
    protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadPaymentByClass();
    }
    protected void ddlMonth_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadPaymentByClass();
    }

    protected void PreviousPaymentMonth()
    {
        DataView dv = objPayment.GetPaymentHistoryByStudentId(StudentId).DefaultView;
        dv.RowFilter = "Year=" + ddlYear.SelectedValue;
        DataTable dt = dv.ToTable();
        foreach (System.Web.UI.WebControls.ListItem li in chkMonth.Items)
        {
            foreach (DataRow drMonth in dt.Rows)
            {
                if (li.Value.ToString() == drMonth["Month"].ToString())
                {
                    li.Enabled = false;
                }
            }
        }
    }
    protected void LoadPaymentHistory()
    {
        DataTable dt = objPayment.GetPaymentHistoryByStudentId(StudentId);
        rptHistory.DataSource = dt;
        rptHistory.DataBind();
    }
    protected void tbxRegNo_TextChanged(object sender, EventArgs e)
    {
        LoadStudent();
        LoadPaymentHistory();
        PreviousPaymentMonth();
        DataTable dt = objPayment.GetPreviousPaymentByStudentId(StudentId);
        if (dt.Rows.Count > 0)
        {
            lblPreviousDue.Text = dt.Rows[0][0].ToString();
            lblGrandTotal.Text = (Convert.ToDouble(lblPreviousDue.Text) + Convert.ToDouble(lblTotal.Text)).ToString();
            LoadPayment();
        }
        LoadPopup();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        double paid = Convert.ToDouble(tbxAmount.Text);
        double due = 0;
        //if (tbxGiven.Text == "")
        //{
        //    return;
        //}
        //else
        //{
        //    if (Convert.ToDouble(tbxGiven.Text) > Convert.ToDouble(lblfinal.Text))
        //    {
        //        paid = Convert.ToDouble(lblfinal.Text);
        //    }
        //    else
        //    {
        //        paid = Convert.ToDouble(tbxGiven.Text);
        //    }
        //}
        if (lblPreviousDue.Text != "")
        {
            due = Convert.ToDouble(lblPreviousDue.Text);
        }
        if (tbxRegNo.Text != "")
        {
            foreach (DataRow dr in dtTotalPayment.Rows)
            {
                dr.BeginEdit();
                dr["Total"] = Convert.ToDouble(dr["Total"]) + due;
                if (Convert.ToDouble(dr["Total"]) > paid)
                {
                    dr["Paid"] = paid;
                }
                else
                {
                    dr["Paid"] = Convert.ToDouble(dr["Total"]);
                }
                dr["Due"] = Convert.ToDouble(dr["Total"]) - Convert.ToDouble(dr["Paid"]);
                due = Convert.ToDouble(dr["Due"]);
                paid = paid - Convert.ToDouble(dr["Paid"]);
                dr.EndEdit();
            }
            objPayment.UpdateDues(StudentId);
            objPayment.InsertStudentPayment(dtTotalPayment, Page.User.Identity.Name, DateTime.Now);
            tbxRegNo.Text = "";
            PreviousPaymentMonth();
        }

    }

    public DataTable Payment()
    {
        DataTable dt = new DataTable("PaymentForMonth");
        dt.Columns.Add("Year", typeof(int));
        dt.Columns.Add("Month", typeof(int));
        dt.Columns.Add("PaymentTypeId", typeof(int));
        dt.Columns.Add("PaymentType", typeof(string));
        dt.Columns.Add("Amount", typeof(double));
        dt.Columns.Add("Total", typeof(double));
        return dt;
    }
    public DataTable TotalPayment()
    {
        DataTable dt = new DataTable("TotalPayment");
        dt.Columns.Add("StudentId", typeof(int));
        dt.Columns.Add("Year", typeof(int));
        dt.Columns.Add("Month", typeof(int));
        dt.Columns.Add("Total", typeof(double));
        dt.Columns.Add("Paid", typeof(double));
        dt.Columns.Add("Due", typeof(double));
        return dt;
    }
    protected void chkMonth_SelectedIndexChanged(object sender, EventArgs e)
    {
        bool flag = false;
        dtPayment.Clear();
        dtTotalPayment.Clear();
        calculatedMonth = new List<Tuple<string, string>>();
        foreach (System.Web.UI.WebControls.ListItem item in chkMonth.Items)
        {
            if (item.Selected)
            {
                flag = true;
                DataTable dt = objpaymentType.GetByYear(Convert.ToInt32(ddlYear.SelectedValue), item.Value, Convert.ToInt32(ddlClass.SelectedValue), Convert.ToInt32(ddlGroup.SelectedValue));
                if (dt.Rows.Count > 0)
                {
                    dtTotalPayment.Rows.Add(StudentId, Convert.ToInt32(ddlYear.SelectedValue), item.Value, Convert.ToDouble(dt.Rows[0]["Total"]), 0, 0);
                }
                foreach (DataRow dr in dt.Rows)
                {
                    DataRow[] drEx = dtPayment.Select("Year=" + dr["YearId"] + " and PaymentTypeId=" + dr["PaymentTypeId"]);
                    if (drEx.Count() > 0)
                    {
                        DataRow drr = drEx[0];
                        drr.BeginEdit();
                        drr["Amount"] = Convert.ToDouble(drr["Amount"]) + Convert.ToDouble(dr["Amount"]);
                        drr["Total"] = Convert.ToDouble(drr["Total"]) + Convert.ToDouble(dr["Total"]);
                        drr.EndEdit();
                    }
                    else
                    {
                        dtPayment.Rows.Add(Convert.ToInt32(dr["YearId"]), Convert.ToInt32(dr["Month"]), Convert.ToInt32(dr["PaymentTypeId"]), dr["PaymentType"], Convert.ToDouble(dr["Amount"]), Convert.ToDouble(dr["Total"]));
                    }
                }
            }
        }
        rptPaymentByClass.DataSource = dtPayment;
        rptPaymentByClass.DataBind();
        if (dtPayment.Rows.Count > 0)
        {
            lblTotal.Text = dtPayment.Rows[0]["Total"].ToString();
            LoadPayment();
        }
        LoadPopup();
    }
    protected void LoadPayment()
    {
        if (lblPreviousDue.Text != "")
        {
            lblGrandTotal.Text = (Convert.ToDouble(lblTotal.Text) + Convert.ToDouble(lblPreviousDue.Text)).ToString();
        }
        if (lblFine.Text != "")
        {
            lblGrandTotal.Text = (Convert.ToDouble(lblGrandTotal.Text) + Convert.ToDouble(lblFine.Text)).ToString();
        }
        if (lblScholar.Text != "")
        {
            lblGrandTotal.Text = (Convert.ToDouble(lblGrandTotal.Text) - Convert.ToDouble(lblScholar.Text)).ToString();
        }
    }
    protected void LoadPopup()
    {
        popPreviousDue.Text = lblPreviousDue.Text;
        popLateFee.Text = lblFine.Text;
        popScholar.Text = lblScholar.Text;
        popTotal.Text = lblTotal.Text;
        popGrandTotal.Text = lblGrandTotal.Text;
    }
    protected void btnSubmitFine_Click(object sender, EventArgs e)
    {
        lblFine.Text = tbxLateFine.Text;
        tbxLateFine.Text = "";
        LoadPayment();
        LoadPopup();
    }
    protected void btnSubmitScholar_Click(object sender, EventArgs e)
    {
        lblScholar.Text = tbxScholar.Text;
        tbxScholar.Text = "";
        LoadPayment();
        LoadPopup();
    }

    protected void btnPdf_Click(object sender, EventArgs e)
    {
        Response.ContentType = "application/pdf";
        Response.AddHeader("content-disposition", "attachment;filename=Panel.pdf");
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        StringWriter sw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);
        pnlPdf.RenderControl(hw);
        StringReader sr = new StringReader(sw.ToString());
        Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
        HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
        PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
        pdfDoc.Open();
        htmlparser.Parse(sr);
        pdfDoc.Close();
        Response.Write(pdfDoc);
        Response.End();
    }
}