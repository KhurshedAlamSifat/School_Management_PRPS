using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_JobApplication_JobApplicationList : BasePage
{
    dalJobApplication obj = new dalJobApplication();
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "/Pages/JobApplication/" + Path.GetFileName(Request.PhysicalPath) + Request.Url.Query;
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

    #region Load All Dropdown
    protected void LoadDropdown()
    {
        Common.LoadDropdown(ddlGender, "bs_Gender", 1, 0);
        Common.LoadDropdown(ddlReligion, "bs_Religion", 1, 0);
        DataTable dt = new dalYear().GetDefault();
    }
    #endregion
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        LoadGridData();
    }
    protected void btnDownloadExcell_Click(object sender, EventArgs e)
    {
        string criteria = GetCriteria();
        DataTable dt = obj.GetJobApplicationByCriteria(criteria);

        if (dt.Rows.Count > 0)
        {
            Response.ClearContent();
            Response.AddHeader("content-disposition", "attachment;filename=Job_Application_List.xls");
            Response.AddHeader("Content-Type", "application/vnd.ms-excel");

            Response.Output.Write("ApplicationId" + "\t");
            Response.Output.Write("Religion" + "\t");
            Response.Output.Write("Gender" + "\t");
            Response.Output.Write("Nationality" + "\t");
            Response.Output.Write("FullName" + "\t");
            Response.Output.Write("FatherName" + "\t");
            Response.Output.Write("MotherName" + "\t");
            Response.Output.Write("DateOfBirth" + "\t");
            Response.Output.Write("NID" + "\t");
            Response.Output.Write("MobileNumber" + "\t");
            Response.Output.Write("Email" + "\t");
            Response.Output.Write("MPO_NTRCA" + "\t");
            Response.Output.Write("PresentAddress" + "\t");
            Response.Output.Write("PermanentAddress" + "\t");
            Response.Output.Write("EducationMasterBoard" + "\t");
            Response.Output.Write("EducationMasterCollege" + "\t");
            Response.Output.Write("EducationMasterGroup" + "\t");
            Response.Output.Write("EducationMasterCgpa" + "\t");
            Response.Output.Write("EducationMasterPassingYear" + "\t");
            Response.Output.Write("EducationHonorsBoard" + "\t");
            Response.Output.Write("EducationHonorsCollege" + "\t");
            Response.Output.Write("EducationHonorsGroup" + "\t");
            Response.Output.Write("EducationHonorsCgpa" + "\t");
            Response.Output.Write("EducationHonorsPassingYear" + "\t");
            Response.Output.Write("EducationHscBoard" + "\t");
            Response.Output.Write("EducationHscCollege" + "\t");
            Response.Output.Write("EducationHscGroup" + "\t");
            Response.Output.Write("EducationHscCgpa" + "\t");
            Response.Output.Write("EducationHscPassingYear" + "\t");
            Response.Output.Write("EducationSscBoard" + "\t");
            Response.Output.Write("EducationSscCollege" + "\t");
            Response.Output.Write("EducationSscGroup" + "\t");
            Response.Output.Write("EducationSscCgpa" + "\t");
            Response.Output.Write("EducationSscPassingYear" + "\t");
            Response.Output.Write("EducationJscBoard" + "\t");
            Response.Output.Write("EducationJscCollege" + "\t");
            Response.Output.Write("EducationJscGroup" + "\t");
            Response.Output.Write("EducationJscCgpa" + "\t");
            Response.Output.Write("EducationJscPassingYear" + "\t");
            Response.Output.Write("TrainingCourseName_1" + "\t");
            Response.Output.Write("TrainingInstituteName_1" + "\t");
            Response.Output.Write("TrainingInstituteAddress_1" + "\t");
            Response.Output.Write("TrainingResult_1" + "\t");
            Response.Output.Write("TrainingStartDate_1" + "\t");
            Response.Output.Write("TrainingRunning_1" + "\t");
            Response.Output.Write("TrainingEndDate_1" + "\t");
            Response.Output.Write("TrainingCourseName_2" + "\t");
            Response.Output.Write("TrainingInstituteName_2" + "\t");
            Response.Output.Write("TrainingInstituteAddress_2" + "\t");
            Response.Output.Write("TrainingResult_2" + "\t");
            Response.Output.Write("TrainingStartDate_2" + "\t");
            Response.Output.Write("TrainingRunning_2" + "\t");
            Response.Output.Write("TrainingEndDate_2" + "\t");
            Response.Output.Write("TrainingCourseName_3" + "\t");
            Response.Output.Write("TrainingInstituteName_3" + "\t");
            Response.Output.Write("TrainingInstituteAddress_3" + "\t");
            Response.Output.Write("TrainingResult_3" + "\t");
            Response.Output.Write("TrainingStartDate_3" + "\t");
            Response.Output.Write("TrainingRunning_3" + "\t");
            Response.Output.Write("TrainingEndDate_3" + "\t");
            Response.Output.Write("ExperienceInstitute_1" + "\t");
            Response.Output.Write("ExperienceDepartment_1" + "\t");
            Response.Output.Write("ExperienceDesignation_1" + "\t");
            Response.Output.Write("ExperienceAddress_1" + "\t");
            Response.Output.Write("ExperienceStartDate_1" + "\t");
            Response.Output.Write("ExperienceRunning_1" + "\t");
            Response.Output.Write("ExperienceEndDate_1" + "\t");
            Response.Output.Write("ExperienceInstitute_2" + "\t");
            Response.Output.Write("ExperienceDepartment_2" + "\t");
            Response.Output.Write("ExperienceDesignation_2" + "\t");
            Response.Output.Write("ExperienceAddress_2" + "\t");
            Response.Output.Write("ExperienceStartDate_2" + "\t");
            Response.Output.Write("ExperienceRunning_2" + "\t");
            Response.Output.Write("ExperienceEndDate_2" + "\t");
            Response.Output.Write("ExperienceInstitute_3" + "\t");
            Response.Output.Write("ExperienceDepartment_3" + "\t");
            Response.Output.Write("ExperienceDesignation_3" + "\t");
            Response.Output.Write("ExperienceAddress_3" + "\t");
            Response.Output.Write("ExperienceStartDate_3" + "\t");
            Response.Output.Write("ExperienceRunning_3" + "\t");
            Response.Output.Write("ExperienceEndDate_3" + "\t");
            Response.Output.WriteLine();
            //#Body
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Response.Output.Write(dt.Rows[i]["Id"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["Religion"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["Gender"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["Nationality"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["FullName"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["FatherName"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["MotherName"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["DateOfBirth"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["NID"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["MobileNumber"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["Email"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["MPO_NTRCA"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["PresentAddress"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["PermanentAddress"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["EducationMasterBoard"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["EducationMasterCollege"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["EducationMasterGroup"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["EducationMasterCgpa"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["EducationMasterPassingYear"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["EducationHonorsBoard"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["EducationHonorsCollege"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["EducationHonorsGroup"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["EducationHonorsCgpa"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["EducationHonorsPassingYear"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["EducationHscBoard"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["EducationHscCollege"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["EducationHscGroup"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["EducationHscCgpa"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["EducationHscPassingYear"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["EducationSscBoard"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["EducationSscCollege"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["EducationSscGroup"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["EducationSscCgpa"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["EducationSscPassingYear"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["EducationJscBoard"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["EducationJscCollege"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["EducationJscGroup"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["EducationJscCgpa"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["EducationJscPassingYear"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["TrainingCourseName_1"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["TrainingInstituteName_1"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["TrainingInstituteAddress_1"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["TrainingResult_1"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["TrainingStartDate_1"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["TrainingRunning_1"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["TrainingEndDate_1"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["TrainingCourseName_2"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["TrainingInstituteName_2"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["TrainingInstituteAddress_2"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["TrainingResult_2"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["TrainingStartDate_2"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["TrainingRunning_2"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["TrainingEndDate_2"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["TrainingCourseName_3"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["TrainingInstituteName_3"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["TrainingInstituteAddress_3"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["TrainingResult_3"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["TrainingStartDate_3"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["TrainingRunning_3"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["TrainingEndDate_3"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["ExperienceInstitute_1"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["ExperienceDepartment_1"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["ExperienceDesignation_1"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["ExperienceAddress_1"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["ExperienceStartDate_1"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["ExperienceRunning_1"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["ExperienceEndDate_1"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["ExperienceInstitute_2"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["ExperienceDepartment_2"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["ExperienceDesignation_2"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["ExperienceAddress_2"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["ExperienceStartDate_2"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["ExperienceRunning_2"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["ExperienceEndDate_2"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["ExperienceInstitute_3"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["ExperienceDepartment_3"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["ExperienceDesignation_3"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["ExperienceAddress_3"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["ExperienceStartDate_3"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["ExperienceRunning_3"].ToString() + "\t");
                Response.Output.Write(dt.Rows[i]["ExperienceEndDate_3"].ToString() + "\t");
                Response.Output.WriteLine();
            }
            Response.End();

        }
        else
        {
     
        }
    }
    protected void btnDeleteMulti_Click(object sender, EventArgs e)
    {
        string criteria = GetCriteria();
        DataTable dt = obj.GetJobApplicationByCriteria(criteria);
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                var fileName = dt.Rows[i]["FaceImageFileName"].ToString();
                if (fileName != "")
                {
                    if (System.IO.File.Exists(Server.MapPath("/VariableContent/JobApplication/" + fileName)))
                    {
                        System.IO.File.Delete(Server.MapPath("/VariableContent/JobApplication/" + fileName));
                    }
                }
                fileName = dt.Rows[i]["SignatureImageFileName"].ToString();
                if (fileName != "")
                {
                    if (System.IO.File.Exists(Server.MapPath("/VariableContent/JobApplication/" + fileName)))
                    {
                        System.IO.File.Delete(Server.MapPath("/VariableContent/JobApplication/" + fileName));
                    }
                }
                new Common().Delete("jb_JobApplication", Convert.ToInt32(dt.Rows[i]["Id"].ToString()));
            }
        }
        LoadGridData();
    }
    protected void LoadGridData() {
        string criteria = GetCriteria();
        DataTable dt = obj.GetJobApplicationByCriteria(criteria);
        if (dt.Rows.Count > 0)
        {
            rpt.DataSource = dt;
            rpt.DataBind();
        }
        else
        {
            rpt.DataSource = null;
            rpt.DataBind();
        }
    }
    protected void btnDelete_Command(object sender, CommandEventArgs e)
    {
        int Id = Convert.ToInt32(e.CommandArgument);
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
        MessageController.Show(MessageCode.DeleteSucceeded, MessageType.Information, Page);
        LoadGridData();
    }
    #region Get Criteria
    protected string GetCriteria()
    {
        string criteria = " 1=1 ";
        
        if (tbxApplicationId.Text != "")
        {
            criteria = criteria + " AND jb_JobApplication.Id = '" + tbxApplicationId.Text + "'";
        }
        if (tbxFullName.Text != "")
        {
            criteria = criteria + " AND FullName LIKE '%" + tbxFullName.Text + "%'";
        }
        if (tbxMobileNumber.Text != "")
        {
            criteria = criteria + " AND MobileNumber LIKE '%" + tbxMobileNumber.Text + "'";
        }
        if (tbxEmail.Text != "")
        {
            criteria = criteria + " AND Email = '" + tbxEmail.Text + "'";
        }
        if (ddlReligion.SelectedValue != "")
        {
            criteria = criteria + " AND ReligionId = '" + ddlReligion.SelectedValue + "'";
        }
        if (ddlGender.SelectedValue != "")
        {
            criteria = criteria + " AND GenderId = '" + ddlGender.SelectedValue + "'";
        }

        return criteria;
    }
    #endregion

}