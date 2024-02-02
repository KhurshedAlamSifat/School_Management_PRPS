using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
[System.Web.Script.Services.ScriptService]
public partial class Pages_User_Profile : BasePage
{
    dalPerson objPerson = new dalPerson();
    dalStudent objStudent = new dalStudent();
    dalTeacher objTeacher = new dalTeacher();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (SessionManager.SessionName.RoleId == 4 || Convert.ToInt32(Request.QueryString["St"]) == 1)
        {
            pnlForTeacher.Visible = false;
        }
        else
        {
            pnlForTeacher.Visible = true;
        }
        if (!IsPostBack)
        {
            ViewState["St"] = (int)0;
            LoadDropdown();
            TableEducation = Education();
            ViewState["TeacherId"] = (int)0;
            ViewState["StudentId"] = (int)0;
            if (SessionManager.SessionName.UserName != null)
            {
                UserName = SessionManager.SessionName.UserName;
                if (string.IsNullOrEmpty(Request.QueryString["Id"]))
                {

                    ID = Controller.PersonIdByUserName(UserName);
                }
                else
                {
                    ID = Convert.ToInt32(Request.QueryString["Id"]);
                    if (!string.IsNullOrEmpty(Request.QueryString["St"]))
                    {
                        ViewState["St"] = Convert.ToInt32(Request.QueryString["St"]);
                        checkRole();
                    }
                }
                hdnPersonId.Value = ID.ToString();
                LoadProfile();
            }
        }
    }
    private void checkRole()
    {
        if (Convert.ToInt32(ViewState["St"]) == 1)
        {
            pnlForTeacher.Visible = false;
        }
        else
        {
            pnlForTeacher.Visible = true;
        }
    }
    #region Variable
    string UserName
    {
        set { ViewState["UserName"] = value; }
        get
        {
            try
            {
                return ViewState["UserName"].ToString();
            }
            catch
            {
                return null;
            }
        }
    }
    int ID
    {
        set { ViewState["ID"] = value; }
        get
        {
            try
            {
                return Convert.ToInt32(ViewState["ID"]);
            }
            catch
            {
                return 0;
            }
        }
    }
    #endregion

    #region Load All Dropdown
    protected void LoadDropdown()
    {
        //ddlDesignation.DataSource = new Common().GetAll("bs_Designation");
        //ddlDesignation.DataBind();

        ddlGender.DataSource = new Common().GetAll("bs_Gender");
        ddlGender.DataBind();

        ddlReligion.DataSource = new Common().GetAll("bs_Religion");
        ddlReligion.DataBind();

        ddlFatherEdu.DataSource = new Common().GetAll("bs_Qualification");
        ddlFatherEdu.DataBind();

        ddlFatherPro.DataSource = new Common().GetAll("bs_Profession");
        ddlFatherPro.DataBind();

        ddlMotherEdu.DataSource = new Common().GetAll("bs_Qualification");
        ddlMotherEdu.DataBind();

        ddlMotherPro.DataSource = new Common().GetAll("bs_Profession");
        ddlMotherPro.DataBind();

        ddlPresentDiv.DataSource = new Common().GetAll("bs_Division");
        ddlPresentDiv.DataBind();

        ddlPermanentDiv.DataSource = new Common().GetAll("bs_Division");
        ddlPermanentDiv.DataBind();

        ddlBlood.DataSource = new Common().GetAll("bs_BloodGroup");
        ddlBlood.DataBind();
        ddlDesignation.DataSource = new Common().GetAll("bs_Designation");
        ddlDesignation.DataBind();
        ddlClass.DataSource = new Common().GetAll("bs_ClassName");
        ddlClass.DataBind();
        Common.LoadDropdown(ddlGroup, "bs_Group", 1, 0);
        Common.LoadDropdown(ddlShift, "bs_Shift", 1, 0);
        Common.LoadDropdown(ddlSection, "bs_Section", 1, 0);
        ddlYear.DataSource = new Common().GetAll("bs_Year");
        ddlYear.DataBind();

    }
    [WebMethod]
    public static ArrayList LoadPresentDistrictByDivision(int divId)
    {
        ArrayList list = new ArrayList();
        DataTable dt = new dalDistrict().GetByDivisionId(divId);
        foreach (DataRow row in dt.Rows)
        {
            list.Add(new ListItem(
                   row["District"].ToString(),
                   row["Id"].ToString()
                    ));
        }

        return list;
    }
    [WebMethod]
    public static ArrayList LoadPresentThanaByDistrict(int disId)
    {

        ArrayList list = new ArrayList();
        DataTable dt = new dalThana().GetByDistrictId(disId);
        foreach (DataRow row in dt.Rows)
        {
            list.Add(new ListItem(
                   row["Thana"].ToString(),
                   row["Id"].ToString()
                    ));
        }

        return list;
    }

    protected void LoadPermanentDistrictByDivision()
    {
        if (ddlPermanentDiv.SelectedValue != "")
        {
            DataTable dt = new dalDistrict().GetByDivisionId(Convert.ToInt32(ddlPermanentDiv.SelectedValue));
            ddlPermanentDis.DataSource = dt;
            ddlPermanentDis.DataBind();
        }
    }

    protected void LoadPermanentThanaByDistrict()
    {
        if (ddlPermanentDis.SelectedValue != "")
        {
            DataTable dt = new dalThana().GetByDistrictId(Convert.ToInt32(ddlPermanentDis.SelectedValue));
            ddlPermanentThana.DataSource = dt;
            ddlPermanentThana.DataBind();
        }
    }
    #endregion

    #region Load Profile
    protected void LoadProfile()
    {
        try
        {
            DataTable dt = objPerson.GetByPersonId(ID);
            if (dt.Rows.Count > 0)
            {
                #region Load Label
                hdnPersonId.Value = dt.Rows[0]["Id"].ToString();
                hdnPersonImage.Value = dt.Rows[0]["PersonImage"].ToString();
                hdnFatherImage.Value = dt.Rows[0]["FatherImage"].ToString();
                hdnMotherImage.Value = dt.Rows[0]["MotherImage"].ToString();
                imgPerson.ImageUrl = "../../Images/Person/" + dt.Rows[0]["PersonImage"].ToString();
                imgFather.ImageUrl = "../../Images/Father/" + dt.Rows[0]["FatherImage"].ToString();
                imgMother.ImageUrl = "../../Images/Mother/" + dt.Rows[0]["MotherImage"].ToString();
                lblNameEng.Text = dt.Rows[0]["NameEng"].ToString();
                lblNameBan.Text = dt.Rows[0]["NameBan"].ToString();
                lblGender.Text = dt.Rows[0]["Gender"].ToString();
                lblBlood.Text = dt.Rows[0]["BloodGroupName"].ToString();
                lblBirthCertificate.Text = dt.Rows[0]["BirthCertificate"].ToString();
                lblReligion.Text = dt.Rows[0]["Religion"].ToString();
                if (dt.Rows[0]["DateofBirth"].ToString() != "")
                    lblDoB.Text = Convert.ToDateTime(dt.Rows[0]["DateofBirth"].ToString()).ToString("dd-MMM-yyyy");
                lblPhn.Text = dt.Rows[0]["PhoneNo"].ToString();
                lblMob.Text = dt.Rows[0]["Mobile"].ToString();
                lblPhnHome.Text = dt.Rows[0]["PhoneHome"].ToString();
                lblMobHome.Text = dt.Rows[0]["MobileHome"].ToString();

                lblPresentDiv.Text = dt.Rows[0]["presentDivName"].ToString();
                lblPresentDis.Text = dt.Rows[0]["presentDisName"].ToString();
                lblPresentThana.Text = dt.Rows[0]["presentThanaName"].ToString();
                lblPresentPO.Text = dt.Rows[0]["presentPO"].ToString();
                lblPresentPC.Text = dt.Rows[0]["presentPC"].ToString();
                lblPresentAddress.Text = dt.Rows[0]["presentAddress"].ToString();

                lblPermanentDiv.Text = dt.Rows[0]["DivName"].ToString();
                lblPermanentDis.Text = dt.Rows[0]["DisName"].ToString();
                lblPermanentThana.Text = dt.Rows[0]["Thana"].ToString();
                lblPermanentPO.Text = dt.Rows[0]["PostOffice"].ToString();
                lblPermanentPC.Text = dt.Rows[0]["PostalCode"].ToString();
                lblPermanentAddress.Text = dt.Rows[0]["Address"].ToString();

                lblFatherName.Text = dt.Rows[0]["FatherNameEng"].ToString();
                lblFatherEdu.Text = dt.Rows[0]["FatherEdu"].ToString();
                lblFatherPro.Text = dt.Rows[0]["FatherProfession"].ToString();
                lblFatherNId.Text = dt.Rows[0]["FatherNId"].ToString();
                lblFatherIncome.Text = dt.Rows[0]["FatherIncome"].ToString();
                lblFatherPhn.Text = dt.Rows[0]["FatherPhone"].ToString();

                lblMotherEdu.Text = dt.Rows[0]["MotherEdu"].ToString();
                lblMotherPro.Text = dt.Rows[0]["MotherProfession"].ToString();
                lblMotherName.Text = dt.Rows[0]["MotherNameEng"].ToString();
                lblMotherNId.Text = dt.Rows[0]["MotherNId"].ToString();
                lblMotherIncome.Text = dt.Rows[0]["MotherIncome"].ToString();
                lblMotherPhn.Text = dt.Rows[0]["MotherPhone"].ToString();
                #endregion

                #region Load Textbox
                tbxNameEng.Text = dt.Rows[0]["NameEng"].ToString();
                tbxNameBan.Text = dt.Rows[0]["NameBan"].ToString();
                ddlGender.SelectedValue = dt.Rows[0]["GenderId"].ToString();
                ddlReligion.SelectedValue = dt.Rows[0]["ReligionId"].ToString();
                if (dt.Rows[0]["DateofBirth"].ToString() != "")
                    tbxDateOfBirth.Text = Convert.ToDateTime(dt.Rows[0]["DateofBirth"].ToString()).ToString("dd/MM/yyyy");
                tbxBirthCertificate.Text = dt.Rows[0]["BirthCertificate"].ToString();
                tbxPhone.Text = dt.Rows[0]["PhoneNo"].ToString();
                tbxMobile.Text = dt.Rows[0]["Mobile"].ToString();
                tbxPhnHome.Text = dt.Rows[0]["PhoneHome"].ToString();
                tbxMobHome.Text = dt.Rows[0]["MobileHome"].ToString();
                ddlBlood.SelectedValue = dt.Rows[0]["BloodGroup"].ToString();

                ddlPermanentDiv.SelectedValue = dt.Rows[0]["DivisionId"].ToString();
                DataTable dtP = new dalDistrict().GetByDivisionId(Convert.ToInt32(ddlPermanentDiv.SelectedValue));
                ddlPermanentDis.DataSource = dtP;
                ddlPermanentDis.DataBind();
                ddlPermanentDis.SelectedValue = dt.Rows[0]["DistrictId"].ToString();
                DataTable dttP = new dalThana().GetByDistrictId(Convert.ToInt32(ddlPermanentDis.SelectedValue));
                ddlPermanentThana.DataSource = dttP;
                ddlPermanentThana.DataBind();
                ddlPermanentThana.SelectedValue = dt.Rows[0]["ThanaId"].ToString();
                tbxPermanentPost.Text = dt.Rows[0]["PostOffice"].ToString();
                tbxPermanentPostCode.Text = dt.Rows[0]["PostalCode"].ToString();
                tbxPermanentAddress.Text = dt.Rows[0]["Address"].ToString();

                ddlPresentDiv.SelectedValue = dt.Rows[0]["presentDiv"].ToString();

                DataTable dtf = new dalDistrict().GetByDivisionId(Convert.ToInt32(ddlPresentDiv.SelectedValue));
                ddlPresentDis.DataSource = dtf;
                ddlPresentDis.DataBind();
                ddlPresentDis.SelectedValue = dt.Rows[0]["presentDis"].ToString();
                DataTable dtthana = new dalThana().GetByDistrictId(Convert.ToInt32(ddlPresentDis.SelectedValue));
                ddlPresentThana.DataSource = dtthana;
                ddlPresentThana.DataBind();
                ddlPresentThana.SelectedValue = dt.Rows[0]["presentThana"].ToString();
                tbxPostOffice.Text = dt.Rows[0]["presentPO"].ToString();
                tbxPostalCode.Text = dt.Rows[0]["presentPC"].ToString();
                tbxPresentAddress.Text = dt.Rows[0]["presentAddress"].ToString();

                tbxFathername.Text = dt.Rows[0]["FatherNameEng"].ToString();
                ddlFatherEdu.SelectedValue = dt.Rows[0]["FatherEduId"].ToString();
                ddlFatherPro.SelectedValue = dt.Rows[0]["FatherProId"].ToString();
                tbxFatherNID.Text = dt.Rows[0]["FatherNId"].ToString();
                tbxFatherIncome.Text = dt.Rows[0]["FatherIncome"].ToString();
                tbxFatherPhn.Text = dt.Rows[0]["FatherPhone"].ToString();

                ddlMotherEdu.SelectedValue = dt.Rows[0]["MotherEduId"].ToString();
                ddlMotherPro.SelectedValue = dt.Rows[0]["MotherProfessionId"].ToString();
                tbxMotherName.Text = dt.Rows[0]["MotherNameEng"].ToString();
                tbxMotherNID.Text = dt.Rows[0]["MotherNId"].ToString();
                tbxMotherIncome.Text = dt.Rows[0]["MotherIncome"].ToString();
                tbxMotherPhn.Text = dt.Rows[0]["MotherPhone"].ToString();
                #endregion
            }
            lblDesig.Visible = false;
            lblDesignation.Visible = false;
            lblNd.Visible = false;
            lblNID.Visible = false;
            lblJoindate.Visible = false;
            lblJoiningDate.Visible = false;
            pnlTeacherNID.Visible = false;
            pnlForStudent.Visible = false;
            if (SessionManager.SessionName.RoleId == 4 || Convert.ToInt32(Request.QueryString["St"]) == 1)
            {
                lblReg.Text = "Registration No";
                lblRegnoPop.Text = "Registration No";
                DataTable dtst = objStudent.GetByPersonId(ID);
                if (dtst.Rows.Count > 0)
                {
                    pnlForStudent.Visible = true;
                    lblClass.Text = dt.Rows[0]["ClassName"].ToString();
                    lblGroup.Text = dt.Rows[0]["GroupName"].ToString();
                    lblShift.Text = dt.Rows[0]["Shift"].ToString();
                    lblSection.Text = dt.Rows[0]["Section"].ToString();
                    lblYear.Text = dt.Rows[0]["Year"].ToString();
                    lblRoll.Text = dt.Rows[0]["RollNo"].ToString();
                    lblRegNo.Text = dtst.Rows[0]["RegNo"].ToString();
                    tbxRegNo.Text = dtst.Rows[0]["RegNo"].ToString();
                    ddlClass.SelectedValue = dt.Rows[0]["ClassId"].ToString();
                    ddlSection.SelectedValue = dt.Rows[0]["SectionId"].ToString();
                    ddlGroup.SelectedValue = dt.Rows[0]["GroupId"].ToString();
                    ddlShift.SelectedValue = dt.Rows[0]["ShiftId"].ToString();
                    ddlYear.SelectedValue = dt.Rows[0]["Year"].ToString();
                    tbxRoll.Text = dt.Rows[0]["RollNo"].ToString();
                    ViewState["StudentId"] = Convert.ToInt32(dt.Rows[0]["StudentId"]);
                    tbxRegNo.Enabled = false;
                }
            }
            else
            {
                lblReg.Text = "Staff ID";
                lblRegnoPop.Text = "Staff ID";
                DataTable dtTeacher = objTeacher.GetByPersonId(ID);
                if (dtTeacher.Rows.Count > 0)
                {
                    lblJoindate.Visible = true;
                    lblJoiningDate.Visible = true;
                    lblNd.Visible = true;
                    lblNID.Visible = true;
                    lblDesig.Visible = true;
                    lblDesignation.Visible = true;
                    pnlTeacherNID.Visible = true;
                    tbxJoiningDate.Text = Convert.ToDateTime(dtTeacher.Rows[0]["Joindate"]).ToString("yyyy/MM/dd");
                    tbxNID.Text = dtTeacher.Rows[0]["NId"].ToString();
                    ddlDesignation.SelectedValue = dtTeacher.Rows[0]["DesignationId"].ToString(); ;
                    lblJoindate.Text = Convert.ToDateTime(dtTeacher.Rows[0]["Joindate"]).ToString("dd/MM/yyyy");
                    lblNID.Text = dtTeacher.Rows[0]["NId"].ToString();
                    lblDesignation.Text = dtTeacher.Rows[0]["Designation"].ToString();
                    lblRegNo.Text = dtTeacher.Rows[0]["TeacherPin"].ToString();
                    tbxRegNo.Text = dtTeacher.Rows[0]["TeacherPin"].ToString();
                    tbxRegNo.Enabled = false;
                    ViewState["TeacherId"] = Convert.ToInt32(dtTeacher.Rows[0]["Id"]);
                    gvEducation.DataSource = objTeacher.EducationByTeacherId(Convert.ToInt32(dtTeacher.Rows[0]["Id"]));
                    gvEducation.DataBind();
                }
            }
        }
        catch { }

    }
    #endregion

    #region Image Change
    protected bool ValidImage(FileUpload file)
    {
        bool flag = false;
        string exe = Path.GetExtension(file.FileName).ToLower();
        if (exe == "jpeg" || exe == ".jpg" || exe == ".png")
        {
            if (file.PostedFile.ContentLength < 6218595)
            {
                flag = true;
            }
        }
        return flag;
    }


    protected void btnPersoImage_Click(object sender, EventArgs e)
    {
        string imgPer = "";
        if (hdnPersonId.Value != "")
        {
            Controller.DeleteFile(Server.MapPath("~/Image/Person/") + hdnPersonImage.Value);
            if (uploderStudent.HasFile)
            {
                if (ValidImage(uploderStudent) == true)
                {
                    imgPer = Guid.NewGuid() + "-" + uploderStudent.FileName;
                    System.Drawing.Image image = System.Drawing.Image.FromStream(uploderStudent.FileContent);
                    System.Drawing.Image image2 = Controller.resizeImage(image, new Size(140, 140));
                    EncoderParameters encoderParameters = new EncoderParameters(1);
                    encoderParameters.Param[0] = new EncoderParameter(Encoder.Compression, 100);
                    string MediumImagePath = Server.MapPath("~/VariableContent/Person/" + imgPer);
                    image2.Save(string.Concat(MediumImagePath), ImageCodecInfo.GetImageEncoders()[1], encoderParameters);
                }
            }
            objPerson.PersonImageUpdate(Convert.ToInt32(hdnPersonId.Value), imgPer);
            imgPerson.ImageUrl = "../../Images/Person/" + imgPer;
        }
    }
    protected void btnFatherImage_Click(object sender, EventArgs e)
    {
        string fatherPhoto = "";
        if (hdnPersonId.Value != "")
        {
            Controller.DeleteFile(Server.MapPath("~/Image/Father/") + hdnFatherImage.Value);
            if (upFather.HasFile)
            {
                if (ValidImage(upFather) == true)
                {
                    fatherPhoto = Guid.NewGuid() + "-" + upFather.FileName;
                    System.Drawing.Image image = System.Drawing.Image.FromStream(upFather.FileContent);
                    System.Drawing.Image image2 = Controller.resizeImage(image, new Size(140, 140));
                    EncoderParameters encoderParameters = new EncoderParameters(1);
                    encoderParameters.Param[0] = new EncoderParameter(Encoder.Compression, 100);
                    string MediumImagePath = Server.MapPath("~/VariableContent/Father/" + fatherPhoto);
                    image2.Save(string.Concat(MediumImagePath), ImageCodecInfo.GetImageEncoders()[1], encoderParameters);
                }
            }
            objPerson.FatherImageUpdate(Convert.ToInt32(hdnPersonId.Value), fatherPhoto);
            imgFather.ImageUrl = "../../Images/Father/" + fatherPhoto;
        }
    }
    protected void btnMother_Click(object sender, EventArgs e)
    {
        string motherPhoto = "";
        if (hdnPersonId.Value != "")
        {
            Controller.DeleteFile(Server.MapPath("~/Image/Mother/") + hdnMotherImage.Value);
            if (upMother.HasFile)
            {
                if (ValidImage(upMother) == true)
                {
                    motherPhoto = Guid.NewGuid() + "-" + upMother.FileName;
                    System.Drawing.Image image = System.Drawing.Image.FromStream(upMother.FileContent);
                    System.Drawing.Image image2 = Controller.resizeImage(image, new Size(140, 140));
                    EncoderParameters encoderParameters = new EncoderParameters(1);
                    encoderParameters.Param[0] = new EncoderParameter(Encoder.Compression, 100);
                    string MediumImagePath = Server.MapPath("~/VariableContent/Mother/" + motherPhoto);
                    image2.Save(string.Concat(MediumImagePath), ImageCodecInfo.GetImageEncoders()[1], encoderParameters);
                }
            }
            objPerson.MotherImageUpdate(Convert.ToInt32(hdnPersonId.Value), motherPhoto);
            imgMother.ImageUrl = "../../Images/Mother/" + motherPhoto;
        }
    }
    #endregion
    protected void btnPersonal_Click(object sender, EventArgs e)
    {
        //string email = "";
        string fax = "";
        string NId = "";
        if (SessionManager.SessionName.RoleId == 4 || Convert.ToInt32(ViewState["St"]) == 1)
        {
            //email = "email.com";
            fax = "";
            NId = "";
        }
        else if (SessionManager.SessionName.RoleId == 3 || Convert.ToInt32(ViewState["St"]) != 1)
        {
            objPerson.UpdateTeacherInfo(ID, Convert.ToInt32(ddlDesignation.SelectedValue), tbxNID.Text, Convert.ToDateTime(tbxJoiningDate.Text));
        }
        objPerson.Update(ID, tbxNameEng.Text, tbxNameBan.Text, Convert.ToInt32(ddlGender.SelectedValue), Convert.ToInt32(ddlReligion.SelectedValue), NId, DateTime.ParseExact(tbxDateOfBirth.Text, "dd/MM/yyyy", null), tbxBirthCertificate.Text,
            tbxPhone.Text, tbxMobile.Text, tbxPhnHome.Text, tbxMobHome.Text, tbxEmail.Text, fax, Convert.ToInt32(ddlBlood.SelectedValue));
        LoadDropdown();
        LoadProfile();
    }
    protected void btnFatherInfo_Click(object sender, EventArgs e)
    {
        int income = 0;
        if (tbxFatherIncome.Text != "")
            income = Convert.ToInt32(tbxFatherIncome.Text);
        objPerson.UpdateFatherInfo(ID, tbxFathername.Text, "", tbxFatherNID.Text, income, tbxFatherPhn.Text, Convert.ToInt32(ddlFatherEdu.SelectedValue), Convert.ToInt32(ddlFatherPro.SelectedValue));
        LoadDropdown();
        LoadProfile();
    }
    protected void btnMotherInfo_Click(object sender, EventArgs e)
    {
        int income = 0;
        if (tbxMotherIncome.Text != "")
            income = Convert.ToInt32(tbxMotherIncome.Text);
        objPerson.UpdateMotherInfo(ID, tbxMotherName.Text, "", tbxMotherNID.Text, income, tbxMotherPhn.Text, Convert.ToInt32(ddlMotherEdu.SelectedValue),
            Convert.ToInt32(ddlMotherPro.SelectedValue));
        LoadDropdown();
        LoadProfile();
    }
    protected void btnPresentAddress_Click(object sender, EventArgs e)
    {
        string selectedDis = Request.Form[ddlPresentDis.UniqueID];
        string selectedThana = Request.Form[ddlPresentThana.UniqueID];
        objPerson.PresentAddressUpdate(ID, Convert.ToInt32(ddlPresentDiv.SelectedValue), Convert.ToInt32(selectedDis), Convert.ToInt32(selectedThana),
            tbxPostOffice.Text, tbxPostalCode.Text, tbxPresentAddress.Text);
        LoadDropdown();
        LoadProfile();
    }
    protected void btnPermanentAddress_Click(object sender, EventArgs e)
    {
        string selectedDis = Request.Form[ddlPermanentDis.UniqueID];
        string selectedThana = Request.Form[ddlPermanentThana.UniqueID];
        objPerson.PermanentAddressUpdate(ID, Convert.ToInt32(ddlPermanentDiv.SelectedValue), Convert.ToInt32(selectedDis), Convert.ToInt32(selectedThana),
            tbxPermanentPost.Text, tbxPermanentPostCode.Text, tbxPermanentAddress.Text);
        LoadDropdown();
        LoadProfile();
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
    protected void btnEducation_Click(object sender, EventArgs e)
    {
        TableEducation.Rows.Add(ddlDegree.SelectedItem.Text, tbxBoard.Text, tbxGrade.Text, tbxYear.Text, tbxSubject.Text, tbxScale.Text, ddlResult.SelectedItem.Text);
        objTeacher.EducationInsert(Convert.ToInt32(ViewState["TeacherId"]), TableEducation);
        LoadProfile();
        ClearEducation();
    }
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
    protected void btnDelete_Command(object sender, CommandEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(e.CommandArgument);
            new Common().Delete("tr_Education", ID);
            LoadProfile();
            MessageController.Show(MessageCode.DeleteSucceeded, MessageType.Information, Page);
        }
        catch (Exception ex)
        {
            MessageController.Show(MessageCode.DeleteFailed, MessageType.Error, Page);
        }
    }
    protected void btnClassInformation_Click(object sender, EventArgs e)
    {
        
            try
        {
            int ID = Convert.ToInt32(ViewState["StudentId"]);
            objStudent.StudentToClassUpdate(ID,ddlYear.SelectedValue,Convert.ToInt32(ddlClass.SelectedValue),Convert.ToInt32(ddlGroup.SelectedValue),Convert.ToInt32(ddlShift.SelectedValue),Convert.ToInt32(ddlSection.SelectedValue),Convert.ToInt32(tbxRoll.Text));
            LoadProfile();
            MessageController.Show(MessageCode.DeleteSucceeded, MessageType.Information, Page);
        }
        catch (Exception ex)
        {
            MessageController.Show(MessageCode.DeleteFailed, MessageType.Error, Page);
        }
    }
}