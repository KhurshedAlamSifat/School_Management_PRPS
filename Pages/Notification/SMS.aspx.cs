using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Notification_SMS : BasePage
{
    dalStudent obj = new dalStudent();
    dalEmailTemplete objEmail = new dalEmailTemplete();
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "/Pages/Notification/" + Path.GetFileName(Request.PhysicalPath) + Request.Url.Query;
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
            LoadDDL();
            loadTeacher();
            //LoadEmailTemplete();
        }
    }
    protected void loadTeacher()
    {
        rptTeacher.DataSource = new dalTeacher().GetAll();
        rptTeacher.DataBind();
    }
    #region Load Data
    protected void LoadDDL()
    {
        ListItem li = new ListItem("--Select--", "");
        ddlYear.DataSource = new Common().GetAll("bs_Year");
        ddlYear.DataBind();

        ddlClass.DataSource = new Common().GetAll("bs_ClassName");
        ddlClass.DataBind();
        ddlClass.Items.Insert(0, li);

        ddlGroup.DataSource = new Common().GetAll("bs_Group");
        ddlGroup.DataBind();
        ddlGroup.Items.Insert(0, li);

        ddlShift.DataSource = new Common().GetAll("bs_Shift");
        ddlShift.DataBind();
        ddlShift.Items.Insert(0, li);

        ddlSection.DataSource = new Common().GetAll("bs_Section");
        ddlSection.DataBind();
        ddlSection.Items.Insert(0, li);

    }
    //protected void LoadEmailTemplete()
    //{
    //    DataTable dt = objEmail.GetById(Convert.ToInt32(ddlEmailTemplte.SelectedValue));
    //    if (dt.Rows.Count > 0)
    //    {
    //        lblSubject.Text = dt.Rows[0]["Subject"].ToString();
    //        lblBody.Text = dt.Rows[0]["Body"].ToString();
    //    }
    //}
    #endregion

    #region Get Criteria
    protected string GetCriteria()
    {
        string criteria = "";
        if (ddlYear.SelectedValue != "")
        {
            if (criteria == "")
                criteria = "Year=" + ddlYear.SelectedItem.Text;
            else
                criteria += " Year=" + ddlYear.SelectedItem.Text;
        }

        if (ddlClass.SelectedValue != "")
        {
            if (criteria == "")
                criteria = "ClassId=" + ddlClass.SelectedValue;
            else
                criteria += " and ClassId=" + ddlClass.SelectedValue;
        }
        if (ddlGroup.SelectedValue != "")
        {
            if (criteria == "")
                criteria = "GroupId=" + ddlGroup.SelectedValue;
            else
                criteria += " and GroupId=" + ddlGroup.SelectedValue;
        }
        if (ddlShift.SelectedValue != "")
        {
            if (criteria == "")
                criteria = "ShiftId=" + ddlShift.SelectedValue;
            else
                criteria += " and ShiftId=" + ddlShift.SelectedValue;
        }
        if (ddlSection.SelectedValue != "")
        {
            if (criteria == "")
                criteria = "SectionId=" + ddlSection.SelectedValue;
            else
                criteria += " and SectionId=" + ddlSection.SelectedValue;
        }
        return criteria;
    }
    #endregion
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string criteria = GetCriteria();
        DataTable dt = obj.GetByCriteria(criteria);
        if (dt.Rows.Count > 0)
        {
            rptStudent.DataSource = dt;
            rptStudent.DataBind();
        }
        else
        {
            rptStudent.DataSource = null;
            rptStudent.DataBind();
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        int count = 0;
        if (rdList.SelectedValue == "1")
        {
            string msg = tbxBody.Text + " ---PRPS";
            foreach (RepeaterItem r in rptStudent.Items)
            {
                CheckBox chk = (CheckBox)r.FindControl("chkrow");
                if (chk.Checked)
                {
                    HiddenField mobile = (HiddenField)r.FindControl("hdnStMobile");
                    dalCommon.SendSMS("", "", "PRPS", mobile.Value, msg);
                    count++;
                }
            }
        }
        else if (rdList.SelectedValue == "2")
        {
            string msg = tbxBody.Text + " ---PRPS";
            foreach (RepeaterItem r in rptTeacher.Items)
            {
                CheckBox chk = (CheckBox)r.FindControl("chkrow");
                if (chk.Checked)
                {
                    HiddenField mobile = (HiddenField)r.FindControl("hdnMobile");
                    dalCommon.SendSMS("", "", "PRPS", mobile.Value, msg);
                    count++;
                }
            }

        }
        string ct=count.ToString()+" Message Sent";
        MessageController.Show(ct, MessageType.Information, Page);
    }
    public string RandomString(int length)
    {
        Random random = new Random();
        const string chars = "abcdefghijklmnpqrstwxyz123456789";
        return new string(Enumerable.Repeat(chars, length)
          .Select(s => s[random.Next(s.Length)]).ToArray());
    }
    protected void btnResetPassword_Click(object sender, EventArgs e)
    {
        try
        {
            int count = 0;
            if (rdList.SelectedValue == "1")
            {
                string msg = "";
                foreach (RepeaterItem r in rptStudent.Items)
                {
                    
                    CheckBox chk = (CheckBox)r.FindControl("chkrow");
                    if (chk.Checked)
                    {   string pass = RandomString(8);
                        HiddenField mobile = (HiddenField)r.FindControl("hdnStMobile");
                        HiddenField username = (HiddenField)r.FindControl("hdnUserName");
                        HiddenField Name = (HiddenField)r.FindControl("hdnName");
                        new dalUser().ChangePassword(username.Value, EncryptionDecryption.Encrypt(pass, true));
                        msg = "Dear " + Name.Value + ", Your password Changed. Login to www.prps.edu.bd. Current username=";
                        msg += username.Value + " and password=" + pass + " ---PRPS";
                        dalCommon.SendSMS("", "", "PRPS", mobile.Value, msg);
                        //dalCommon.SendSMS("", "", "PRPS", "01992661774", msg);
                        //dalCommon.SendSMS("", "", "PRPS", "01912257203", msg);
                        count++;
                    }
                }
            }
            else if (rdList.SelectedValue == "2")
            {
                string msg = "";
                foreach (RepeaterItem r in rptTeacher.Items)
                {
                    CheckBox chk = (CheckBox)r.FindControl("chkrow");
                    if (chk.Checked)
                    {
                        string pass = RandomString(8);
                        HiddenField mobile = (HiddenField)r.FindControl("hdnMobile");
                        HiddenField username = (HiddenField)r.FindControl("hdnUserName");
                        HiddenField Name = (HiddenField)r.FindControl("hdnName");
                        new dalUser().ChangePassword(username.Value, EncryptionDecryption.Encrypt(username.Value, true));
                        msg = "Dear " + Name.Value + ", Your password Changed. Login to www.prps.edu.bd. Current username=";
                        msg += username.Value + " and password=" + pass + " ---PRPS";
                        dalCommon.SendSMS("", "", "PRPS", mobile.Value, msg);
                        count++;
                    }
                }
            }
            string ct = count.ToString() + " Message Sent";
            MessageController.Show(ct, MessageType.Information, Page);
        }
        catch
        {
            MessageController.Show("Something is wrong. Please contact with admin", MessageType.Error, Page);
        }
    }
}