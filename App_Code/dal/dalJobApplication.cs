
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for dalLibrary
/// </summary>
public class dalJobApplication
{
    DatabaseManager dm = new DatabaseManager();
    public dalJobApplication()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    #region Book Lending
    public DataTable InsertJobApplication(
            string FullName, string FatherName, string MotherName, string DateOfBirth, string ReligionId, string GenderId, string NID, string MobileNumber, string Email, string MPO_NTRCA, string NationalityId, string PresentAddress, string PermanentAddress, string FaceImageFileName, string SignatureImageFileName,
            string EducationMasterBoard, string EducationMasterCollege, string EducationMasterGroup, string EducationMasterCgpa, string EducationMasterPassingYear,
            string EducationHonorsBoard, string EducationHonorsCollege, string EducationHonorsGroup, string EducationHonorsCgpa, string EducationHonorsPassingYear,
            string EducationHscBoard, string EducationHscCollege, string EducationHscGroup, string EducationHscCgpa, string EducationHscPassingYear,
            string EducationSscBoard, string EducationSscCollege, string EducationSscGroup, string EducationSscCgpa, string EducationSscPassingYear,
            string EducationJscBoard, string EducationJscCollege, string EducationJscGroup, string EducationJscCgpa, string EducationJscPassingYear,
            string TrainingCourseName_1, string TrainingInstituteName_1, string TrainingInstituteAddress_1, string TrainingResult_1, string TrainingStartDate_1, string TrainingRunning_1, string TrainingEndDate_1,
            string TrainingCourseName_2, string TrainingInstituteName_2, string TrainingInstituteAddress_2, string TrainingResult_2, string TrainingStartDate_2, string TrainingRunning_2, string TrainingEndDate_2,
            string TrainingCourseName_3, string TrainingInstituteName_3, string TrainingInstituteAddress_3, string TrainingResult_3, string TrainingStartDate_3, string TrainingRunning_3, string TrainingEndDate_3,
            string ExperienceInstitute_1, string ExperienceDepartment_1, string ExperienceDesignation_1, string ExperienceAddress_1, string ExperienceStartDate_1, string ExperienceRunning_1, string ExperienceEndDate_1,
            string ExperienceInstitute_2, string ExperienceDepartment_2, string ExperienceDesignation_2, string ExperienceAddress_2, string ExperienceStartDate_2, string ExperienceRunning_2, string ExperienceEndDate_2,
            string ExperienceInstitute_3, string ExperienceDepartment_3, string ExperienceDesignation_3, string ExperienceAddress_3, string ExperienceStartDate_3, string ExperienceRunning_3, string ExperienceEndDate_3
        )
    {
        dm.AddParameteres("@FullName", FullName);
        dm.AddParameteres("@FatherName", FatherName);
        dm.AddParameteres("@MotherName", MotherName);
        dm.AddParameteres("@DateOfBirth", DateOfBirth);
        dm.AddParameteres("@ReligionId", ReligionId);
        dm.AddParameteres("@GenderId", GenderId);
        dm.AddParameteres("@NID", NID);
        dm.AddParameteres("@MobileNumber", MobileNumber);
        dm.AddParameteres("@Email", Email);
        dm.AddParameteres("@MPO_NTRCA", MPO_NTRCA);
        dm.AddParameteres("@NationalityId", NationalityId);
        dm.AddParameteres("@PresentAddress", PresentAddress);
        dm.AddParameteres("@PermanentAddress", PermanentAddress);
        dm.AddParameteres("@FaceImageFileName", FaceImageFileName);
        dm.AddParameteres("@SignatureImageFileName", SignatureImageFileName);
        dm.AddParameteres("@EducationMasterBoard", EducationMasterBoard);
        dm.AddParameteres("@EducationMasterCollege", EducationMasterCollege);
        dm.AddParameteres("@EducationMasterGroup", EducationMasterGroup);
        dm.AddParameteres("@EducationMasterCgpa", EducationMasterCgpa);
        dm.AddParameteres("@EducationMasterPassingYear", EducationMasterPassingYear);
        dm.AddParameteres("@EducationHonorsBoard", EducationHonorsBoard);
        dm.AddParameteres("@EducationHonorsCollege", EducationHonorsCollege);
        dm.AddParameteres("@EducationHonorsGroup", EducationHonorsGroup);
        dm.AddParameteres("@EducationHonorsCgpa", EducationHonorsCgpa);
        dm.AddParameteres("@EducationHonorsPassingYear", EducationHonorsPassingYear);
        dm.AddParameteres("@EducationHscBoard", EducationHscBoard);
        dm.AddParameteres("@EducationHscCollege", EducationHscCollege);
        dm.AddParameteres("@EducationHscGroup", EducationHscGroup);
        dm.AddParameteres("@EducationHscCgpa", EducationHscCgpa);
        dm.AddParameteres("@EducationHscPassingYear", EducationHscPassingYear);

        dm.AddParameteres("@EducationSscBoard", EducationSscBoard);
        dm.AddParameteres("@EducationSscCollege", EducationSscCollege);
        dm.AddParameteres("@EducationSscGroup", EducationSscGroup);
        dm.AddParameteres("@EducationSscCgpa", EducationSscCgpa);
        dm.AddParameteres("@EducationSscPassingYear", EducationSscPassingYear);

        dm.AddParameteres("@EducationJscBoard", EducationJscBoard);
        dm.AddParameteres("@EducationJscCollege", EducationJscCollege);
        dm.AddParameteres("@EducationJscGroup", EducationJscGroup);
        dm.AddParameteres("@EducationJscCgpa", EducationJscCgpa);
        dm.AddParameteres("@EducationJscPassingYear", EducationJscPassingYear);
        dm.AddParameteres("@TrainingCourseName_1", TrainingCourseName_1);
        dm.AddParameteres("@TrainingInstituteName_1", TrainingInstituteName_1);
        dm.AddParameteres("@TrainingInstituteAddress_1", TrainingInstituteAddress_1);
        dm.AddParameteres("@TrainingResult_1", TrainingResult_1);
        dm.AddParameteres("@TrainingStartDate_1", TrainingStartDate_1);
        dm.AddParameteres("@TrainingRunning_1", TrainingRunning_1);
        dm.AddParameteres("@TrainingEndDate_1", TrainingEndDate_1);
        dm.AddParameteres("@TrainingCourseName_2", TrainingCourseName_2);
        dm.AddParameteres("@TrainingInstituteName_2", TrainingInstituteName_2);
        dm.AddParameteres("@TrainingInstituteAddress_2", TrainingInstituteAddress_2);
        dm.AddParameteres("@TrainingResult_2", TrainingResult_2);
        dm.AddParameteres("@TrainingStartDate_2", TrainingStartDate_2);
        dm.AddParameteres("@TrainingRunning_2", TrainingRunning_2);
        dm.AddParameteres("@TrainingEndDate_2", TrainingEndDate_2);
        dm.AddParameteres("@TrainingCourseName_3", TrainingCourseName_3);
        dm.AddParameteres("@TrainingInstituteName_3", TrainingInstituteName_3);
        dm.AddParameteres("@TrainingInstituteAddress_3", TrainingInstituteAddress_3);
        dm.AddParameteres("@TrainingResult_3", TrainingResult_3);
        dm.AddParameteres("@TrainingStartDate_3", TrainingStartDate_3);
        dm.AddParameteres("@TrainingRunning_3", TrainingRunning_3);
        dm.AddParameteres("@TrainingEndDate_3", TrainingEndDate_3);
        dm.AddParameteres("@ExperienceInstitute_1", ExperienceInstitute_1);
        dm.AddParameteres("@ExperienceDepartment_1", ExperienceDepartment_1);
        dm.AddParameteres("@ExperienceDesignation_1", ExperienceDesignation_1);
        dm.AddParameteres("@ExperienceAddress_1", ExperienceAddress_1);
        dm.AddParameteres("@ExperienceStartDate_1", ExperienceStartDate_1);
        dm.AddParameteres("@ExperienceRunning_1", ExperienceRunning_1);
        dm.AddParameteres("@ExperienceEndDate_1", ExperienceEndDate_1);
        dm.AddParameteres("@ExperienceInstitute_2", ExperienceInstitute_2);
        dm.AddParameteres("@ExperienceDepartment_2", ExperienceDepartment_2);
        dm.AddParameteres("@ExperienceDesignation_2", ExperienceDesignation_2);
        dm.AddParameteres("@ExperienceAddress_2", ExperienceAddress_2);
        dm.AddParameteres("@ExperienceStartDate_2", ExperienceStartDate_2);
        dm.AddParameteres("@ExperienceRunning_2", ExperienceRunning_2);
        dm.AddParameteres("@ExperienceEndDate_2", ExperienceEndDate_2);
        dm.AddParameteres("@ExperienceInstitute_3", ExperienceInstitute_3);
        dm.AddParameteres("@ExperienceDepartment_3", ExperienceDepartment_3);
        dm.AddParameteres("@ExperienceDesignation_3", ExperienceDesignation_3);
        dm.AddParameteres("@ExperienceAddress_3", ExperienceAddress_3);
        dm.AddParameteres("@ExperienceStartDate_3", ExperienceStartDate_3);
        dm.AddParameteres("@ExperienceRunning_3", ExperienceRunning_3);
        dm.AddParameteres("@ExperienceEndDate_3", ExperienceEndDate_3);

        return dm.ExecuteQuery("USP_JobApplication_Insert");
    }
    public DataTable GetJobApplicationByCriteria(string criteria)
    {
        dm.AddParameteres("@Criteria", criteria);
        return dm.ExecuteQuery("USP_JobApplication_GetByCriteria");
    }
    public DataTable GetJobApplicationById(int id)
    {
        dm.AddParameteres("@Id", id);
        return dm.ExecuteQuery("USP_JobApplication_GetById");
    }
    #endregion

}