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

public partial class Pages_User_NewApplication : BasePage
{
    dalApplication obj = new dalApplication();
    dalAdmissionCircular dalCircular = new dalAdmissionCircular();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ViewState["ApplicationId"] = (long)0;
            if (Request.QueryString["CircularId"] != null)
            {
                LoadDropdown();
                int CircularId = Convert.ToInt32(Request.QueryString["CircularId"]);
                DefaultData(CircularId);
            }
            else
            {
                Response.Redirect("~/Pages/User/AdmissionCircular.aspx");
            }
        }
    }

    private void DefaultData(int CircularId)
    {
        DataTable dt = dalCircular.GetById(CircularId);
        lbApplyClass.Text = dt.Rows[0]["ClassName"].ToString();
        lbApplyYear.Text = dt.Rows[0]["cYear"].ToString();
    }
    protected void LoadDropdown()
    {
        Common.LoadDropdown(ddlGroup, "bs_Group", 1, 0);
        Common.LoadDropdown(ddlGender, "bs_Gender", 1, 0);
        Common.LoadDropdown(ddlReligion, "bs_Religion", 1, 0);
        Common.LoadDropdown(ddlPresentDiv, "bs_Division", 1, 0);
        chklQuota.DataSource = new Common().GetAll("bs_Quota");
        chklQuota.DataBind();

    }
    protected bool ValidImage(FileUpload file)
    {
        bool flag = false;
        string extension = Path.GetExtension(file.FileName).ToLower();
        if (extension == ".jpeg" || extension == ".jpg" || extension == ".png")
        {
            //if (file.PostedFile.ContentLength < 524288)
            //{
            flag = true;
            //}
        }
        return flag;
    }
    protected void btnBasic_Click(object sender, EventArgs e)
    {

        if (Request.QueryString["CircularId"] != null)
        {
            #region ImageUpload
            string imgStudent = "";
            long CircularId = Convert.ToInt64(Request.QueryString["CircularId"]);
            if (uploderStudent.HasFile)
            {
                if (ValidImage(uploderStudent) == true)
                {
                    imgStudent = Guid.NewGuid() + "-" + uploderStudent.FileName;
                    System.Drawing.Image image = System.Drawing.Image.FromStream(uploderStudent.FileContent);
                    System.Drawing.Image image2 = Controller.resizeImage(image, new Size(140, 140));
                    EncoderParameters encoderParameters = new EncoderParameters(1);
                    encoderParameters.Param[0] = new EncoderParameter(Encoder.Compression, 100);
                    string MediumImagePath = Server.MapPath("~/VariableContent/AdmissionApplicant/" + imgStudent);
                    image2.Save(string.Concat(MediumImagePath), ImageCodecInfo.GetImageEncoders()[1], encoderParameters);
                }
            }
            #endregion

            int ApplicationId = obj.Insert(tbxNameEng.Text, tbxFathername.Text, tbxMotherName.Text, tbxMobile.Text, tbxPresentAddress.Text, tbxPostOffice.Text, tbxPostalCode.Text,
                Convert.ToInt32(ddlPresentThana.SelectedValue), tbxMobHome.Text, Convert.ToInt32(ddlGender.SelectedValue), Convert.ToInt32(ddlReligion.SelectedValue),
                CircularId, dalCommon.DateFormatYYYYMMDD(tbxDateOfBirth.Text), imgStudent, tbxEmail.Text, tbxNationality.Text, Convert.ToInt32(ddlGroup.SelectedValue));

            if (ApplicationId > 0)
            {
                foreach (ListItem li in chklQuota.Items)
                {
                    if (li.Selected)
                    {
                        obj.QuotaInsert(Convert.ToInt32(li.Value), ApplicationId);
                    }

                }
                mplbApplicantName.Text = tbxNameEng.Text;
                mplbApplicationId.Text = ApplicationId.ToString();
                ViewState["ApplicationId"] = ApplicationId;
                mpApplicationId.Show();

            }
            else
            {
                if (File.Exists(Server.MapPath("~/VariableContent/AdmissionApplicant/" + imgStudent)))
                {
                    File.Delete(Server.MapPath("~/VariableContent/AdmissionApplicant/" + imgStudent));
                }
            }
        }

    }
    protected void ddlPresentDiv_SelectedIndexChanged(object sender, EventArgs e)
    {
        Common.DropdownByCondition(ddlPresentDis, "bs_District", "DivisionId", ddlPresentDiv.SelectedValue, 2, 0);
    }
    protected void ddlPresentDis_SelectedIndexChanged(object sender, EventArgs e)
    {
        Common.DropdownByCondition(ddlPresentThana, "bs_Thana", "DistrictId", ddlPresentDis.SelectedValue, 2, 0);
    }
    protected void btnOk_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Pages/User/ApplicationDownload.aspx");
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Pages/User/ApplicationDownload.aspx?ApplicationId="+ViewState["ApplicationId"]);
    }
}