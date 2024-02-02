using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_User_AdmitCard : BasePage
{
    dalApplication obj = new dalApplication();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    private void GetData(long Id, string TransactionId)
    {   //SessionManager.SessionName.Branch = Convert.ToInt32(ddlBranch.SelectedValue);
        DataTable dt = obj.GetAmitCard(Id, TransactionId);
        if (dt.Rows.Count > 0)
        {
            DataTable dtx = new Common().GetAll("bs_SchoolInformation");
            if (dtx.Rows.Count > 0)
            {
                lblSchoolName.Text = dtx.Rows[0]["Name"].ToString();
                lblAddress.Text = dtx.Rows[0]["Address"].ToString();
            }
            pnContent.Visible = true;
            lbApplicationID.Text = dt.Rows[0]["Id"].ToString();
            lbYear.Text = dt.Rows[0]["cYear"].ToString();
            lbClass.Text = dt.Rows[0]["ClassName"].ToString();
            lbGroup.Text = dt.Rows[0]["GroupName"].ToString();
            lbName.Text = dt.Rows[0]["Name"].ToString();
            lbFatherName.Text = dt.Rows[0]["FathersName"].ToString();
            lbMotherName.Text = dt.Rows[0]["MothersName"].ToString();
            lbMobile.Text = dt.Rows[0]["Mobile"].ToString();
            lblExamDate.Text = Convert.ToDateTime(dt.Rows[0]["ExamDate"]).ToString("dd/MM/yyyy");
            lblExamTime.Text = dt.Rows[0]["ExamStartTime"].ToString() + "-" + dt.Rows[0]["ExamEndTime"].ToString();

            imgPrincipalSignature.ImageUrl = SessionManager.SessionName.Branch == 1 ? "~/Images/Common/principal_sign_pip.jpeg" :
                  SessionManager.SessionName.Branch == 2 ? "~/Images/Common/principal_sign_hip.jpeg" : "~/Images/Common/principal_sign_dip.jpeg";

            imgPhoto.ImageUrl = string.IsNullOrEmpty(dt.Rows[0]["Image"].ToString()) ? "~/Images/Common/student.png" : "~/VariableContent/AdmissionApplicant/" + dt.Rows[0]["Image"].ToString();

        }
        else
        {
            pnContent.Visible = false;
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        GetData(Convert.ToInt64(tbxApplicationId.Text), tbxTransactionId.Text);
    }
}