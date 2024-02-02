using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Admission_CircularDetails : BasePage
{
    dalAdmissionCircular obj = new dalAdmissionCircular();
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "/Pages/Admission/" + Path.GetFileName(Request.PhysicalPath) + Request.Url.Query;
        if (SessionManager.SessionName.UserName == null)
        {
            dalCommon.LoginReturnUrl(url);
        }
        if (!IsPostBack)
        {
            if (Request.QueryString["ID"] != null)
            {
                int ID = Convert.ToInt32(Request.QueryString["ID"]);
                LoadCircularDetails(ID);
            }
        }
    }
    protected void LoadCircularDetails(int ID)
    {
        DataTable dt = obj.GetById(ID);
        if (dt.Rows.Count > 0)
        {
            lbStartDate.Text = Convert.ToDateTime(dt.Rows[0]["StartDate"]).ToString("dd/MM/yyyy");
            lbEndDate.Text = Convert.ToDateTime(dt.Rows[0]["EndDate"]).ToString("dd/MM/yyyy");
            lbClass.Text = dt.Rows[0]["ClassName"].ToString();
            lbTitle.Text = dt.Rows[0]["Title"].ToString();
            lbYear.Text = dt.Rows[0]["cYear"].ToString();
            lbApplicationFee.Text = dt.Rows[0]["ApplicationFee"].ToString();
            if (!String.IsNullOrEmpty(dt.Rows[0]["Attachment"].ToString()))
            {
                hlAttachment.NavigateUrl = "/VariableContent/AdmissionCircular/" + dt.Rows[0]["Attachment"].ToString();
                hlAttachment.Text = "Attachment";
            }
            else
            {
                hlAttachment.Text = "N/A";
            }
            ltDetails.Text = dt.Rows[0]["Details"].ToString();
        }
    }
}