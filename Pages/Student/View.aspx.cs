using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Student_View : BasePage
{
    dalStudent objStudent = new dalStudent();
    dalPerson objPerson = new dalPerson();
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "/Pages/Student/" + Path.GetFileName(Request.PhysicalPath) + Request.Url.Query;
        if (SessionManager.SessionName.UserName == null)
        {
            dalCommon.LoginReturnUrl(url);
        }
        if(!IsPostBack)
        {
            if (SessionManager.SessionName.RoleId == 4)
            {
                Id = SessionManager.SessionName.PersonId;
                LoadStudentInformation();
            }
            else if(Request.QueryString["Id"]!=null)
            {
                Id = Convert.ToInt32(Request.QueryString["Id"]);
                LoadStudentInformation();
            }
        }
    }

    int Id
    {
        set { ViewState["Id"] = value; }
        get
        {
            try
            {
                return Convert.ToInt32(ViewState["Id"]);
            }
            catch
            {
                return 0;
            }
        }
    }

    protected void LoadStudentInformation()
    {
        string presentAddress = "";
        string permanentAddress = "";
        DataTable dt = objPerson.GetByPersonId(Id);
        if(dt.Rows.Count>0)
        {
            lblRegNo.Text = dt.Rows[0]["RegistrationNo"].ToString();
            //lblPin.Text = EncryptionDecryption.Decrypt(dt.Rows[0]["Password"].ToString(),true);

            //************************************************************************
            lblClass.Text = dt.Rows[0]["ClassName"].ToString();
            lblGroup.Text = dt.Rows[0]["GroupName"].ToString();
            lblShift.Text = dt.Rows[0]["Shift"].ToString();
            lblSection.Text = dt.Rows[0]["Section"].ToString();
            lblYear.Text = dt.Rows[0]["Year"].ToString();
            lblRoll.Text = dt.Rows[0]["RollNo"].ToString();
            //************************************************************************

            lblNameEng.Text = dt.Rows[0]["NameEng"].ToString();
            lblNameBan.Text = dt.Rows[0]["NameBan"].ToString();
            lblGender.Text = dt.Rows[0]["Gender"].ToString();
            lblReligion.Text = dt.Rows[0]["Religion"].ToString();
            lblBloodGroup.Text = dt.Rows[0]["BloodGroupName"].ToString();
            lblBirthCertificate.Text = dt.Rows[0]["BirthCertificate"].ToString();
            lblDOB.Text = Convert.ToDateTime(dt.Rows[0]["DateofBirth"]).ToString("dd/MM/yyyy");
            lblMobile.Text = dt.Rows[0]["Mobile"].ToString();
            lblPhoneHome.Text = dt.Rows[0]["PhoneHome"].ToString();
            lblMobileHome.Text = dt.Rows[0]["MobileHome"].ToString();
            lblPhone.Text = dt.Rows[0]["PhoneNo"].ToString();
            if (dt.Rows[0]["PersonImage"].ToString() != "")
            {
                imgApplicant.ImageUrl = "~/VariableContent/Person/" + dt.Rows[0]["PersonImage"].ToString();
            }

            //************************************************************************
            lblPresentDiv.Text = dt.Rows[0]["presentDivName"].ToString();
            lblPresentDis.Text = dt.Rows[0]["presentDisName"].ToString();
            lblPresentThana.Text = dt.Rows[0]["presentThanaName"].ToString();
            lblPresentPostOffice.Text = dt.Rows[0]["presentPO"].ToString();
            lblPresentPostCode.Text = dt.Rows[0]["presentPC"].ToString();
            lblPresentAddress.Text = dt.Rows[0]["presentAddress"].ToString();

            lblPermanentDiv.Text = dt.Rows[0]["DivName"].ToString();
            lblPermanentDis.Text = dt.Rows[0]["DisName"].ToString();
            lblPermanentThana.Text = dt.Rows[0]["Thana"].ToString();
            lblPermanentPostOffice.Text = dt.Rows[0]["PostOffice"].ToString();
            lblPermanentPostCode.Text = dt.Rows[0]["PostalCode"].ToString();
            lblPermanentAddress.Text = dt.Rows[0]["Address"].ToString();
            //************************************************************************

            lblFather.Text = dt.Rows[0]["FatherNameEng"].ToString();
            lblFatherEduQualification.Text = dt.Rows[0]["FatherEdu"].ToString();
            lblFatherIncome.Text = dt.Rows[0]["FatherIncome"].ToString();
            lblFatherNID.Text = dt.Rows[0]["FatherNId"].ToString();
            lblFatherPhone.Text = dt.Rows[0]["FatherPhone"].ToString();
            lblFatherProfession.Text = dt.Rows[0]["FatherProfession"].ToString();
            if (dt.Rows[0]["FatherImage"].ToString() != "")
            {
                imgFather.ImageUrl = "~/VariableContent/Father/" + dt.Rows[0]["FatherImage"].ToString();
            }

            lblMotherName.Text = dt.Rows[0]["MotherNameEng"].ToString();
            lblMotherPhone.Text = dt.Rows[0]["MotherPhone"].ToString();
            lblMotherNId.Text = dt.Rows[0]["MotherNId"].ToString();
            lblMotherEduQualification.Text = dt.Rows[0]["MotherEdu"].ToString();
            lblMotherProfession.Text = dt.Rows[0]["MotherProfession"].ToString();
            lblMotherIncome.Text = dt.Rows[0]["MotherIncome"].ToString();
            if (dt.Rows[0]["MotherImage"].ToString() != "")
            {
                imgMother.ImageUrl = "~/VariableContent/Mother/" + dt.Rows[0]["MotherImage"].ToString();
            }
        }
    }
}