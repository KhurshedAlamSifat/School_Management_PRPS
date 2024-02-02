using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Teacher_AddNew : BasePage
{
    dalTeacher objTeacher= new dalTeacher();
    dalPerson objPerson = new dalPerson();
    dalUser objUser = new dalUser();
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "/Pages/Teacher/" + Path.GetFileName(Request.PhysicalPath) + Request.Url.Query;
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
            TableEducation = Education();
            TableTraining = Training();
        }
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

    int TeacherId
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

    DataTable TableEducation
    {
        set { ViewState["TableEducation"] = value; }
        get
        {
            try
            {
                return (DataTable)ViewState["TableEducation"];
            }
            catch
            {
                return null;
            }
        }
    }

    DataTable TableTraining
    {
        set { ViewState["TableTraining"] = value; }
        get
        {
            try
            {
                return (DataTable)ViewState["TableTraining"];
            }
            catch
            {
                return null;
            }
        }
    }
    #endregion

    #region Load All Dropdown
    protected void LoadDropdown()
    {
        Common.LoadDropdown(ddlGender, "bs_Gender", 1, 0);
        Common.LoadDropdown(ddlReligion, "bs_Religion", 1, 0);
        Common.LoadDropdown(ddlFatherEdu, "bs_Qualification", 1, 0);
        Common.LoadDropdown(ddlFatherPro, "bs_Profession", 1, 0);
        Common.LoadDropdown(ddlMotherEdu, "bs_Qualification", 1, 0);
        Common.LoadDropdown(ddlMotherPro, "bs_Profession", 1, 0);
        Common.LoadDropdown(ddlPresentDiv, "bs_Division", 1, 0);
        Common.LoadDropdown(ddlPermanentDiv, "bs_Division", 1, 0);
        Common.LoadDropdown(ddlBlood, "bs_BloodGroup", 1, 0);
        Common.LoadDropdown(ddlDesignation, "bs_Designation", 1, 0);
        Common.LoadDropdown(ddlPayScaleGrade, "pr_Type", 1, 0);
       // Common.LoadDropdown(ddlRole, "RoleSetup", 1, 0);
    }

    #endregion

    protected void LoadPayScale()
    {
        DataTable dt = new dalPayrollBasic().TypeGetById(Convert.ToInt32(ddlPayScaleGrade.SelectedValue));
        if (dt.Rows.Count > 0)
        {
            lblPayScale.Text = dt.Rows[0]["Scale"].ToString();
            lblBasicSalary.Text = dt.Rows[0]["Basic"].ToString();
        }
    }
    protected void ddlPayScaleGrade_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadPayScale();
    }

    protected bool ValidImage(FileUpload file)
    {
        bool flag = false;
        string extension = Path.GetExtension(file.FileName).ToLower();
        if (extension == ".jpeg" || extension == ".jpg" || extension == ".png")
        {
            if (file.PostedFile.ContentLength < 524288)
            {
                flag = true;
            }
        }
        return flag;
    }

    private static Random random = new Random();
    public static string RandomString(int length)
    {
        const string chars = "abcdefghijklmnopqrstuvwxyz0123456789";
        return new string(Enumerable.Repeat(chars, length)
          .Select(s => s[random.Next(s.Length)]).ToArray());
    }

    protected void btnBasic_Click(object sender, EventArgs e)
    {
        UserId = objUser.CreateUsers(tbxUserName.Text, 3, EncryptionDecryption.Encrypt(tbxPassword.Text, true), "", SessionManager.SessionName.UserName, DateTime.Now);
        if (UserId > 0)
        {
            PersonId = objPerson.PersonalInfoInsert(tbxNameEng.Text, tbxNameBan.Text, Convert.ToInt32(ddlGender.SelectedValue), Convert.ToInt32(ddlReligion.SelectedValue), "Bangladeshi by Birth", dalCommon.DateFormatYYYYMMDD(tbxDateOfBirth.Text), tbxBirthCertificate.Text,
            tbxPhone.Text, tbxMobile.Text, tbxPhnHome.Text, tbxMobHome.Text, tbxEmail.Text, tbxFax.Text, Convert.ToInt32(ddlBlood.SelectedValue), "", UserId);
            if (PersonId > 0)
            {
                TeacherId = objTeacher.Insert(PersonId, Convert.ToInt32(ddlDesignation.SelectedValue), tbxTeacherPIN.Text, tbxNID.Text, dalCommon.DateFormatYYYYMMDD(tbxJoinDate.Text), SessionManager.SessionName.UserName, DateTime.Now);
                objTeacher.InsertPayScale(1, PersonId);
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "buttonclick('#parent');", true);
            }
            else
            {
                MessageController.Show(MessageCode.SaveFailed, MessageType.Error, Page);
            }
        }
        else
        {
            MessageController.Show("This username already exists. Please try another", MessageType.Error, Page);
        }
    }
    protected void btnParent_Click(object sender, EventArgs e)
    {
        if (PersonId > 0)
        {
            int fatherIncome = 0;
            int motherIncome = 0;
            if (tbxFatherIncome.Text != "")
                fatherIncome = Convert.ToInt32(tbxFatherIncome.Text);
            if (tbxMotherIncome.Text != "")
                motherIncome = Convert.ToInt32(tbxMotherIncome.Text);
            objPerson.UpdateFatherInfo(PersonId, tbxFathername.Text, "", tbxFatherNID.Text, fatherIncome, tbxFatherPhn.Text, Convert.ToInt32(ddlFatherEdu.SelectedValue), Convert.ToInt32(ddlFatherPro.SelectedValue));
            objPerson.UpdateMotherInfo(PersonId, tbxMotherName.Text, "", tbxMotherNID.Text, motherIncome, tbxMotherPhn.Text, Convert.ToInt32(ddlMotherEdu.SelectedValue), Convert.ToInt32(ddlMotherPro.SelectedValue));
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "buttonclick('#address');", true);
        }
    }

    protected void btnAddress_Click(object sender, EventArgs e)
    {
        if (PersonId > 0)
        {
            objPerson.PresentAddressInsert(PersonId, Convert.ToInt32(ddlPresentDiv.SelectedValue), Convert.ToInt32(ddlPresentDis.SelectedValue), Convert.ToInt32(ddlPresentThana.SelectedValue), tbxPostOffice.Text, tbxPostalCode.Text, tbxPresentAddress.Text);
            objPerson.PermanentAddressInsert(PersonId, Convert.ToInt32(ddlPermanentDiv.SelectedValue), Convert.ToInt32(ddlPermanentDis.SelectedValue), Convert.ToInt32(ddlPermanentThana.SelectedValue), tbxPermanentPost.Text, tbxPermanentPostCode.Text, tbxPermanentAddress.Text);
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "buttonclick('#education');", true);
        }
    }

    protected void btnEducation_Click(object sender, EventArgs e)
    {
        objTeacher.EducationInsert(TeacherId,TableEducation);
        objTeacher.TrainingInsert(TeacherId,TableTraining);
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "buttonclick('#photo');", true);
    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        #region ImageUpload
        string imgStudent = "";
        string imgFather = "";
        string imgMother = "";

        if (uploderStudent.HasFile)
        {
            if (ValidImage(uploderStudent) == true)
            {
                imgStudent = Guid.NewGuid() + "-" + uploderStudent.FileName;
                System.Drawing.Image image = System.Drawing.Image.FromStream(uploderStudent.FileContent);
                System.Drawing.Image image2 = Controller.resizeImage(image, new Size(140, 140));
                EncoderParameters encoderParameters = new EncoderParameters(1);
                encoderParameters.Param[0] = new EncoderParameter(Encoder.Compression, 100);
                string MediumImagePath = Server.MapPath("~/VariableContent/Person/" + imgStudent);
                image2.Save(string.Concat(MediumImagePath), ImageCodecInfo.GetImageEncoders()[1], encoderParameters);
            }
        }

        if (uploadFather.HasFile)
        {
            if (ValidImage(uploadFather) == true)
            {
                imgFather = Guid.NewGuid() + "-" + uploadFather.FileName;
                System.Drawing.Image image = System.Drawing.Image.FromStream(uploadFather.FileContent);
                System.Drawing.Image image2 = Controller.resizeImage(image, new Size(140, 140));
                EncoderParameters encoderParameters = new EncoderParameters(1);
                encoderParameters.Param[0] = new EncoderParameter(Encoder.Compression, 100);
                string MediumImagePath = Server.MapPath("~/VariableContent/Father/" + imgFather);
                image2.Save(string.Concat(MediumImagePath), ImageCodecInfo.GetImageEncoders()[1], encoderParameters);
            }
        }

        if (uploadMother.HasFile)
        {
            if (ValidImage(uploadMother) == true)
            {
                imgMother = Guid.NewGuid() + "-" + uploadMother.FileName;
                System.Drawing.Image image = System.Drawing.Image.FromStream(uploadMother.FileContent);
                System.Drawing.Image image2 = Controller.resizeImage(image, new Size(140, 140));
                EncoderParameters encoderParameters = new EncoderParameters(1);
                encoderParameters.Param[0] = new EncoderParameter(Encoder.Compression, 100);
                string MediumImagePath = Server.MapPath("~/VariableContent/Mother/" + imgMother);
                image2.Save(string.Concat(MediumImagePath), ImageCodecInfo.GetImageEncoders()[1], encoderParameters);
            }
        }
        objPerson.UpdateAllImage(PersonId, imgStudent, imgFather, imgMother);
        MessageController.Show(MessageCode.SaveSucceeded, MessageType.Confirmation, Page);
        Response.Redirect("~/Pages/Teacher/View.aspx?Id=" + TeacherId);

        #endregion
    }

    #region Address Selected Index Change
    protected void ddlPresentDiv_SelectedIndexChanged(object sender, EventArgs e)
    {
        Common.DropdownByCondition(ddlPresentDis, "bs_District", "DivisionId", ddlPresentDiv.SelectedValue, 2, 0);
    }
    protected void ddlPresentDis_SelectedIndexChanged(object sender, EventArgs e)
    {
        Common.DropdownByCondition(ddlPresentThana, "bs_Thana", "DistrictId", ddlPresentDis.SelectedValue, 2, 0);
    }
    protected void ddlPermanentDiv_SelectedIndexChanged(object sender, EventArgs e)
    {
        Common.DropdownByCondition(ddlPermanentDis, "bs_District", "DivisionId", ddlPermanentDiv.SelectedValue, 2, 0);
    }
    protected void ddlPermanentDis_SelectedIndexChanged(object sender, EventArgs e)
    {
        Common.DropdownByCondition(ddlPermanentThana, "bs_Thana", "DistrictId", ddlPermanentDis.SelectedValue, 2, 0);
    }

    protected void chkPresent_CheckedChanged(object sender, EventArgs e)
    {
        if (chkPresent.Checked)
        {
            tbxPermanentPost.Text = tbxPostOffice.Text;
            tbxPermanentPostCode.Text = tbxPostalCode.Text;
            tbxPermanentAddress.Text = tbxPresentAddress.Text;

            if (ddlPresentDiv.SelectedValue != "")
            {
                ddlPermanentDiv.SelectedValue = ddlPresentDiv.SelectedValue;
                Common.DropdownByCondition(ddlPermanentDis, "bs_District", "DivisionId", ddlPermanentDiv.SelectedValue, 2, 0);
            }

            if (ddlPresentDis.SelectedValue != "")
            {
                ddlPermanentDis.SelectedValue = ddlPresentDis.SelectedValue;
                Common.DropdownByCondition(ddlPermanentThana, "bs_Thana", "DistrictId", ddlPermanentDis.SelectedValue, 2, 0);
            }
            if (ddlPresentThana.SelectedValue != "")
            {
                ddlPermanentThana.SelectedValue = ddlPresentThana.SelectedValue;
            }
        }
        else
        {
            tbxPermanentPost.Text = "";
            tbxPermanentPostCode.Text = "";
            tbxPermanentAddress.Text = "";
            Common.LoadDropdown(ddlPermanentDiv, "bs_Division", 1, 0);
            ddlPermanentDis.SelectedValue = "";
            ddlPermanentDis.Items.Clear();
            ddlPermanentThana.SelectedValue = "";
            ddlPermanentThana.Items.Clear();
        }
    }
    #endregion

    #region Education/Training
    protected DataTable Education()
    {
        DataTable dt = new DataTable("dtEducation");
        dt.Columns.Add("DegreeName", typeof(string));
        dt.Columns.Add("Board", typeof(string));
        dt.Columns.Add("Grade", typeof(string));
        dt.Columns.Add("PassingYear", typeof(string));
        dt.Columns.Add("Subject", typeof(string));
        dt.Columns.Add("GPAScale", typeof(string));
        dt.Columns.Add("ResultDivision", typeof(string));
        return dt;
    }

    protected DataTable Training()
    {
        DataTable dt = new DataTable("dtTraining");
        dt.Columns.Add("TrainingName", typeof(string));
        dt.Columns.Add("InstituteName", typeof(string));
        dt.Columns.Add("StartDate", typeof(DateTime));
        dt.Columns.Add("EndDate", typeof(DateTime));
        dt.Columns.Add("Topics", typeof(string));
        dt.Columns.Add("Duration", typeof(int));
        return dt;
    }
    #endregion
    protected void btnEducationAdd_Click(object sender, EventArgs e)
    {
        TableEducation.Rows.Add(ddlDegree.SelectedItem.Text, tbxBoard.Text, tbxGrade.Text, tbxYear.Text, tbxSubject.Text, tbxScale.Text, ddlResult.SelectedItem.Text);
        gvEducation.DataSource = TableEducation;
        gvEducation.DataBind();
        ClearEducation();
    }
    protected void btnTraining_Click(object sender, EventArgs e)
    {
        DateTime start=DateTime.ParseExact(tbxStartDate.Text,"dd/MM/yyyy",null);
        DateTime end = DateTime.ParseExact(tbxEndDate.Text, "dd/MM/yyyy", null);
        int duration=Convert.ToInt32((end-start).TotalDays);
        TableTraining.Rows.Add(tbxTrainingName.Text, tbxInstitute.Text, start, end, tbxTopics.Text, duration);
        gvTraining.DataSource = TableTraining;
        gvTraining.DataBind();
        ClearTraining();
    }

    protected void ClearEducation()
    {
        ddlDegree.SelectedValue = "";
        tbxBoard.Text = "";
        tbxGrade.Text = "";
        tbxYear.Text = "";
        tbxSubject.Text = "";
        tbxScale.Text = "";
        ddlResult.SelectedValue = "";

    }
    protected void ClearTraining()
    {
        tbxTrainingName.Text = "";
        tbxInstitute.Text = "";
        tbxStartDate.Text = "";
        tbxEndDate.Text = "";
        tbxTopics.Text = "";
    }
    protected void lnkDelete_Command(object sender, CommandEventArgs e)
    {
        MessageController.Show(MessageCode.DeleteSucceeded, MessageType.Confirmation, Page);
    }
    protected void lnkTrainDelete_Command(object sender, CommandEventArgs e)
    {
        MessageController.Show(MessageCode.DeleteSucceeded, MessageType.Confirmation, Page);
    }

    
}