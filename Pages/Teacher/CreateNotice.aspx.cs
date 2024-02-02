using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Teacher_CreateNotice : BasePage
{
    dalStudent obj = new dalStudent();
    dalNotice objNotice = new dalNotice();
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "/Pages/Teacher/" + Path.GetFileName(Request.PhysicalPath) + Request.Url.Query;
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
            Load();
            tbxDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
        }
    }

    #region Load Data
    protected void Load()
    {
        ddlYear.DataSource = new dalYear().GetDefault();
        ddlYear.DataBind();

        ddlClass.DataSource = new Common().GetAll("bs_ClassName");
        ddlClass.DataBind();

        ddlGroup.DataSource = new Common().GetAll("bs_Group");
        ddlGroup.DataBind();

        ddlShift.DataSource = new Common().GetAll("bs_Shift");
        ddlShift.DataBind();

        ddlSection.DataSource = new Common().GetAll("bs_Section");
        ddlSection.DataBind();

        ddlSpecificYear.DataSource = new dalYear().GetDefault();
        ddlSpecificYear.DataBind();

        chkSpecificClass.DataSource = new Common().GetAll("bs_ClassName");
        chkSpecificClass.DataBind();

        rptTeacher.DataSource = new dalTeacher().GetAll();
        rptTeacher.DataBind();
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
    public DataTable GetPerson()
    {
        DataTable dt = new DataTable("dtPerson");
        dt.Columns.Add("Id", typeof(int));
        dt.Columns.Add("NoticeId", typeof(int));
        return dt;
    }
    protected void btnNotice_Click(object sender, EventArgs e)
    {
        try
        {
            string AttachFile = "";
            if (flAttachment.HasFile)
            {
                AttachFile = Guid.NewGuid() + "-" + flAttachment.FileName;
                string MediumImagePath = Server.MapPath("~/VariableContent/NoticeAttachment/" + AttachFile);
                flAttachment.SaveAs(string.Concat(MediumImagePath));

            }
            int ID = objNotice.Insert(tbxName.Text, tbxShortDescription.Text, tbxDetails.Content, dalCommon.DateFormatYYYYMMDD(tbxDate.Text), Page.User.Identity.Name, DateTime.Now, AttachFile);
            if (ID > 0)
            {
                #region Normal Notification

                if (rdList.SelectedValue == "1")
                {
                    if (rdList1.SelectedValue == "1")
                    {
                        DataTable dt = new dalYear().GetDefault();
                        if (dt.Rows.Count > 0)
                        {
                            objNotice.InsertForAllClass(Convert.ToInt32(dt.Rows[0]["Year"]), 0, ID);
                        }
                    }
                    else if (rdList1.SelectedValue == "2")
                    {
                        foreach (ListItem li in chkSpecificClass.Items)
                        {
                            if (li.Selected)
                            {
                                objNotice.InsertForAllClass(Convert.ToInt32(ddlSpecificYear.SelectedItem.Text), Convert.ToInt32(li.Value), ID);
                            }
                        }

                    }
                    else
                    {
                        DataTable dtStudent = GetPerson();
                        foreach (RepeaterItem item in rptStudent.Items)
                        {
                            CheckBox chkRow = (CheckBox)item.FindControl("chkrow");
                            HiddenField hdnId = (HiddenField)item.FindControl("hdnStudentId");
                            if (chkRow.Checked)
                            {
                                dtStudent.Rows.Add(Convert.ToInt32(hdnId.Value), ID);
                            }
                        }
                        objNotice.InsertForSpecificStudent(dtStudent);
                    }
                }
                else if (rdList.SelectedValue == "2")
                {
                    DataTable dtPerson = GetPerson();
                    foreach (RepeaterItem item in rptTeacher.Items)
                    {
                        CheckBox chkRow = (CheckBox)item.FindControl("chkrow");
                        HiddenField hdnId = (HiddenField)item.FindControl("hdnTeacherId");
                        if (chkRow.Checked)
                        {
                            dtPerson.Rows.Add(Convert.ToInt32(hdnId.Value), ID);
                        }
                    }
                    objNotice.InsertForSpecificTeacher(dtPerson);
                }
                #endregion
            }
            MessageController.Show(MessageCode.SaveSucceeded, MessageType.Information, Page);
            ClearAll();
        }
        catch
        {
            MessageController.Show(MessageCode.ErrorLog_ClearFailed, MessageType.Error, Page);
        }
    }
    private void ClearAll()
    {
        tbxDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
        tbxDetails.Content = "";
        tbxName.Text = "";
        tbxRoll.Text = "";
        tbxShortDescription.Text = "";
    }
}