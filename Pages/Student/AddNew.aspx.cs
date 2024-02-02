using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Student_AddNew : BasePage
{
    dalStudent objStudent = new dalStudent();
    dalPerson objPerson = new dalPerson();
    dalUser objUser = new dalUser();
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
            //Controller.DeleteIncomplete();
            LoadDropdown();
            Session["Password"] = null;
            //tbxRegNo.Text = objStudent.GetStudentRegNo(Convert.ToInt32(ddlClass.SelectedValue), ddlYear.SelectedValue);
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

        Common.LoadDropdown(ddlYear, "bs_Year", 1, 1);
        //Common.LoadDropdown(ddlClass, "bs_ClassName", 1, 0);
        ddlClass.DataSource = new Common().GetAll("bs_ClassName");
        ddlClass.DataBind();
        Common.LoadDropdown(ddlGroup, "bs_Group", 1, 0);
        Common.LoadDropdown(ddlShift, "bs_Shift", 1, 0);
        Common.LoadDropdown(ddlSection, "bs_Section", 1, 0);
        DataTable dt = new dalYear().GetDefault();
        if (dt.Rows.Count > 0)
        {
            ddlYear.SelectedValue = dt.Rows[0][1].ToString();
        }
    }
    #endregion

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

    #region Get Criteria
    protected string GetCriteria()
    {
        string criteria = "";
        if (ddlYear.SelectedValue != "")
        {
            if (criteria == "")
                criteria = "Year=" + ddlYear.SelectedItem.Text;
            else
                criteria += " Year=" + ddlYear.SelectedItem.Text;
        }

        if (ddlClass.SelectedValue != "")
        {
            if (criteria == "")
                criteria = "ClassId=" + ddlClass.SelectedValue;
            else
                criteria += " and ClassId=" + ddlClass.SelectedValue;
        }
        if (ddlGroup.SelectedValue != "")
        {
            if (criteria == "")
                criteria = "GroupId=" + ddlGroup.SelectedValue;
            else
                criteria += " and GroupId=" + ddlGroup.SelectedValue;
        }
        if (ddlShift.SelectedValue != "")
        {
            if (criteria == "")
                criteria = "ShiftId=" + ddlShift.SelectedValue;
            else
                criteria += " and ShiftId=" + ddlShift.SelectedValue;
        }
        if (ddlSection.SelectedValue != "")
        {
            if (criteria == "")
                criteria = "SectionId=" + ddlSection.SelectedValue;
            else
                criteria += " and SectionId=" + ddlSection.SelectedValue;
        }
        if (tbxRoll.Text != "")
        {
            if (criteria == "")
                criteria = "RollNo=" + tbxRoll.Text;
            else
                criteria += " and RollNo=" + tbxRoll.Text;
        }

        return criteria;
    }
    #endregion
    protected void btnBasic_Click(object sender, EventArgs e)
    {
        tbxRegNo.Text = objStudent.GetStudentRegNo(Convert.ToInt32(ddlClass.SelectedValue), ddlYear.SelectedValue);

        PIN = RandomString(5);
        int bloodgroup = string.IsNullOrEmpty(ddlBlood.SelectedValue) ? 0 : Convert.ToInt32(ddlBlood.SelectedValue);
        UserId = objUser.CreateUsers(tbxRegNo.Text, 4, EncryptionDecryption.Encrypt(PIN, true), "", SessionManager.SessionName.UserName, DateTime.Now);
        if (UserId > 0)
        {
            PersonId = objPerson.PersonalInfoInsert(tbxNameEng.Text, tbxNameBan.Text, Convert.ToInt32(ddlGender.SelectedValue), Convert.ToInt32(ddlReligion.SelectedValue), "Bangladeshi by Birth", dalCommon.DateFormatYYYYMMDD(tbxDateOfBirth.Text), tbxBirthCertificate.Text,
            tbxPhone.Text, tbxMobile.Text, tbxPhnHome.Text, tbxMobHome.Text, tbxEmail.Text, "", bloodgroup, "", UserId);
            if (PersonId > 0)
            {
                StudentId = objStudent.Insert(PersonId, tbxRegNo.Text, DateTime.Now, ddlYear.SelectedItem.Text, SessionManager.SessionName.UserName, DateTime.Now, 0);
                Controller.UpdateRegistrationNo();
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "buttonclick('#class');", true);
            }
            else
            {
                MessageController.Show(MessageCode.SaveFailed, MessageType.Error, Page);
            }
        }
        else
        {
            MessageController.Show("This registration number already exists. Please try another", MessageType.Error, Page);
        }
    }
    protected void btnClassInfo_Click(object sender, EventArgs e)
    {
        if (StudentId > 0)
        {
            int rollNo = 0;
            if (tbxRoll.Text != "")
                rollNo = Convert.ToInt32(tbxRoll.Text);
            else
                rollNo = Controller.GetLastRoll(GetCriteria());
            objStudent.StudentToClass(StudentId, ddlYear.SelectedItem.Text, Convert.ToInt32(ddlClass.SelectedValue), Convert.ToInt32(ddlGroup.SelectedValue), Convert.ToInt32(ddlShift.SelectedValue),
                           Convert.ToInt32(ddlSection.SelectedValue), rollNo);
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "buttonclick('#parent');", true);
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
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "buttonclick('#photo');", true);
        }
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
        Response.Redirect("~/Pages/Student/View.aspx?Id=" + PersonId);

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



    protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
    {
        //tbxRegNo.Text = objStudent.GetStudentRegNo(Convert.ToInt32(ddlClass.SelectedValue), ddlYear.SelectedValue);
    }
}