using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Fees_FeeCorrection : BasePage
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
            ViewState["id"] = (int)0;
            dtFees = TableFees();
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
        ddlFeeType.DataSource = new Common().GetAll("fee_PaymentType");
        ddlFeeType.DataBind();
        ListItem li = new ListItem("Select", "0");
        ddlFeeType.Items.Insert(0, li);
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
    DataTable dtFees
    {
        set { ViewState["dtFees"] = value; }
        get
        {
            try
            {
                return (DataTable)ViewState["dtFees"];
            }
            catch
            {
                return null;
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
    private DataTable TableFees()
    {
        DataTable dt = new DataTable("Fees");
        dt.Columns.Add("RegNo");
        dt.Columns.Add("Amount");
        dt.Columns.Add("Feetype");
        dt.Columns.Add("Year");
        dt.Columns.Add("Month");
        return dt;
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
        rptDues.DataSource = new dalOnlinePayment().GetDues(tbxRegNo.Text);
        rptDues.DataBind();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            new dalOnlinePayment().InsertPaymentForStudent(StudentId, Convert.ToInt32(ddlYear.SelectedValue), Convert.ToInt32(ddlMonth.SelectedValue), Convert.ToDecimal(tbxPaid.Text), SessionManager.SessionName.UserName, Convert.ToInt32(ddlFeeType.SelectedValue));
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
    protected void btnDelete_Command(object sender, CommandEventArgs e)
    {
        int ID = Convert.ToInt32(e.CommandArgument);
        new Common().Delete("ss_Payment", ID);
        MessageController.Show(MessageCode.DeleteSucceeded, MessageType.Information, Page);
        LoadPaymentHistory();
    }


    protected void btnBulkUpload_Click(object sender, EventArgs e)
    {
        if (flBulkUpload.HasFile)
        {
            dtFees = TableFees();
            string FileName = Path.GetFileName(flBulkUpload.PostedFile.FileName);
            string Extension = Path.GetExtension(flBulkUpload.PostedFile.FileName);
            //string FolderPath = ConfigurationManager.AppSettings["FolderPath"];

            string FilePath = Server.MapPath("~/VariableContent/FeesExcel/" + DateTime.Now.ToString("ddMMyyyyHH24MMSS") + FileName);
            flBulkUpload.SaveAs(FilePath);
            Import_To_Grid(FilePath, Extension, rbHDR.SelectedItem.Text);
            loadDues();
        }
    }
    private void Import_To_Grid(string FilePath, string Extension, string isHDR)
    {
        string conStr = "";
        switch (Extension)
        {
            case ".xls": //Excel 97-03
                conStr = ConfigurationManager.ConnectionStrings["Excel03ConString"]
                         .ConnectionString;
                break;
            case ".xlsx": //Excel 07
                conStr = ConfigurationManager.ConnectionStrings["Excel07ConString"]
                          .ConnectionString;
                break;
        }
        conStr = String.Format(conStr, FilePath, isHDR);
        OleDbConnection connExcel = new OleDbConnection(conStr);
        OleDbCommand cmdExcel = new OleDbCommand();
        OleDbDataAdapter oda = new OleDbDataAdapter();
        DataTable dt = new DataTable();
        cmdExcel.Connection = connExcel;

        //Get the name of First Sheet
        connExcel.Open();
        DataTable dtExcelSchema;
        dtExcelSchema = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
        string SheetName = dtExcelSchema.Rows[0]["TABLE_NAME"].ToString();
        connExcel.Close();

        //Read Data from First Sheet
        connExcel.Open();
        cmdExcel.CommandText = "SELECT * From [" + SheetName + "]";
        oda.SelectCommand = cmdExcel;
        oda.Fill(dt);
        connExcel.Close();
        foreach (DataRow dr in dt.Rows)
        {
            if (!string.IsNullOrEmpty(dr[0].ToString()))
            {
                string[] ids = dr[2].ToString().Split('-');
                dtFees.Rows.Add(dr[0], dr[1], ids[0], ddlYear.SelectedValue, ddlMonth.SelectedValue);
            }
            else
            {
                break;
            }
        }
        if (dtFees.Rows.Count > 0)
        {
            objpaymentType.PaymentInsertExcel(dtFees, SessionManager.SessionName.UserName);
            MessageController.Show(MessageCode.SaveSucceeded, MessageType.Information, Page);
        }
    }
}