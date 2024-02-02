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

public partial class Pages_Admission_Student : BasePage
{
    public static int count = 0;
    dalPerson objPerson = new dalPerson();
    dalStudent objStudent = new dalStudent();
    public static int PersonId;
    public static int StudentId;
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
        tbxRegNo.Text = Controller.RegistrationNo().ToString();
        if (!IsPostBack)
        {
            string ss = Common.SessionInfo.Panel;
            LoadDropdown();
            LoadAssignment();

            LoadDefault();
            //LoadPresentDistrictByDivision();
            //LoadPresentThanaByDistrict();
            //LoadPermanentDistrictByDivision();
            //LoadPermanentThanaByDistrict();
            Session["Password"] = null;
        }


    }

    protected void LoadDefault()
    {
        imgStudent.ImageUrl = "~/Images/Common/student.png";
        imgFather.ImageUrl = "~/Images/Common/father.png";
        imgMother.ImageUrl = "~/Images/Common/mother.png";
    }

    #region Load All Dropdown
    protected void LoadDropdown()
    {
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

    #region Student Assign
    protected void LoadAssignment()
    {
        ddlYear.DataSource = new dalYear().GetDefault();
        ddlYear.DataBind();

        ddlClass.DataSource = new Common().GetAll("bs_ClassName");
        ddlClass.DataBind();

        ddlGroup.DataSource = new Common().GetAll("bs_Group");
        ddlGroup.DataBind();

        ddlShift.DataSource = new Common().GetAll("bs_Shift");
        ddlShift.DataBind();

        ddlSection.DataSource = new Common().GetAll("bs_Section");
        ddlSection.DataBind();

    }
    #endregion
    protected bool ValidImage(FileUpload file)
    {
        bool flag = false;
        string extension = Path.GetExtension(file.FileName).ToLower();
        if (extension == "jpeg" || extension == ".jpg" || extension == ".png")
        {
            if (file.PostedFile.ContentLength < 6218595)
            {
                flag = true;
            }
        }
        return flag;
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string imgStudent = "";
        string imgFather = "";
        string imgMother = "";
        string password = Request.Form[tbxPassword.UniqueID];

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
        if (uploderStudent.HasFile)
        {
            if (ValidImage(uploderStudent) == true)
            {
                imgStudent = Guid.NewGuid() + "-" + uploderStudent.FileName;
                System.Drawing.Image image = System.Drawing.Image.FromStream(uploderStudent.FileContent);
                System.Drawing.Image image2 = Controller.resizeImage(image, new Size(140, 140));
                EncoderParameters encoderParameters = new EncoderParameters(1);
                encoderParameters.Param[0] = new EncoderParameter(Encoder.Compression, 100);
                string MediumImagePath = Server.MapPath("~/VariableContent/Student/" + imgStudent);
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
            objPerson.PresentAddressInsert(PersonId, Convert.ToInt32(Request.Form[ddlPresentDiv.UniqueID]), Convert.ToInt32(Request.Form[ddlPresentDis.UniqueID]), Convert.ToInt32(Request.Form[ddlPresentThana.UniqueID]), tbxPostOffice.Text, tbxPostalCode.Text, tbxPresentAddress.Text);
            objPerson.PermanentAddressInsert(PersonId, Convert.ToInt32(Request.Form[ddlPermanentDiv.UniqueID]), Convert.ToInt32(Request.Form[ddlPermanentDis.UniqueID]), Convert.ToInt32(Request.Form[ddlPermanentThana.UniqueID]), tbxPermanentPost.Text, tbxPermanentPostCode.Text, tbxPermanentAddress.Text);
            StudentId = objStudent.Insert(PersonId, tbxRegNo.Text, DateTime.Now, DateTime.Now.Year.ToString(), Page.User.Identity.Name, DateTime.Now,0);
            if (StudentId != -1)
            {
                Membership.CreateUser(tbxUserName.Text, password);
                Roles.AddUserToRole(tbxUserName.Text, Controller.RoleNameById(1));
                Controller.UpdateRegistrationNo();
                if (chkAssign.Checked)
                {
                    objStudent.StudentToClass(StudentId, ddlYear.SelectedItem.Text, Convert.ToInt32(ddlClass.SelectedValue), Convert.ToInt32(ddlGroup.SelectedValue), Convert.ToInt32(ddlShift.SelectedValue),
                        Convert.ToInt32(ddlSection.SelectedValue), Convert.ToInt32(tbxRoll.Text));
                }
                MessageController.Show(MessageCode.SaveSucceeded, MessageType.Information, Page);
            }
            else
            {
                MessageController.Show("This Registration no. already exists. Please try another.", MessageType.Error, Page);
                return;
            }
        }
        else
        {
            MessageController.Show("This user name already exists. Please try another.", MessageType.Error, Page);
        }

    }

    #region Dropdown selected index change
    protected void ddlPermanentDiv_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadPermanentDistrictByDivision();
        //MainView.ActiveViewIndex = 1;
    }
    protected void ddlPermanentDis_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadPermanentThanaByDistrict();
        //MainView.ActiveViewIndex = 1;
    }
    protected void ddlPresentDis_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadPresentThanaByDistrict();
        //MainView.ActiveViewIndex = 1;
    }
    protected void ddlPresentDiv_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadPresentDistrictByDivision();
        // MainView.ActiveViewIndex = 1;
    }
    #endregion
    
}