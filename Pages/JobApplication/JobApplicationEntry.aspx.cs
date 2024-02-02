using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_JobApllication_JobApplicationEntry : Page
{
    dalJobApplication obj = new dalJobApplication();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ViewState["ID"] = (int)0;
            LoadDropdown();
            ClearAll();
        }

    }
    protected void LoadDropdown()
    {
        Common.LoadDropdown(ddlReligion, "bs_Religion", 1, 0);
        Common.LoadDropdown(ddlGender, "bs_Gender", 1, 0);
        Common.LoadDropdown(ddlNationality, "bs_Nationality", 1, 0);
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {

            //#Basic
            string FullName = tbxFullName.Text;
            var FatherName = tbxFatherName.Text;
            var MotherName = tbxMotherName.Text;
            var DateOfBirth = dalCommon.DateFormatYYYYMMDD(tbxDateOfBirth.Text).ToString();
            if (ddlReligion.SelectedValue == "")
            {
                MessageController.Show("Please, select Religion", MessageType.Error, Page);
                return;
            }
            var ReligionId = ddlReligion.SelectedValue;
            var GenderId = ddlGender.SelectedValue;
            if (ddlGender.SelectedValue == "")
            {
                MessageController.Show("Please, select Gender", MessageType.Error, Page);
                return;
            }
            var NID = tbxNID.Text.ToUpper();
            var MobileNumber = tbxMobileNumber.Text.ToUpper();
            var Email = tbxEmail.Text.ToUpper();
            var MPO_NTRCA = tbxMPO_NTRCA.Text.ToUpper();
            var NationalityId = ddlNationality.SelectedValue;
            if (ddlNationality.SelectedValue == "")
            {
                MessageController.Show("Please, select Nationality", MessageType.Error, Page);
                return;
            }
            var PresentAddress = tbxPresentAddress.Text;
            var PermanentAddress = "";
            var SameAddress = cbSameAddress.Checked;
            if (SameAddress != true && tbxPermanentAddress.Text == "")
            {
                MessageController.Show("Please, give Permanent Address", MessageType.Error, Page);
                return;
            }
            if (SameAddress == true)
            {
                PermanentAddress = tbxPresentAddress.Text;
            }
            else
            {
                PermanentAddress = tbxPermanentAddress.Text;
            }

            // FaceImageFileName;
            var FaceImageFileName = "";
            if (!fuFaceImage.HasFile)
            {
                MessageController.Show("Failed. Need Image", MessageType.Warning, Page);
                return;
            }
            else
            {
                if (ValidImage(fuFaceImage) == false)
                {
                    MessageController.Show("Failed. The provided file given for image has improper format. Only supported jpeg,jpg,png.", MessageType.Warning, Page);
                    return;
                }
                else
                {
                    FaceImageFileName = "Face Image " + Guid.NewGuid().ToString() + "." + fuFaceImage.FileName.Split('.').LastOrDefault();
                    System.Drawing.Image image = System.Drawing.Image.FromStream(fuFaceImage.FileContent);
                    System.Drawing.Image image2 = Controller.resizeImage(image, new Size(200, 200));
                    EncoderParameters encoderParameters = new EncoderParameters(1);
                    encoderParameters.Param[0] = new EncoderParameter(Encoder.Compression, 100);
                    string serverPath = Server.MapPath("~/VariableContent/JobApplication/" + FaceImageFileName);
                    image2.Save(string.Concat(serverPath), ImageCodecInfo.GetImageEncoders()[1], encoderParameters);
                }
            }

            // SignatureImageFileName;
            var SignatureImageFileName = "";
            if (!fuSignatureImage.HasFile)
            {
                MessageController.Show("Failed. Need Image", MessageType.Warning, Page);
                return;
            }
            else
            {
                if (ValidImage(fuSignatureImage) == false)
                {
                    MessageController.Show("Failed. The provided file given for image has improper format. Only supported jpeg,jpg,png.", MessageType.Warning, Page);
                    return;
                }
                else
                {
                    SignatureImageFileName = "Signature Image " + Guid.NewGuid().ToString() + "." + fuSignatureImage.FileName.Split('.').LastOrDefault();
                    System.Drawing.Image image = System.Drawing.Image.FromStream(fuSignatureImage.FileContent);
                    System.Drawing.Image image2 = Controller.resizeImage(image, new Size(200, 100));
                    EncoderParameters encoderParameters = new EncoderParameters(1);
                    encoderParameters.Param[0] = new EncoderParameter(Encoder.Compression, 100);
                    string serverPath = Server.MapPath("~/VariableContent/JobApplication/" + SignatureImageFileName);
                    image2.Save(string.Concat(serverPath));
                }
            }


            //#Education
            var EducationMasterBoard = tbxEducationMasterBoard.Text;
            var EducationMasterCollege = tbxEducationMasterCollege.Text;
            var EducationMasterGroup = tbxEducationMasterGroup.Text;
            var EducationMasterCgpa = tbxEducationMasterCgpa.Text;
            var EducationMasterPassingYear = tbxEducationMasterPassingYear.Text;

            var EducationHonorsBoard = tbxEducationHonorsBoard.Text;
            var EducationHonorsCollege = tbxEducationHonorsCollege.Text;
            var EducationHonorsGroup = tbxEducationHonorsGroup.Text;
            var EducationHonorsCgpa = tbxEducationHonorsCgpa.Text;
            var EducationHonorsPassingYear = tbxEducationHonorsPassingYear.Text;

            var EducationHscBoard = tbxEducationHscBoard.Text;
            var EducationHscCollege = tbxEducationHscCollege.Text;
            var EducationHscGroup = tbxEducationHscGroup.Text;
            var EducationHscCgpa = tbxEducationHscCgpa.Text;
            var EducationHscPassingYear = tbxEducationHscPassingYear.Text;

            var EducationSscBoard = tbxEducationSscBoard.Text;
            var EducationSscCollege = tbxEducationSscCollege.Text;
            var EducationSscGroup = tbxEducationSscGroup.Text;
            var EducationSscCgpa = tbxEducationSscCgpa.Text;
            var EducationSscPassingYear = tbxEducationSscPassingYear.Text;

            var EducationJscBoard = tbxEducationJscBoard.Text;
            var EducationJscCollege = tbxEducationJscCollege.Text;
            var EducationJscGroup = tbxEducationJscGroup.Text;
            var EducationJscCgpa = tbxEducationJscCgpa.Text;
            var EducationJscPassingYear = tbxEducationJscPassingYear.Text;

            //#Tranning
            var TrainingCourseName_1 = tbxTrainingCourseName_1.Text;
            var TrainingInstituteName_1 = tbxTrainingInstituteName_1.Text;
            var TrainingInstituteAddress_1 = tbxTrainingInstituteAddress_1.Text;
            var TrainingResult_1 = tbxTrainingResult_1.Text;
            var TrainingStartDate_1 = tbxTrainingStartDate_1.Text;
            var TrainingRunning_1 = cbTrainingRunning_1.Checked ? "Running" : "";
            var TrainingEndDate_1 = tbxTrainingEndDate_1.Text;

            var TrainingCourseName_2 = tbxTrainingCourseName_2.Text;
            var TrainingInstituteName_2 = tbxTrainingInstituteName_2.Text;
            var TrainingInstituteAddress_2 = tbxTrainingInstituteAddress_2.Text;
            var TrainingResult_2 = tbxTrainingResult_2.Text;
            var TrainingStartDate_2 = tbxTrainingStartDate_2.Text;
            var TrainingRunning_2 = cbTrainingRunning_2.Checked ? "Running" : "";
            var TrainingEndDate_2 = tbxTrainingEndDate_2.Text;

            var TrainingCourseName_3 = tbxTrainingCourseName_3.Text;
            var TrainingInstituteName_3 = tbxTrainingInstituteName_3.Text;
            var TrainingInstituteAddress_3 = tbxTrainingInstituteAddress_3.Text;
            var TrainingResult_3 = tbxTrainingResult_3.Text;
            var TrainingStartDate_3 = tbxTrainingStartDate_3.Text;
            var TrainingRunning_3 = cbTrainingRunning_3.Checked ? "Running" : "";
            var TrainingEndDate_3 = tbxTrainingEndDate_3.Text;


            //#Experience
            var ExperienceInstitute_1 = tbxExperienceInstitute_1.Text;
            var ExperienceDepartment_1 = tbxExperienceDepartment_1.Text;
            var ExperienceDesignation_1 = tbxExperienceDesignation_1.Text;
            var ExperienceAddress_1 = tbxExperienceAddress_1.Text;
            var ExperienceStartDate_1 = tbxExperienceStartDate_1.Text;
            var ExperienceRunning_1 = cbExperienceRunning_1.Checked ? "Running" : "";
            var ExperienceEndDate_1 = tbxExperienceEndDate_1.Text;

            var ExperienceInstitute_2 = tbxExperienceInstitute_2.Text;
            var ExperienceDepartment_2 = tbxExperienceDepartment_2.Text;
            var ExperienceDesignation_2 = tbxExperienceDesignation_2.Text;
            var ExperienceAddress_2 = tbxExperienceAddress_2.Text;
            var ExperienceStartDate_2 = tbxExperienceStartDate_2.Text;
            var ExperienceRunning_2 = cbExperienceRunning_2.Checked ? "Running" : "";
            var ExperienceEndDate_2 = tbxExperienceEndDate_2.Text;

            var ExperienceInstitute_3 = tbxExperienceInstitute_3.Text;
            var ExperienceDepartment_3 = tbxExperienceDepartment_3.Text;
            var ExperienceDesignation_3 = tbxExperienceDesignation_3.Text;
            var ExperienceAddress_3 = tbxExperienceAddress_3.Text;
            var ExperienceStartDate_3 = tbxExperienceStartDate_3.Text;
            var ExperienceRunning_3 = cbExperienceRunning_3.Checked ? "Running" : "";
            var ExperienceEndDate_3 = tbxExperienceEndDate_3.Text;


            var resDataTable = obj.InsertJobApplication(
                     FullName, FatherName, MotherName, DateOfBirth, ReligionId, GenderId, NID, MobileNumber, Email, MPO_NTRCA, NationalityId, PresentAddress, PermanentAddress, FaceImageFileName, SignatureImageFileName,
                     EducationMasterBoard, EducationMasterCollege, EducationMasterGroup, EducationMasterCgpa, EducationMasterPassingYear,
                     EducationHonorsBoard, EducationHonorsCollege, EducationHonorsGroup, EducationHonorsCgpa, EducationHonorsPassingYear,
                     EducationHscBoard, EducationHscCollege, EducationHscGroup, EducationHscCgpa, EducationHscPassingYear,
                     EducationSscBoard, EducationSscCollege, EducationSscGroup, EducationSscCgpa, EducationSscPassingYear,
                     EducationJscBoard, EducationJscCollege, EducationJscGroup, EducationJscCgpa, EducationJscPassingYear,
                     TrainingCourseName_1, TrainingInstituteName_1, TrainingInstituteAddress_1, TrainingResult_1, TrainingStartDate_1, TrainingRunning_1, TrainingEndDate_1,
                     TrainingCourseName_2, TrainingInstituteName_2, TrainingInstituteAddress_2, TrainingResult_2, TrainingStartDate_2, TrainingRunning_2, TrainingEndDate_2,
                     TrainingCourseName_3, TrainingInstituteName_3, TrainingInstituteAddress_3, TrainingResult_3, TrainingStartDate_3, TrainingRunning_3, TrainingEndDate_3,
                     ExperienceInstitute_1, ExperienceDepartment_1, ExperienceDesignation_1, ExperienceAddress_1, ExperienceStartDate_1, ExperienceRunning_1, ExperienceEndDate_1,
                     ExperienceInstitute_2, ExperienceDepartment_2, ExperienceDesignation_2, ExperienceAddress_2, ExperienceStartDate_2, ExperienceRunning_2, ExperienceEndDate_2,
                     ExperienceInstitute_3, ExperienceDepartment_3, ExperienceDesignation_3, ExperienceAddress_3, ExperienceStartDate_3, ExperienceRunning_3, ExperienceEndDate_3
                );

            if (resDataTable.Rows[0][0].ToString() == "yes")
            {
                MessageController.Show("Your Application ID : " + resDataTable.Rows[0][1].ToString(), MessageType.Information, Page);
                LoadDropdown();
                ClearAll();
            }
            else
            {
                MessageController.Show(resDataTable.Rows[0][2].ToString(), MessageType.Error, Page);
            }
        }
        catch (Exception exception)
        {
            MessageController.Show("Save Failed. Please contact with admin.", MessageType.Error, Page);
        }
    }
    protected void ClearAll()
    {
        tbxFullName.Text = "";
        tbxFatherName.Text = "";
        tbxMotherName.Text = "";
        tbxDateOfBirth.Text = "";
        //tbxReligionId.Text = "";
        //tbxGenderId.Text = "";
        tbxNID.Text = "";
        tbxMobileNumber.Text = "";
        tbxEmail.Text = "";
        tbxMPO_NTRCA.Text = "";
        //tbxNationalityId.Text = "";
        tbxPresentAddress.Text = "";
        cbSameAddress.Checked = false;
        tbxPermanentAddress.Text = "";
        //tbxFaceImageFileName.Text = "";
        //tbxSignatureImageFileName.Text = "";
        tbxEducationMasterBoard.Text = "";
        tbxEducationMasterCollege.Text = "";
        tbxEducationMasterGroup.Text = "";
        tbxEducationMasterCgpa.Text = "";
        tbxEducationMasterPassingYear.Text = "";
        tbxEducationHonorsBoard.Text = "";
        tbxEducationHonorsCollege.Text = "";
        tbxEducationHonorsGroup.Text = "";
        tbxEducationHonorsCgpa.Text = "";
        tbxEducationHonorsPassingYear.Text = "";
        tbxEducationHscBoard.Text = "";
        tbxEducationHscCollege.Text = "";
        tbxEducationHscGroup.Text = "";
        tbxEducationHscCgpa.Text = "";
        tbxEducationHscPassingYear.Text = "";
        tbxEducationSscBoard.Text = "";
        tbxEducationSscCollege.Text = "";
        tbxEducationSscGroup.Text = "";
        tbxEducationSscCgpa.Text = "";
        tbxEducationSscPassingYear.Text = "";
        tbxEducationJscBoard.Text = "";
        tbxEducationJscCollege.Text = "";
        tbxEducationJscGroup.Text = "";
        tbxEducationJscCgpa.Text = "";
        tbxEducationJscPassingYear.Text = "";
        tbxTrainingCourseName_1.Text = "";
        tbxTrainingInstituteName_1.Text = "";
        tbxTrainingInstituteAddress_1.Text = "";
        tbxTrainingResult_1.Text = "";
        tbxTrainingStartDate_1.Text = "";
        cbTrainingRunning_1.Checked = false;
        tbxTrainingEndDate_1.Text = "";
        tbxTrainingCourseName_2.Text = "";
        tbxTrainingInstituteName_2.Text = "";
        tbxTrainingInstituteAddress_2.Text = "";
        tbxTrainingResult_2.Text = "";
        tbxTrainingStartDate_2.Text = "";
        cbTrainingRunning_2.Checked = false;
        tbxTrainingEndDate_2.Text = "";
        tbxTrainingCourseName_3.Text = "";
        tbxTrainingInstituteName_3.Text = "";
        tbxTrainingInstituteAddress_3.Text = "";
        tbxTrainingResult_3.Text = "";
        tbxTrainingStartDate_3.Text = "";
        cbTrainingRunning_3.Checked = false;
        tbxTrainingEndDate_3.Text = "";
        tbxExperienceInstitute_1.Text = "";
        tbxExperienceDepartment_1.Text = "";
        tbxExperienceDesignation_1.Text = "";
        tbxExperienceAddress_1.Text = "";
        tbxExperienceStartDate_1.Text = "";
        cbExperienceRunning_1.Checked = false;
        tbxExperienceEndDate_1.Text = "";
        tbxExperienceInstitute_2.Text = "";
        tbxExperienceDepartment_2.Text = "";
        tbxExperienceDesignation_2.Text = "";
        tbxExperienceAddress_2.Text = "";
        tbxExperienceStartDate_2.Text = "";
        cbExperienceRunning_2.Checked = false;
        tbxExperienceEndDate_2.Text = "";
        tbxExperienceInstitute_3.Text = "";
        tbxExperienceDepartment_3.Text = "";
        tbxExperienceDesignation_3.Text = "";
        tbxExperienceAddress_3.Text = "";
        tbxExperienceStartDate_3.Text = "";
        cbExperienceRunning_3.Checked = false;
        tbxExperienceEndDate_3.Text = "";

    }


    //# Helper Methods
    protected bool ValidImage(FileUpload file)
    {
        bool flag = false;
        string extension = Path.GetExtension(file.FileName).ToLower();
        if (extension == ".jpeg" || extension == ".jpg" || extension == ".png")
        {
            flag = true;
            //if (file.PostedFile.ContentLength < 524288)
            //{
            //    flag = true;
            //}
        }
        return flag;
    }
}