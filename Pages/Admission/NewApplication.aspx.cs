using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Admission_NewApplication : BasePage
{
    dalApplication obj = new dalApplication();
    dalStudent objStudent = new dalStudent();
    dalPerson objPerson = new dalPerson();
    dalUser objUser = new dalUser();
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "/Pages/Admission/" + Path.GetFileName(Request.PhysicalPath) + Request.Url.Query;
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
            LoadDropdown();
        }
    }
    protected void LoadDropdown()
    {
        Common.LoadDropdown(ddlYear, "bs_Year", 1, 0);
        Common.LoadDropdown(ddlClass, "bs_ClassName", 1, 0);
        Common.LoadDropdown(ddlSection, "bs_Section", 1, 0);
        Common.LoadDropdown(ddlShift, "bs_Shift", 1, 0);
        DataTable dt = new dalYear().GetDefault();
        if (dt.Rows.Count > 0)
        {
            ddlYear.SelectedValue = dt.Rows[0][0].ToString();
        }
        ddlPaymentMethod.DataSource = new Common().GetAll("bs_PaymentMethod");
        ddlPaymentMethod.DataBind();
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {
            GetSearchData();
            CheckBox chk = (CheckBox)rptApplicationList.Controls[0].FindControl("chkstudentHeader");
            if (ddlSelected.SelectedIndex == 1)
            {
                chk.Enabled = true;
            }
            else
            {
                chk.Enabled = false;
            }
        }
        catch
        {

        }
    }
    private void GetSearchData()
    {
        string Conditions = "";
        Conditions += string.IsNullOrEmpty(ddlClass.SelectedValue) ? "" : " and c.ClassId= " + ddlClass.SelectedValue;
        Conditions += " and c.Year= " + ddlYear.SelectedValue;
        Conditions += " and a.PaymentStatus= " + ddlPaymentStatus.SelectedValue;
        Conditions += " and a.IsSelected= " + ddlSelected.SelectedValue;
        Conditions += " and a.IsAdmitted= " + ddlAdmitted.SelectedValue;
        Conditions += string.IsNullOrEmpty(tbxApplicatoinID.Text) ? "" : " and a.Id= " + tbxApplicatoinID.Text;
        Conditions += string.IsNullOrEmpty(tbxMobile.Text) ? "" : " and a.Mobile= " + tbxMobile.Text;
        DataTable dt = obj.GetSearchData(Conditions);
        rptApplicationList.DataSource = dt;
        rptApplicationList.DataBind();
    }
    protected void btnPayment_Command(object sender, CommandEventArgs e)
    {
        string ID = e.CommandArgument.ToString();
        tbxPaymentApplicationID.Text = ID;
        mpPayment.Show();

    }
    protected void btnReference_Command(object sender, CommandEventArgs e)
    {
        string ID = e.CommandArgument.ToString();
        tbxmpRefApplicationID.Text = ID;
        mpRef.Show();
    }
    protected void btnReference_Click(object sender, EventArgs e)
    {
        try
        {
            obj.ReferenceUpdate(Convert.ToInt64(tbxmpRefApplicationID.Text), tbxReference.Text);
            MessageController.Show(MessageCode.UpdateSucceeded, MessageType.Information, Page);
            GetSearchData();
        }
        catch
        {
            MessageController.Show(MessageCode.UpdateFailed, MessageType.Error, Page);
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            obj.PaymentUpdate(Convert.ToInt64(tbxPaymentApplicationID.Text), Convert.ToInt32(tbxAdmissionFormFee.Text), Convert.ToInt32(ddlPaymentMethod.Text), tbxTransactionID.Text);//AdmissionFormFee
            MessageController.Show(MessageCode.UpdateSucceeded, MessageType.Information, Page);
            GetSearchData();
        }
        catch
        {
            MessageController.Show(MessageCode.UpdateFailed, MessageType.Error, Page);
        }
    }
    protected void btnSectionAdmit_Click(object sender, EventArgs e)
    {
        try
        {
            foreach (RepeaterItem i in rptApplicationList.Items)
            {

                CheckBox chk = (CheckBox)i.FindControl("chkIsAdmitted");
                if (chk.Checked)
                {
                    HiddenField appId = (HiddenField)i.FindControl("hdnAppId");
                    DataTable dtCount = objStudent.GetStudentInformation(" ApplicationId=" + appId.Value);
                    if (dtCount.Rows.Count == 0)
                    {
                        DataTable dt = obj.GetById(Convert.ToInt64(appId.Value));
                        if (dt.Rows.Count > 0)
                        {
                            string RegNo = objStudent.GetStudentRegNo(Convert.ToInt32(dt.Rows[0]["ClassId"]), dt.Rows[0]["cYear"].ToString());
                            PIN = dalCommon.RandomString(8);
                            UserId = objUser.CreateUsers(RegNo, 4, EncryptionDecryption.Encrypt(PIN, true), "", SessionManager.SessionName.UserName, DateTime.Now);
                            if (UserId > 0)
                            {
                                PersonId = objPerson.PersonalInfoInsert(dt.Rows[0]["Name"].ToString(), dt.Rows[0]["Name"].ToString(), Convert.ToInt32(dt.Rows[0]["GenderId"]), Convert.ToInt32(dt.Rows[0]["ReligionId"]), dt.Rows[0]["Nationality"].ToString(), Convert.ToDateTime(dt.Rows[0]["DateofBirth"]), "",
                                "", dt.Rows[0]["Mobile"].ToString(), "", dt.Rows[0]["MobileHome"].ToString(), dt.Rows[0]["Email"].ToString(), "", 1, "", UserId);
                                if (PersonId > 0)
                                {
                                    StudentId = objStudent.Insert(PersonId, RegNo, DateTime.Now, dt.Rows[0]["cYear"].ToString(), SessionManager.SessionName.UserName, DateTime.Now, Convert.ToInt64(dt.Rows[0]["Id"]));

                                    objStudent.StudentToClass(StudentId, dt.Rows[0]["cYear"].ToString(), Convert.ToInt32(dt.Rows[0]["ClassId"]), Convert.ToInt32(dt.Rows[0]["GroupId"]), Convert.ToInt32(ddlShift.SelectedValue),
                                       Convert.ToInt32(ddlSection.SelectedValue), Controller.GetLastRoll(GetCriteria(dt.Rows[0]["cYear"].ToString(), dt.Rows[0]["ClassId"].ToString(), dt.Rows[0]["GroupId"].ToString())));

                                    objPerson.UpdateFatherInfo(PersonId, dt.Rows[0]["FathersName"].ToString(), "", "", 0, dt.Rows[0]["MobileHome"].ToString(), 7, 10);
                                    objPerson.UpdateMotherInfo(PersonId, dt.Rows[0]["MothersName"].ToString(), "", "", 0, dt.Rows[0]["MobileHome"].ToString(), 7, 10);

                                    objPerson.PresentAddressInsert(PersonId, Convert.ToInt32(dt.Rows[0]["divId"]), Convert.ToInt32(dt.Rows[0]["dstId"]), Convert.ToInt32(dt.Rows[0]["ThanaId"]), dt.Rows[0]["PostOffice"].ToString(), dt.Rows[0]["PostCode"].ToString(), dt.Rows[0]["Address"].ToString());
                                    objPerson.PermanentAddressInsert(PersonId, Convert.ToInt32(dt.Rows[0]["divId"]), Convert.ToInt32(dt.Rows[0]["dstId"]), Convert.ToInt32(dt.Rows[0]["ThanaId"]), dt.Rows[0]["PostOffice"].ToString(), dt.Rows[0]["PostCode"].ToString(), dt.Rows[0]["Address"].ToString());

                                    DataTable dtPayment = TotalPayment();
                                    dtPayment.Rows.Add(StudentId, Convert.ToInt32(dt.Rows[0]["cYear"]), 1, Convert.ToDecimal(dt.Rows[0]["AdmissionFee"]), 0, Convert.ToDecimal(dt.Rows[0]["AdmissionFee"]));
                                    new dalPayment().InsertStudentPayment(dtPayment, SessionManager.SessionName.UserName, DateTime.Now);

                                    obj.AdmissionUpdate(Convert.ToInt64(dt.Rows[0]["Id"]));
                                    string msg = "Dear " + dt.Rows[0]["Name"].ToString() + ", Your admission is completed. Please pay " + LoadPaymentByClass(Convert.ToInt32(dt.Rows[0]["cYear"]), "1", Convert.ToInt32(dt.Rows[0]["ClassId"]), Convert.ToInt32(dt.Rows[0]["GroupId"]), Convert.ToDecimal(dt.Rows[0]["AdmissionFee"])) + " BDT to Biller ID 247 from 27 to 29 Dec 2016 by DBBL Mobile Banking. Your Registration number is " + RegNo + " ---PRPS";
                                    dalCommon.SendSMS("", "", "PRPS", dt.Rows[0]["Mobile"].ToString(), msg);

                                    //dalCommon.SendSMS("", "", "PRPS", "01992661774", msg);
                                    //dalCommon.SendSMS("", "", "PRPS", "01912257203", msg);
                                }
                                else
                                {
                                    //MessageController.Show(MessageCode.SaveFailed, MessageType.Error, Page);
                                }
                            }
                            else
                            {
                                //MessageController.Show("This registration number already exists. Please try another", MessageType.Error, Page);
                            }
                        }
                    }
                }
                else
                {
                    //MessageController.Show("This student already admitted. Please try another", MessageType.Error, Page);
                }
            }
            MessageController.Show(MessageCode.SaveSucceeded, MessageType.Confirmation, Page);
        }
        catch (Exception ex)
        {
            MessageController.Show("Something is wrong. Please try contact with admin", MessageType.Error, Page);
        }
        mpSection.Hide();
    }
    private string LoadPaymentByClass(int Year, string month, int Class, int Group, decimal total)
    {
        DataTable dt = new dalPaymentType().GetByYear(Year, month, Class, Group);
        decimal gTotal = 0;
        if (dt.Rows.Count > 0)
        {
            gTotal = Convert.ToDecimal(dt.Rows[0]["Total"]) + total;
        }
        else
        {
            gTotal = total;
        }
        return gTotal.ToString();
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
    protected string GetCriteria(string Year, string ClassId, string Group)
    {
        string criteria = "Year=" + Year;
        criteria += " and ClassId=" + ClassId;
        criteria += " and GroupId=" + Group;

        if (ddlShift.SelectedValue != "")
        {
            criteria += " and ShiftId=" + ddlShift.SelectedValue;
        }
        if (ddlSection.SelectedValue != "")
        {
            criteria += " and SectionId=" + ddlSection.SelectedValue;
        }

        return criteria;
    }
    #region Variable
    int PersonId
    {
        set { ViewState["PersonId"] = value; }
        get
        {
            try
            {
                return Convert.ToInt32(ViewState["PersonId"]);
            }
            catch
            {
                return 0;
            }
        }
    }

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

    int UserId
    {
        set { ViewState["UserId"] = value; }
        get
        {
            try
            {
                return Convert.ToInt32(ViewState["UserId"]);
            }
            catch
            {
                return 0;
            }
        }
    }

    string PIN
    {
        set { ViewState["PIN"] = value; }
        get
        {
            try
            {
                return ViewState["PIN"].ToString();
            }
            catch
            {
                return "";
            }
        }
    }
    #endregion
}