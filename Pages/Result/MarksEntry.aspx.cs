﻿using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Result_MarksEntry : BasePage
{
    dalStudent objStudent = new dalStudent();
    dalSubject objSubject = new dalSubject();
    dalMarks objMarks = new dalMarks();
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "/Pages/Result/" + Path.GetFileName(Request.PhysicalPath) + Request.Url.Query;
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
            LoadSubject();
            pnlAssignStudent.Visible = false;
        }
    }

    #region Load Data
    protected void Load()
    {
        Common.LoadDropdown(ddlYear, "bs_Year", 1, 0);
        DataTable dt = new dalYear().GetDefault();
        if (dt.Rows.Count > 0)
        {
            ddlYear.SelectedValue = dt.Rows[0][0].ToString();
        }

        ddlClass.DataSource = new Common().GetAll("bs_ClassName");
        ddlClass.DataBind();

        ddlGroup.DataSource = new Common().GetAll("bs_Group");
        ddlGroup.DataBind();

        ddlShift.DataSource = new Common().GetAll("bs_Shift");
        ddlShift.DataBind();

        ddlSection.DataSource = new Common().GetAll("bs_Section");
        ddlSection.DataBind();

        ddlExamType.DataSource = new Common().GetAll("bs_ExamType");
        ddlExamType.DataBind();
    }

    protected void LoadSubject()
    {
        DataTable dt = objSubject.GetByClassAndGroupId(Convert.ToInt32(ddlClass.SelectedValue), Convert.ToInt32(ddlGroup.SelectedValue));
        ddlSubject.DataSource = dt;
        ddlSubject.DataBind();
    }

    protected void LoadStudentSubjectWise()
    {
        DataTable dt = objStudent.GetStudentSubjectWise(Convert.ToInt32(ddlClass.SelectedValue),
            Convert.ToInt32(ddlGroup.SelectedValue), Convert.ToInt32(ddlSubject.SelectedValue));
        rptStudent.DataSource = dt;
        rptStudent.DataBind();
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
        BindData();
    }
    protected void BindData()
    {
        string criteria = GetCriteria();
        DataTable dt = objStudent.GetStudentForMarksEntry(criteria, Convert.ToInt32(ddlSubject.SelectedValue));
        if (dt.Rows.Count > 0)
        {
            rptStudent.DataSource = dt;
            rptStudent.DataBind();
            pnlAssignStudent.Visible = true;
            ((Panel)Page.Master.FindControl("MessagePanel1").FindControl("pnlMessage")).Visible = false;
        }
        else
        {
            MessageController.Show("No student found.", MessageType.Warning, Page);
            pnlAssignStudent.Visible = false;
        }
    }
    protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadSubject();
    }
    protected void ddlGroup_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadSubject();
    }

    protected DataTable GetMarks()
    {
        DataTable dt = new DataTable("dtMarks");
        dt.Columns.Add("StId", typeof(int));
        dt.Columns.Add("SubId", typeof(int));
        dt.Columns.Add("Theory", typeof(double));
        dt.Columns.Add("Objective", typeof(double));
        dt.Columns.Add("Pracrical", typeof(double));
        dt.Columns.Add("SBS", typeof(double));
        dt.Columns.Add("CT1", typeof(double));
        dt.Columns.Add("CT2", typeof(double));
        dt.Columns.Add("CT3", typeof(double));
        return dt;
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int count = 0;
        double theory = 0;
        double objective = 0;
        double practical = 0;
        double sbs = 0;
        double ct1 = 0;
        double ct2 = 0;
        double ct3 = 0;
        decimal ctOUtOf = string.IsNullOrEmpty(tbxCTOutOf.Text) ? 0 : Convert.ToDecimal(tbxCTOutOf.Text);
        DataTable dt = GetMarks();
        foreach (RepeaterItem item in rptStudent.Items)
        {
            CheckBox chkrow = (CheckBox)item.FindControl("chkrow");
            if (chkrow.Checked)
            {
                count++;
                HiddenField hdnStudentId = (HiddenField)item.FindControl("hdnStudentId");
                TextBox tbxTheory = (TextBox)item.FindControl("tbxTheory");
                TextBox tbxObjective = (TextBox)item.FindControl("tbxObjective");
                TextBox tbxPractical = (TextBox)item.FindControl("tbxPractical");
                TextBox tbxSBS = (TextBox)item.FindControl("tbxSBS");
                TextBox tbxCT1 = (TextBox)item.FindControl("tbxCT1");
                TextBox tbxCT2 = (TextBox)item.FindControl("tbxCT2");
                TextBox tbxCT3 = (TextBox)item.FindControl("tbxCT3");
                if (tbxTheory.Text == "") theory = 0;
                else theory = Convert.ToDouble(tbxTheory.Text);

                if (tbxObjective.Text == "") objective = 0;
                else objective = Convert.ToDouble(tbxObjective.Text);

                if (tbxPractical.Text == "") practical = 0;
                else practical = Convert.ToDouble(tbxPractical.Text);

                if (tbxSBS.Text == "") sbs = 0;
                else sbs = Convert.ToDouble(tbxSBS.Text);

                if (ctOUtOf > 0)
                {
                    ct1 = string.IsNullOrEmpty(tbxCT1.Text) ? 0 : Convert.ToDouble(tbxCT1.Text);
                    ct2 = string.IsNullOrEmpty(tbxCT2.Text) ? 0 : Convert.ToDouble(tbxCT2.Text);
                    ct3 = string.IsNullOrEmpty(tbxCT3.Text) ? 0 : Convert.ToDouble(tbxCT3.Text);
                }

                dt.Rows.Add(Convert.ToInt32(hdnStudentId.Value), Convert.ToInt32(ddlSubject.SelectedValue), theory, objective, practical, sbs, ct1, ct2, ct3);
            }

        }

        if (count > 0)
        {
            objMarks.InsertMarks(dt, Convert.ToInt32(ddlYear.SelectedItem.Text), Convert.ToDouble(tbxMarksOutOf.Text), Convert.ToInt32(ddlExamType.SelectedValue), ctOUtOf, SessionManager.SessionName.UserName);
            BindData();
            MessageController.Show(MessageCode.SaveSucceeded, MessageType.Information, Page);
        }
        else
        {
            MessageController.Show("Please select at least one checkbox.", MessageType.Warning, Page);
        }
    }
    protected void ddlSubject_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindData();
    }

}