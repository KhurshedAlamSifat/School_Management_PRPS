using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Administration_StudentAttendence : BasePage
{
    dalStudent obj = new dalStudent();
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "/Pages/Administration/" + Path.GetFileName(Request.PhysicalPath) + Request.Url.Query;
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
            btnSave.Visible = false;
            //tbxDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
            tbxDate.Text = DateTime.Now.ToString("yyyy/MM/dd").Replace('-', '/');
            LoadDropdown();
        }
    }

    #region Load All Dropdown
    protected void LoadDropdown()
    {
        Common.LoadDropdown(ddlYear, "bs_Year", 1, 0);
        Common.LoadDropdown(ddlClass, "bs_ClassName", 1, 0);
        Common.LoadDropdown(ddlGroup, "bs_Group", 1, 0);
        Common.LoadDropdown(ddlShift, "bs_Shift", 1, 0);
        Common.LoadDropdown(ddlSection, "bs_Section", 1, 0);
        DataTable dt = new dalYear().GetDefault();
        if (dt.Rows.Count > 0)
        {
            ddlYear.SelectedValue = dt.Rows[0][0].ToString();
        }
    }
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
        if (tbxRoll.Text != "")
        {
            if (criteria == "")
                criteria = "RollNo=" + tbxRoll.Text;
            else
                criteria += " and RollNo=" + tbxRoll.Text;
        }

        return criteria;
    }
    #endregion
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        LoadAttendance();
    }

    protected void LoadAttendance()
    {
        string criteria = GetCriteria();
        DataTable dt = obj.GetByCriteria(criteria);
        if (dt.Rows.Count > 0)
        {
            rptStudent.DataSource = dt;
            rptStudent.DataBind();
            btnSave.Visible = true;
            DataTable dtAttendance = obj.AttendenceByDateAndCriteria(Convert.ToDateTime(tbxDate.Text), Convert.ToInt32(rdList.SelectedValue));
            if (dtAttendance.Rows.Count > 0)
            {
                foreach (RepeaterItem item in rptStudent.Items)
                {
                    CheckBox chkRow = (CheckBox)item.FindControl("chkrow");
                    HiddenField hdnStudentId = (HiddenField)item.FindControl("hdnStudentId");
                    foreach (DataRow dr in dtAttendance.Rows)
                    {
                        if (hdnStudentId.Value == dr["StudentToClassId"].ToString() && Convert.ToBoolean(dr["IsPresent"]) == true)
                        {
                            chkRow.Checked = true;
                        }
                    }

                }
            }

        }
        else
        {
            rptStudent.DataSource = null;
            rptStudent.DataBind();
            btnSave.Visible = false;
        }
    }
    protected DataTable Attendence()
    {
        DataTable dt = new DataTable("dtAttendence");
        dt.Columns.Add("StId", typeof(int));
        dt.Columns.Add("Present", typeof(bool));
        dt.Columns.Add("TypeAtt", typeof(Int16));

        dt.Columns.Add("Mobile", typeof(string));
        dt.Columns.Add("Email", typeof(string));
        dt.Columns.Add("NameEng", typeof(string));
        dt.Columns.Add("ClassName", typeof(string));
        dt.Columns.Add("GroupName", typeof(string));
        dt.Columns.Add("Shift", typeof(string));
        dt.Columns.Add("Section", typeof(string));

        return dt;
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        DataTable dt = Attendence();
        DateTime date = Convert.ToDateTime(tbxDate.Text);
        string month = date.Month.ToString();
        string year = date.Year.ToString();
        if (rdList.SelectedValue != "")
        {
            foreach (RepeaterItem item in rptStudent.Items)
            {
                CheckBox chkRow = (CheckBox)item.FindControl("chkrow");
                HiddenField hdnStudentId = (HiddenField)item.FindControl("hdnStudentId");

                HiddenField hdnMobile = (HiddenField)item.FindControl("hdnMobile");
                HiddenField hdnEmail = (HiddenField)item.FindControl("hdnEmail");
                HiddenField hdnNameEng = (HiddenField)item.FindControl("hdnNameEng");
                HiddenField hdnClassName = (HiddenField)item.FindControl("hdnClassName");
                HiddenField hdnGroupName = (HiddenField)item.FindControl("hdnGroupName");
                HiddenField hdnShift = (HiddenField)item.FindControl("hdnShift");
                HiddenField hdnSection = (HiddenField)item.FindControl("hdnSection");
                //if (chkRow.Checked)
                ////{
                //    DataTable dtAttendance = obj.AttendenceByDateAndCriteria(Convert.ToDateTime(tbxDate.Text), Convert.ToInt32(rdList.SelectedValue));
                //    DataRow[] attendance = dtAttendance.Select("StudentToClassId = '" + hdnStudentId.Value + "'");
                //    if (attendance.Length == 0)
                //    {
                dt.Rows.Add(
                    Convert.ToInt32(hdnStudentId.Value),
                    Convert.ToBoolean(chkRow.Checked),
                    Convert.ToInt16(rdList.SelectedValue),

                    Convert.ToString(hdnMobile.Value),
                    Convert.ToString(hdnEmail.Value),
                    Convert.ToString(hdnNameEng.Value),
                    Convert.ToString(hdnClassName.Value),
                    Convert.ToString(hdnGroupName.Value),
                    Convert.ToString(hdnShift.Value),
                    Convert.ToString(hdnSection.Value)
                    );
                //}
                // }
            }
            obj.AttendenceInsert(dt, year, month, SessionManager.SessionName.UserName, Convert.ToDateTime(tbxDate.Text));

            obj.AttendenceSendMail(dt);
            obj.AttendenceSendSMS(dt);
            MessageController.Show(MessageCode.SaveSucceeded, MessageType.Information, Page);
        }
    }
    protected void tbxDate_TextChanged(object sender, EventArgs e)
    {
        LoadAttendance();
    }
}