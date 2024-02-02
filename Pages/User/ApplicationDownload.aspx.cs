using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_User_ApplicationDownload : System.Web.UI.Page
{
    dalApplication obj = new dalApplication();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["ApplicationId"] != null)
            {
                GetData(Convert.ToInt64(Request.QueryString["ApplicationId"]));
            }
        }
    }
    private void GetData(long Id)
    {   //SessionManager.SessionName.Branch = Convert.ToInt32(ddlBranch.SelectedValue);
        DataTable dt = obj.GetById(Id);
        if (dt.Rows.Count > 0)
        {
            DataTable dtx = new Common().GetAll("bs_SchoolInformation");
            if (dtx.Rows.Count > 0)
            {
                // lblSchoolName.Text = dtx.Rows[0]["Name"].ToString();
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
            lbApplicationDate.Text = Convert.ToDateTime(dt.Rows[0]["ApplicationDate"]).ToString("dd/MM/yyyy");
            lbDateofBirth.Text = Convert.ToDateTime(dt.Rows[0]["DateofBirth"]).ToString("dd/MM/yyyy");
            lbMobile.Text = dt.Rows[0]["Mobile"].ToString();
            lbMobileHome.Text = dt.Rows[0]["MobileHome"].ToString();
            lbEmail.Text = dt.Rows[0]["Email"].ToString();
            lbNationality.Text = dt.Rows[0]["Nationality"].ToString();
            lbDivision.Text = dt.Rows[0]["Division"].ToString();
            lbDistrict.Text = dt.Rows[0]["District"].ToString();
            lbThana.Text = dt.Rows[0]["Thana"].ToString();
            lbPostOffice.Text = dt.Rows[0]["PostOffice"].ToString();
            lbAddress.Text = dt.Rows[0]["Address"].ToString();
            lbPostCode.Text = dt.Rows[0]["PostCode"].ToString();
            lbReligion.Text = dt.Rows[0]["Religion"].ToString();
            imgPhoto.ImageUrl = string.IsNullOrEmpty(dt.Rows[0]["Image"].ToString()) ? "~/Images/Common/student.png" : "~/VariableContent/AdmissionApplicant/" + dt.Rows[0]["Image"].ToString();
            DataTable dl = obj.GetQuotaByApplicationId(Id);
            dlQuota.DataSource = dl;
            dlQuota.RepeatColumns = dl.Rows.Count > 3 ? 3 : dl.Rows.Count;
            dlQuota.DataBind();
        }
        else
        {
            pnContent.Visible = false;
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        GetData(Convert.ToInt64(tbxApplicationId.Text));
    }
}