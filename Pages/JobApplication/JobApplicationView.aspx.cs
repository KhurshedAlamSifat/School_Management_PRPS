using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_JobApllication_JobApplicationView : System.Web.UI.Page
{
    dalJobApplication obj = new dalJobApplication();
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "/Pages/JobApllication/" + Path.GetFileName(Request.PhysicalPath) + Request.Url.Query;
        if (SessionManager.SessionName.UserName == null)
        {
            dalCommon.LoginReturnUrl(url);
        }
        if (!IsPostBack)
        {
            if (Request.QueryString["Id"] != null)
            {
                var Id = Convert.ToInt32(Request.QueryString["Id"]);
                ViewState["ID"] = Id;
                LoadData();
            }
        }
    }
    protected void LoadData()
    {
        int Id = (int)ViewState["ID"];
        DataTable dt = obj.GetJobApplicationById(Id);
        if (dt.Rows.Count > 0) {
            lblApplicationId.Text = dt.Rows[0]["Id"].ToString();
            lblReligion.Text = dt.Rows[0]["Religion"].ToString();
            lblGender.Text = dt.Rows[0]["Gender"].ToString();
            lblNationality.Text = dt.Rows[0]["Nationality"].ToString();
            //lblId.Text = dt.Rows[0]["Id"].ToString();
            lblFullName.Text = dt.Rows[0]["FullName"].ToString();
            lblFatherName.Text = dt.Rows[0]["FatherName"].ToString();
            lblMotherName.Text = dt.Rows[0]["MotherName"].ToString();
            lblDateOfBirth.Text = dt.Rows[0]["DateOfBirth"].ToString();
            //lblReligionId.Text = dt.Rows[0]["ReligionId"].ToString();
            //lblGenderId.Text = dt.Rows[0]["GenderId"].ToString();
            lblNID.Text = dt.Rows[0]["NID"].ToString();
            lblMobileNumber.Text = dt.Rows[0]["MobileNumber"].ToString();
            lblEmail.Text = dt.Rows[0]["Email"].ToString();
            lblMPO_NTRCA.Text = dt.Rows[0]["MPO_NTRCA"].ToString();
            //lblNationalityId.Text = dt.Rows[0]["NationalityId"].ToString();
            lblPresentAddress.Text = dt.Rows[0]["PresentAddress"].ToString();
            lblPermanentAddress.Text = dt.Rows[0]["PermanentAddress"].ToString();
            //lblFaceImageFileName.Text = dt.Rows[0]["FaceImageFileName"].ToString();
            imgFaceImage.ImageUrl = "~/VariableContent/JobApplication/" + dt.Rows[0]["FaceImageFileName"].ToString();
            //lblSignatureImageFileName.Text = dt.Rows[0]["SignatureImageFileName"].ToString();
            imgSignatureImage.ImageUrl = "~/VariableContent/JobApplication/" + dt.Rows[0]["SignatureImageFileName"].ToString();
            lblEducationMasterBoard.Text = dt.Rows[0]["EducationMasterBoard"].ToString();
            lblEducationMasterCollege.Text = dt.Rows[0]["EducationMasterCollege"].ToString();
            lblEducationMasterGroup.Text = dt.Rows[0]["EducationMasterGroup"].ToString();
            lblEducationMasterCgpa.Text = dt.Rows[0]["EducationMasterCgpa"].ToString();
            lblEducationMasterPassingYear.Text = dt.Rows[0]["EducationMasterPassingYear"].ToString();
            lblEducationHonorsBoard.Text = dt.Rows[0]["EducationHonorsBoard"].ToString();
            lblEducationHonorsCollege.Text = dt.Rows[0]["EducationHonorsCollege"].ToString();
            lblEducationHonorsGroup.Text = dt.Rows[0]["EducationHonorsGroup"].ToString();
            lblEducationHonorsCgpa.Text = dt.Rows[0]["EducationHonorsCgpa"].ToString();
            lblEducationHonorsPassingYear.Text = dt.Rows[0]["EducationHonorsPassingYear"].ToString();
            lblEducationHscBoard.Text = dt.Rows[0]["EducationHscBoard"].ToString();
            lblEducationHscCollege.Text = dt.Rows[0]["EducationHscCollege"].ToString();
            lblEducationHscGroup.Text = dt.Rows[0]["EducationHscGroup"].ToString();
            lblEducationHscCgpa.Text = dt.Rows[0]["EducationHscCgpa"].ToString();
            lblEducationHscPassingYear.Text = dt.Rows[0]["EducationHscPassingYear"].ToString();
            lblEducationSscBoard.Text = dt.Rows[0]["EducationSscBoard"].ToString();
            lblEducationSscCollege.Text = dt.Rows[0]["EducationSscCollege"].ToString();
            lblEducationSscGroup.Text = dt.Rows[0]["EducationSscGroup"].ToString();
            lblEducationSscCgpa.Text = dt.Rows[0]["EducationSscCgpa"].ToString();
            lblEducationSscPassingYear.Text = dt.Rows[0]["EducationSscPassingYear"].ToString();
            lblEducationJscBoard.Text = dt.Rows[0]["EducationJscBoard"].ToString();
            lblEducationJscCollege.Text = dt.Rows[0]["EducationJscCollege"].ToString();
            lblEducationJscGroup.Text = dt.Rows[0]["EducationJscGroup"].ToString();
            lblEducationJscCgpa.Text = dt.Rows[0]["EducationJscCgpa"].ToString();
            lblEducationJscPassingYear.Text = dt.Rows[0]["EducationJscPassingYear"].ToString();
            lblTrainingCourseName_1.Text = dt.Rows[0]["TrainingCourseName_1"].ToString();
            lblTrainingInstituteName_1.Text = dt.Rows[0]["TrainingInstituteName_1"].ToString();
            lblTrainingInstituteAddress_1.Text = dt.Rows[0]["TrainingInstituteAddress_1"].ToString();
            lblTrainingResult_1.Text = dt.Rows[0]["TrainingResult_1"].ToString();
            lblTrainingStartDate_1.Text = dt.Rows[0]["TrainingStartDate_1"].ToString();
            lblTrainingRunning_1.Text = dt.Rows[0]["TrainingRunning_1"].ToString();
            lblTrainingEndDate_1.Text = dt.Rows[0]["TrainingEndDate_1"].ToString();
            lblTrainingCourseName_2.Text = dt.Rows[0]["TrainingCourseName_2"].ToString();
            lblTrainingInstituteName_2.Text = dt.Rows[0]["TrainingInstituteName_2"].ToString();
            lblTrainingInstituteAddress_2.Text = dt.Rows[0]["TrainingInstituteAddress_2"].ToString();
            lblTrainingResult_2.Text = dt.Rows[0]["TrainingResult_2"].ToString();
            lblTrainingStartDate_2.Text = dt.Rows[0]["TrainingStartDate_2"].ToString();
            lblTrainingRunning_2.Text = dt.Rows[0]["TrainingRunning_2"].ToString();
            lblTrainingEndDate_2.Text = dt.Rows[0]["TrainingEndDate_2"].ToString();
            lblTrainingCourseName_3.Text = dt.Rows[0]["TrainingCourseName_3"].ToString();
            lblTrainingInstituteName_3.Text = dt.Rows[0]["TrainingInstituteName_3"].ToString();
            lblTrainingInstituteAddress_3.Text = dt.Rows[0]["TrainingInstituteAddress_3"].ToString();
            lblTrainingResult_3.Text = dt.Rows[0]["TrainingResult_3"].ToString();
            lblTrainingStartDate_3.Text = dt.Rows[0]["TrainingStartDate_3"].ToString();
            lblTrainingRunning_3.Text = dt.Rows[0]["TrainingRunning_3"].ToString();
            lblTrainingEndDate_3.Text = dt.Rows[0]["TrainingEndDate_3"].ToString();
            lblExperienceInstitute_1.Text = dt.Rows[0]["ExperienceInstitute_1"].ToString();
            lblExperienceDepartment_1.Text = dt.Rows[0]["ExperienceDepartment_1"].ToString();
            lblExperienceDesignation_1.Text = dt.Rows[0]["ExperienceDesignation_1"].ToString();
            lblExperienceAddress_1.Text = dt.Rows[0]["ExperienceAddress_1"].ToString();
            lblExperienceStartDate_1.Text = dt.Rows[0]["ExperienceStartDate_1"].ToString();
            lblExperienceRunning_1.Text = dt.Rows[0]["ExperienceRunning_1"].ToString();
            lblExperienceEndDate_1.Text = dt.Rows[0]["ExperienceEndDate_1"].ToString();
            lblExperienceInstitute_2.Text = dt.Rows[0]["ExperienceInstitute_2"].ToString();
            lblExperienceDepartment_2.Text = dt.Rows[0]["ExperienceDepartment_2"].ToString();
            lblExperienceDesignation_2.Text = dt.Rows[0]["ExperienceDesignation_2"].ToString();
            lblExperienceAddress_2.Text = dt.Rows[0]["ExperienceAddress_2"].ToString();
            lblExperienceStartDate_2.Text = dt.Rows[0]["ExperienceStartDate_2"].ToString();
            lblExperienceRunning_2.Text = dt.Rows[0]["ExperienceRunning_2"].ToString();
            lblExperienceEndDate_2.Text = dt.Rows[0]["ExperienceEndDate_2"].ToString();
            lblExperienceInstitute_3.Text = dt.Rows[0]["ExperienceInstitute_3"].ToString();
            lblExperienceDepartment_3.Text = dt.Rows[0]["ExperienceDepartment_3"].ToString();
            lblExperienceDesignation_3.Text = dt.Rows[0]["ExperienceDesignation_3"].ToString();
            lblExperienceAddress_3.Text = dt.Rows[0]["ExperienceAddress_3"].ToString();
            lblExperienceStartDate_3.Text = dt.Rows[0]["ExperienceStartDate_3"].ToString();
            lblExperienceRunning_3.Text = dt.Rows[0]["ExperienceRunning_3"].ToString();
            lblExperienceEndDate_3.Text = dt.Rows[0]["ExperienceEndDate_3"].ToString();

        }


    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        int Id = (int)ViewState["ID"];
        DataTable dt = obj.GetJobApplicationById(Id);
        var fileName = dt.Rows[0]["FaceImageFileName"].ToString();
        if (fileName != "")
        {
            if (System.IO.File.Exists(Server.MapPath("/VariableContent/JobApplication/" + fileName)))
            {
                System.IO.File.Delete(Server.MapPath("/VariableContent/JobApplication/" + fileName));
            }
        }
        fileName = dt.Rows[0]["SignatureImageFileName"].ToString();
        if (fileName != "")
        {
            if (System.IO.File.Exists(Server.MapPath("/VariableContent/JobApplication/" + fileName)))
            {
                System.IO.File.Delete(Server.MapPath("/VariableContent/JobApplication/" + fileName));
            }
        }
        new Common().Delete("jb_JobApplication", Id);
       
        string close = @"<script type='text/javascript'>
                                window.returnValue = true;
                                window.close();
                                </script>";
        Response.Write(close);
    }
}