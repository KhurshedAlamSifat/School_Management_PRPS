using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Admin_StudentAdmitCard : BasePage
{
    protected string ExamName = "";
    dalStudent objSutdent = new dalStudent();
    dalMarks objMarks = new dalMarks();
    protected void Page_Load(object sender, EventArgs e)
    {
        MessageController.Clear(Page);
        string url = "/Pages/Admin/" + Path.GetFileName(Request.PhysicalPath) + Request.Url.Query;
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
            if (SessionManager.SessionName.RoleId == 4)
            {
                tbxRegNo.Text = SessionManager.SessionName.RegNo;
                tbxRegNo.Enabled = false;
            }
            Load();
        }
    }
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


    }
    private void BindData()
    {
        string criteria = GetCriteria();
        DataTable dt = objSutdent.GetStudentInformation(criteria);
        if (dt.Rows.Count > 0)
        {
            rptReport.DataSource = dt;
            rptReport.DataBind();
        }
        else
        {
            rptReport.DataSource = null;
            rptReport.DataBind();
        }
    }
    #region Get Criteria
    protected string GetCriteria()
    {
        ExamName = tbExamName.Text;
        string criteria = "";
        if (ddlYear.SelectedValue != "")
        {
            if (criteria == "")
                criteria = "Year=" + ddlYear.SelectedValue;
            else
                criteria += " Year=" + ddlYear.SelectedValue;
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

        if (tbxRegNo.Text != "")
        {
            if (criteria == "")
                criteria = "RegNo='" + tbxRegNo.Text + "'";
            else
                criteria += " and RegNo='" + tbxRegNo.Text + "'";
        }

        return criteria;
    }
    #endregion

    protected void btnReport_Click(object sender, EventArgs e)
    {
        BindData();
    }

    //protected void rptReport_ItemDataBound(object sender, RepeaterItemEventArgs e)
    //{
    //    try
    //    {

    //        HiddenField hdn = (HiddenField)e.Item.FindControl("hdnStudentToClassId");
    //        Label lblAttedance = (Label)e.Item.FindControl("lblAttendance");
    //        Label lblComments = (Label)e.Item.FindControl("lblComments");
    //        Label lblGPA = (Label)e.Item.FindControl("lblGPA");
    //        Label lblTotalMarks = (Label)e.Item.FindControl("lblTotalMarks");
    //        Label lblPosition = (Label)e.Item.FindControl("lblPosition");
    //        Label lblExam = (Label)e.Item.FindControl("lblExam");
    //        lblExam.Text = ddlExamType.SelectedItem.Text + "-" + ddlYear.SelectedItem.Text;
    //        Repeater rptMarks = (Repeater)e.Item.FindControl("rptMarks");
    //        DataTable dt = objMarks.GetStudentMarks(Convert.ToInt32(hdn.Value), Convert.ToInt32(ddlYear.SelectedValue), Convert.ToInt32(ddlExamType.SelectedValue));
    //        if (dt.Rows.Count > 0)
    //        {
    //            lblAttedance.Text = dt.Rows[0]["Attendance"].ToString();
    //            lblTotalMarks.Text = Convert.ToDecimal(dt.Rows[0]["TotalMarks"]).ToString("0.00");
    //            lblPosition.Text = dt.Rows[0]["Positions"].ToString();
    //            if (Convert.ToInt32(dt.Rows[0]["FailedIn"]) > 0)
    //            {
    //                lblGPA.Text = "Failed in " + dt.Rows[0]["FailedIn"].ToString() + " Subject";
    //                lblComments.Text = "Comments: Not Satisfactory. Need more and more improvement";
    //            }
    //            else
    //            {
    //                decimal points = 0;
    //                decimal gpa = 0;
    //                foreach (DataRow dr in dt.Rows)
    //                {
    //                    if (Convert.ToInt32(dr["IsOptional"]) == 0 && Convert.ToInt32(dr["ResultCount"]) == 1)
    //                    {
    //                        points += string.IsNullOrEmpty(dr["GradePoint"].ToString()) ? 0 : Convert.ToDecimal(dr["GradePoint"]);
    //                    }
    //                    else if (Convert.ToInt32(dr["IsOptional"]) == 1 && Convert.ToInt32(dr["ResultCount"]) == 1)
    //                    {
    //                        if (!string.IsNullOrEmpty(dr["GradePoint"].ToString()) && Convert.ToDecimal(dr["GradePoint"]) > 2)
    //                        {
    //                            points += (string.IsNullOrEmpty(dr["GradePoint"].ToString()) ? 0 : Convert.ToDecimal(dr["GradePoint"]) - 2);
    //                        }
    //                    }
    //                }
    //                gpa = points / Convert.ToInt32(dt.Rows[0]["TotalSubject"]);
    //                if (gpa <= 5)
    //                {
    //                    lblGPA.Text = gpa.ToString("0.00");
    //                }
    //                else if (gpa > 5)
    //                {
    //                    lblGPA.Text = "5.00";
    //                }
    //                if (gpa >= 5)
    //                {
    //                    lblComments.Text = "Comments: Very Good";
    //                }
    //                else if (gpa >= 4 && gpa < 5)
    //                {
    //                    lblComments.Text = "Comments: Good. Need improvement";
    //                }
    //                else if (gpa >= 3 && gpa < 4)
    //                {
    //                    lblComments.Text = "Comments: Not Satisfactory. Need improvement";
    //                }
    //                else if (gpa < 3)
    //                {
    //                    lblComments.Text = "Comments: Not Satisfactory. Need more and more improvement";
    //                }

    //            }
    //            rptMarks.DataSource = dt;
    //            rptMarks.DataBind();
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        MessageController.Show(ex.Message, MessageType.Error, Page);
    //    }
    //}
}