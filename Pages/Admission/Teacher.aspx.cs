﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Admission_Teacher : System.Web.UI.Page
{
    public static int count = 0;
    dalPerson objPerson = new dalPerson();
    dalTeacher objTeacher = new dalTeacher();
    public static int PersonId;
    public static int TeacherId;
    int fIncome;
    int mIncome;
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
            this.BindGrid();
            this.LoadTraining();
            dtEdu = new DataTable("dtEducation");
            dtTrin = new DataTable("dtTraining");
            LoadDropdown();
            LoadDefault();
            //LoadPresentDistrictByDivision();
            //LoadPresentThanaByDistrict();
            //LoadPermanentDistrictByDivision();
            //LoadPermanentThanaByDistrict();
            //Education();
            //Training();
        }
    }

    DataTable dtEdu
    {
        set { ViewState["dtEdu"] = value; }
        get
        {
            try
            {
                return (DataTable)ViewState["dtEdu"];
            }
            catch
            {
                return null;
            }
        }
    }

    DataTable dtTrin
    {
        set { ViewState["dtTrin"] = value; }
        get
        {
            try
            {
                return (DataTable)ViewState["dtTrin"];
            }
            catch
            {
                return null;
            }
        }
    }
    /***************************************************************************/
    private void BindGrid()
    {
        DataTable dt = objTeacher.EducationByTeacherId(0);
        if (dt.Rows.Count == 0)
        {
            //If no records then add a dummy row.
            dt.Rows.Add();
        }

        gvEducation.DataSource = dt;
        gvEducation.DataBind();
    }
    private void LoadTraining()
    {
        DataTable dt = objTeacher.TrainingByTeacherId(0);
        if (dt.Rows.Count == 0)
        {
            dt.Rows.Add();
        }
        gvTraining.DataSource = dt;
        gvTraining.DataBind();
    }
    /***************************************************************************/
    protected void LoadDefault()
    {
        imgTeacher.ImageUrl = "~/Images/Common/Teacher.png";
        imgFather.ImageUrl = "~/Images/Common/father.png";
        imgMother.ImageUrl = "~/Images/Common/mother.png";
    }



    #region Load All Dropdown
    protected void LoadDropdown()
    {
        ddlDesignation.DataSource = new Common().GetAll("bs_Designation");
        ddlDesignation.DataBind();

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

        ddlRole.DataSource = new dalRole().GetAllRole();
        ddlRole.DataBind();

        ddlBlood.DataSource = new Common().GetAll("bs_BloodGroup");
        ddlBlood.DataBind();

        ddlPayScaleGrade.DataSource = new Common().GetAll("pr_Type");
        ddlPayScaleGrade.DataBind();

        LoadPayScale();
    }

    protected void LoadPayScale()
    {
        DataTable dt = new dalPayrollBasic().TypeGetById(Convert.ToInt32(ddlPayScaleGrade.SelectedValue));
        if (dt.Rows.Count > 0)
        {
            lblPayScale.Text = dt.Rows[0]["Scale"].ToString();
            lblBasicSalary.Text = dt.Rows[0]["Basic"].ToString();
        }
    }

    [WebMethod]
    public static ArrayList LoadDistrictByDivision(int divId)
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
    public static ArrayList LoadThanaByDistrict(int disId)
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
    protected void LoadPresentDistrictByDivision()
    {
        if (ddlPresentDiv.SelectedValue != "")
        {
            DataTable dt = new dalDistrict().GetByDivisionId(Convert.ToInt32(ddlPresentDiv.SelectedValue));
            if (dt.Rows.Count > 0)
            {
                ddlPresentDis.DataSource = dt;
                ddlPresentDis.DataBind();
            }
            else
            {
                MessageController.Show("There is no district in this division. Please insert District first.", MessageType.Error, Page);
                ddlPresentDis.DataSource = null;
                ddlPresentDis.DataBind();
                ddlPresentDis.BorderColor = System.Drawing.Color.Red;
            }

        }
    }

    protected void LoadPresentThanaByDistrict()
    {
        if (ddlPresentDis.SelectedValue != "")
        {
            DataTable dt = new dalThana().GetByDistrictId(Convert.ToInt32(ddlPresentDis.SelectedValue));
            if (dt.Rows.Count > 0)
            {
                ddlPresentThana.DataSource = dt;
                ddlPresentThana.DataBind();
            }
            else
            {
                MessageController.Show("There is no Thana in this district. Please insert Thana first.", MessageType.Error, Page);
                ddlPresentThana.DataSource = null;
                ddlPresentThana.DataBind();
                //MainView.ActiveViewIndex = 1;
            }
        }
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
    private void SendMail()
    {
        #region Email

        DataTable dtEmailTemplate = new dalEmailTemplete().GetById(1);
        if (dtEmailTemplate.Rows.Count > 0)
        {
            string Subject = dtEmailTemplate.Rows[0]["Subject"].ToString();
            string EmailTemplate = dtEmailTemplate.Rows[0]["Body"].ToString();
            EmailTemplate = EmailTemplate.Replace("@Name", tbxNameEng.Text);
            EmailTemplate = EmailTemplate.Replace("@UserName", tbxUserName.Text);
            EmailTemplate = EmailTemplate.Replace("@Password", tbxPassword.Text);
            Notify objNotify = new Notify(tbxEmail.Text, Subject, EmailTemplate);
            Thread threadNotify = new Thread(new ThreadStart(objNotify.runme));
            threadNotify.Name = "RegistrationNotification";
            threadNotify.Start();
        }

        #endregion
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string imgStudent = "";
        string imgFather = "";
        string imgMother = "";

        #region Check Null
        if (tbxFatherIncome.Text == "")
        {
            fIncome = 0;
        }
        if (tbxMotherIncome.Text == "")
        {
            mIncome = 0;
        }
        #endregion

        #region ImageUpload
        if (uploderTeacher.HasFile)
        {
            if (ValidImage(uploderTeacher) == true)
            {
                imgStudent = Guid.NewGuid() + "-" + uploderTeacher.FileName;
                System.Drawing.Image image = System.Drawing.Image.FromStream(uploderTeacher.FileContent);
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
        #endregion
        MembershipCreateStatus msc;
        PersonId = objPerson.Insert(tbxNameEng.Text, tbxNameBan.Text, tbxFathername.Text, "", tbxMotherName.Text, "", Convert.ToInt32(ddlGender.SelectedValue), Convert.ToInt32(ddlReligion.SelectedValue), "", Convert.ToDateTime(tbxDateOfBirth.Text), tbxBirthCertificate.Text,
            tbxPhone.Text, tbxMobile.Text, tbxPhnHome.Text, tbxMobHome.Text, "", "", Convert.ToInt32(ddlBlood.SelectedValue), tbxFatherNID.Text, tbxMotherNID.Text, Convert.ToBoolean(chkFreedom.Checked), Convert.ToBoolean(chkTribal.Checked), Convert.ToBoolean(chkPhyDef.Checked),
            fIncome, mIncome, tbxFatherPhn.Text, tbxMotherPhn.Text, imgFather, imgMother, Convert.ToInt32(ddlFatherEdu.SelectedValue), Convert.ToInt32(ddlFatherPro.SelectedValue), Convert.ToInt32(ddlMotherEdu.SelectedValue),
            Convert.ToInt32(ddlMotherPro.SelectedValue), imgStudent, tbxUserName.Text);
        if (PersonId != -1)
        {
            try
            {
                objPerson.PresentAddressInsert(PersonId, Convert.ToInt32(Request.Form[ddlPresentDiv.UniqueID]), Convert.ToInt32(Request.Form[ddlPresentDis.UniqueID]), Convert.ToInt32(Request.Form[ddlPresentThana.UniqueID]), tbxPostOffice.Text, tbxPostalCode.Text, tbxPresentAddress.Text);
                objPerson.PermanentAddressInsert(PersonId, Convert.ToInt32(Request.Form[ddlPermanentDiv.UniqueID]), Convert.ToInt32(Request.Form[ddlPermanentDis.UniqueID]), Convert.ToInt32(Request.Form[ddlPermanentThana.UniqueID]), tbxPermanentPost.Text, tbxPermanentPostCode.Text, tbxPermanentAddress.Text);
                //objTeacher.InsertPayScale(Convert.ToInt32(ddlPayScaleGrade.SelectedValue), tbxRegNo.Text);
                objTeacher.InsertPayScale(Convert.ToInt32(ddlPayScaleGrade.SelectedValue), PersonId);
                //TeacherId = objTeacher.Insert(PersonId, Convert.ToInt32(ddlDesignation.SelectedValue), tbxRegNo.Text, tbxNID.Text, Convert.ToDateTime(tbxJoinDate.Text), Page.User.Identity.Name, DateTime.Now, dtEdu, dtTrin);
                TeacherId = objTeacher.Insert(PersonId, Convert.ToInt32(ddlDesignation.SelectedValue), tbxRegNo.Text, tbxNID.Text, Convert.ToDateTime(tbxJoinDate.Text), Page.User.Identity.Name, DateTime.Now);
                if (TeacherId != -1)
                {
                    Membership.CreateUser(tbxUserName.Text, tbxPassword.Text, tbxEmail.Text);
                    Roles.AddUserToRole(tbxUserName.Text, ddlRole.SelectedItem.Text);
                    MessageController.Show(MessageCode.SaveSucceeded, MessageType.Information, Page);
                }
            }
            catch
            {
                new Common().Delete("st_Person", PersonId);
                Controller.DeleteFile(Server.MapPath("~/VariableContent/Teacher/" + imgStudent));
                Controller.DeleteFile(Server.MapPath("~/VariableContent/Father/" + imgStudent));
                Controller.DeleteFile(Server.MapPath("~/VariableContent/Mother/" + imgStudent));
                MessageController.Show(MessageCode.SaveFailed, MessageType.Error, Page);
            }
        }
    }
    protected bool ValidImage(FileUpload file)
    {
        bool flag = false;
        string exe = Path.GetExtension(file.FileName);
        if (exe == "jpeg" || exe == ".jpg" || exe == ".png")
        {
            if (file.PostedFile.ContentLength < 6218595)
            {
                flag = true;
            }
        }
        return flag;
    }

    #region Dropdown selected index change
    protected void ddlPermanentDiv_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadPermanentDistrictByDivision();

    }
    protected void ddlPermanentDis_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadPermanentThanaByDistrict();

    }
    protected void ddlPresentDis_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadPresentThanaByDistrict();

    }
    protected void ddlPresentDiv_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadPresentDistrictByDivision();

    }
    #endregion
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    public DataTable Education()
    {
        dtEdu.Columns.Add("Degree", typeof(string));
        dtEdu.Columns.Add("Sub", typeof(string));
        dtEdu.Columns.Add("Brd", typeof(string));
        dtEdu.Columns.Add("Year", typeof(string));
        dtEdu.Columns.Add("Grade", typeof(string));
        dtEdu.Columns.Add("scale", typeof(string));
        dtEdu.Columns.Add("DivId", typeof(string));
        return dtEdu;
    }
    public DataTable Training()
    {
        dtTrin.Columns.Add("Name", typeof(string));
        dtTrin.Columns.Add("Ins", typeof(string));
        dtTrin.Columns.Add("StD", typeof(DateTime));
        dtTrin.Columns.Add("EndD", typeof(DateTime));
        dtTrin.Columns.Add("Topic", typeof(string));
        dtTrin.Columns.Add("Du", typeof(int));
        return dtTrin;
    }
    protected void btnEducation_Click(object sender, EventArgs e)
    {
        dtEdu.Rows.Add(ddlDegree.SelectedItem.Text, tbxSubject.Text, tbxBoard.Text, tbxYear.Text, tbxGrade.Text, tbxScale.Text, ddlResult.SelectedItem.Text);
        LoadTemporaryData();
        ClearEducation();
    }

    protected void ClearEducation()
    {
        ddlDegree.SelectedValue = "1";
        tbxSubject.Text = "";
        tbxBoard.Text = "";
        tbxYear.Text = "";
        ddlResult.SelectedValue = "1";
        tbxGrade.Text = "";
        tbxScale.Text = "";
    }
    public void ClearTraining()
    {
        tbxTrainingName.Text = "";
        tbxInstitute.Text = "";
        tbxStartDate.Text = "";
        tbxEndDate.Text = "";
        tbxTopics.Text = "";
    }
    protected void btnTraining_Click(object sender, EventArgs e)
    {
        DateTime d1 = tbxStartDate.Text != string.Empty ? Convert.ToDateTime(tbxStartDate.Text) : DateTime.MinValue;
        DateTime d2 = tbxEndDate.Text != string.Empty ? Convert.ToDateTime(tbxEndDate.Text) : DateTime.MinValue;
        TimeSpan tspan = d2 - d1;
        int duration = Convert.ToInt32(tspan.TotalDays.ToString());
        dtTrin.Rows.Add(tbxTrainingName.Text, tbxInstitute.Text, d1, d2, tbxTopics.Text, duration);
        LoadTemporaryData();
        ClearTraining();
    }

    protected void LoadTemporaryData()
    {
        //rptEdu.DataSource = dtEdu;
        //rptEdu.DataBind();

        //rptTraining.DataSource = dtTrin;
        //rptTraining.DataBind();
    }
    protected void btnedu_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request.Form["degree"]))
        {
            DataTable dttttt = Education();
            string[] degree = Request.Form["degree"].Split(',');
            string[] board = Request.Form["board"].Split(',');
            string[] subject = Request.Form["subject"].Split(',');
            string[] year = Request.Form["year"].Split(',');
            string[] result = Request.Form["division"].Split(',');
            string[] grade = Request.Form["grade"].Split(',');
            string[] scale = Request.Form["scale"].Split(',');
            for (int i = 0; i < degree.Length; i++)
            {
                dttttt.Rows.Add(degree[i], subject[i], board[i], year[i], grade[i], scale[i], result[i]);
            }
        }
    }

    protected void GetEducation()
    {
        if (!string.IsNullOrEmpty(Request.Form["degree"]))
        {
            dtEdu = Education();
            string[] degree = Request.Form["degree"].Split(',');
            string[] board = Request.Form["board"].Split(',');
            string[] subject = Request.Form["subject"].Split(',');
            string[] year = Request.Form["year"].Split(',');
            string[] result = Request.Form["division"].Split(',');
            string[] grade = Request.Form["grade"].Split(',');
            string[] scale = Request.Form["scale"].Split(',');
            for (int i = 0; i < degree.Length; i++)
            {
                dtEdu.Rows.Add(degree[i], subject[i], board[i], year[i], grade[i], scale[i], result[i]);
            }
        }
    }

    protected void GetTraining()
    {
        if (!string.IsNullOrEmpty(Request.Form["trainingName"]))
        {
            dtTrin = Training();
            string[] training = Request.Form["trainingName"].Split(',');
            string[] institute = Request.Form["institute"].Split(',');
            string[] startDate = Request.Form["startDate"].Split(',');
            string[] endDate = Request.Form["endDate"].Split(',');
            string[] topics = Request.Form["topics"].Split(',');
            for (int i = 0; i < training.Length; i++)
            {
                dtTrin.Rows.Add(training[i], institute[i], startDate[i], endDate[i], topics[i], 0);
            }
        }
    }
    protected void ddlPayScaleGrade_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadPayScale();
    }
}