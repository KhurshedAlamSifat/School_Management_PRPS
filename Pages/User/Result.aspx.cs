﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_User_Result : BasePage
{
    dalReport obj = new dalReport();
    public DataSet dsGrading = new Grading();
    public static List<Tuple<string, string, string>> resultInfo;
    public static List<Tuple<string, string>> GPA;
    List<string> regNo = new List<string>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            pnlResult.Visible = false;
            Load();
        }
    }
    #region Load Data
    protected void Load()
    {
        ddlYear.DataSource = new Common().GetAll("bs_Year");
        ddlYear.DataBind();

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
    #endregion
    protected void btnReport_Click(object sender, EventArgs e)
    {
        double totalpoint = 0;
        decimal gpa = 0;
        bool flag = false;
        int count = 0;
        int failSubject = 0;
        string criteria = GetCriteria();
        DataTable dt = CalculateResult(criteria);
        if (dt.Rows.Count > 0)
        {
            pnlResult.Visible = true;
            foreach (DataRow dr in dt.Rows)
            {
                count++;
                if (dr["GradePoint"].ToString() == "0")
                {
                    flag = true;
                    failSubject++;
                }
                else
                {
                    totalpoint += Convert.ToDouble(dr["GradePoint"].ToString());
                }
            }
            gpa = Math.Round(Convert.ToDecimal(totalpoint / count), 2);
            lblName.Text = dt.Rows[0]["NameEng"].ToString();
            lblFather.Text = dt.Rows[0]["FatherNameEng"].ToString();
            lblMother.Text = dt.Rows[0]["MotherNameEng"].ToString();
            lblClass.Text = ddlClass.SelectedItem.Text;
            lblGroup.Text = ddlGroup.SelectedItem.Text;
            lblShift.Text = ddlShift.SelectedItem.Text;
            lblSection.Text = ddlSection.SelectedItem.Text;
            lblRegNo.Text = dt.Rows[0]["RegNo"].ToString();
            if (flag)
            {
                lblGPA.Text = "Fail in " + failSubject + "  subject(s)";
                lblGPA.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                lblGPA.Text = gpa.ToString("0.00");
                lblGPA.ForeColor = System.Drawing.Color.Green;
            }

            lblExamType.Text = ddlExamType.SelectedItem.Text;
            rptResult.DataSource = dt;
            rptResult.DataBind();
        }
        else
        {
            pnlResult.Visible = false;
        }
    }


    public DataTable CalculateResult(string criteria)
    {
        resultInfo = new List<Tuple<string, string, string>>();
        DataTable dtMarks = null;
        if (!string.IsNullOrEmpty(criteria))
        {
            dtMarks = obj.GetMarks(criteria);
        }
        DataTable dtTempMarks = dtMarks.Copy();
        foreach (DataColumn col in dtTempMarks.Columns)
        {
            col.ReadOnly = false;
        }
        foreach (DataRow drr in dtMarks.Rows)
        {
            decimal previousGrade = -1;
            Boolean isFail = true;
            DataRow[] drExists = dtTempMarks.Select("RegNo='" + drr["RegNo"].ToString() + "' and SubjectId=" + drr["SubjectId"]);
            if (drExists.Count() <= 0)
            {
                continue;
            }
            DataRow dr = drExists[0];
            dr.BeginEdit();
            if (IsPass(dr))
            {
                if (!resultInfo.Any(t => t.Item1 == drr["RegNo"].ToString() && t.Item2 == drr["SubId"].ToString()))
                {
                    resultInfo.Add(new Tuple<string, string, string>(drr["RegNo"].ToString(), drr["SubId"].ToString(), drr["PaperNo"].ToString()));
                    if (drr["CategoryId"].ToString() == "1" || drr["CategoryId"].ToString() == "4")
                    {
                        dr["ConvertedMarks"] = Convert.ToDecimal(dr["ConvertedMarks"].ToString());
                        dr["SubjectiveMarks"] = Convert.ToDecimal(dr["SubjectiveMarks"].ToString());
                        dr["ObjectiveMarks"] = Convert.ToDecimal(dr["ObjectiveMarks"].ToString());
                        dr["PracticalMarks"] = Convert.ToDecimal(dr["PracticalMarks"].ToString());
                        dr["OtherMarks"] = Convert.ToDecimal(dr["OtherMarks"].ToString());
                        GradeCalculation(dr);
                    }
                }
                else
                {
                    if (drr["CategoryId"].ToString() == "1" || drr["CategoryId"].ToString() == "4")
                    {
                        continue;
                    }
                    var previousResult = SelectionPrevious(dr["RegNo"].ToString(), dr["SubId"].ToString());
                    foreach (var r in previousResult)
                    {
                        DataRow[] drPreviousMarks = dtTempMarks.Select("RegNo='" + r.Item1 + "' and SubId='" + r.Item2 + "' and PaperNo='" + r.Item3 + "' ");
                        if (drPreviousMarks.Count() > 0)
                        {
                            previousGrade = Convert.ToDecimal(drPreviousMarks[0]["GradePoint"].ToString());
                            dr["ConvertedMarks"] = ((Convert.ToDecimal(dr["ConvertedMarks"].ToString()) + Convert.ToDecimal(drPreviousMarks[0]["ConvertedMarks"].ToString())) / 2).ToString();
                            dr["SubjectiveMarks"] = ((Convert.ToDecimal(dr["SubjectiveMarks"].ToString()) + Convert.ToDecimal(drPreviousMarks[0]["SubjectiveMarks"].ToString())) / 2).ToString();
                            dr["ObjectiveMarks"] = ((Convert.ToDecimal(dr["ObjectiveMarks"].ToString()) + Convert.ToDecimal(drPreviousMarks[0]["ObjectiveMarks"].ToString())) / 2).ToString();
                            dr["PracticalMarks"] = (Convert.ToDecimal(dr["PracticalMarks"].ToString()) + Convert.ToDecimal(drPreviousMarks[0]["PracticalMarks"].ToString())).ToString();
                            dr["OtherMarks"] = (Convert.ToDecimal(dr["OtherMarks"].ToString()) + Convert.ToDecimal(drPreviousMarks[0]["OtherMarks"].ToString())).ToString();
                            GradeCalculation(dr);
                            foreach (DataRow drprevious in drPreviousMarks)
                            {
                                if (drprevious["Id"].ToString() != dr["Id"].ToString())
                                {
                                    dtTempMarks.Rows.Remove(drprevious);
                                }
                            }
                        }
                    }
                }
            }
            else
            {
                if (!resultInfo.Any(t => t.Item1 == drr["RegNo"].ToString() && t.Item2 == drr["SubId"].ToString()))
                {
                    resultInfo.Add(new Tuple<string, string, string>(drr["RegNo"].ToString(), drr["SubId"].ToString(), drr["PaperNo"].ToString()));
                    dr["GradeLetter"] = "F";
                    dr["GradePoint"] = "0";
                }
                else
                {
                    if (drr["CategoryId"].ToString() == "1" || drr["CategoryId"].ToString() == "4")
                    {
                        continue;
                    }
                    var previousResult = SelectionPrevious(dr["RegNo"].ToString(), dr["SubId"].ToString());
                    foreach (var r in previousResult)
                    {
                        DataRow[] drPreviousMarks = dtTempMarks.Select("RegNo='" + r.Item1 + "' and SubId='" + r.Item2 + "' and PaperNo='" + r.Item3 + "' ");
                        if (drPreviousMarks.Count() > 0)
                        {
                            dr["GradeLetter"] = "F";
                            dr["GradePoint"] = "0";
                            foreach (DataRow drprevious in drPreviousMarks)
                            {
                                if (drprevious["Id"].ToString() != dr["Id"].ToString())
                                {
                                    dtTempMarks.Rows.Remove(drprevious);
                                }
                            }
                        }
                    }
                }
            }
            dr.EndEdit();
        }
        return dtTempMarks;
    }

    private static IEnumerable<Tuple<string, string, string>> SelectionPrevious(string s1, string s2)
    {
        var ret = from t in resultInfo
                  where t.Item1 == s1 && t.Item2 == s2
                  select new Tuple<string, string, string>(t.Item1, t.Item2, t.Item3);
        return ret;
    }
    public Boolean IsPass(DataRow dr)
    {
        double subjective = Convert.ToDouble(dr["SubjectiveMarks"].ToString());
        double objective = Convert.ToDouble(dr["ObjectiveMarks"].ToString());
        DataTable dtFailMarks = new dalFailSystem().GetBySubjectId(Convert.ToInt32(dr["SubjectId"].ToString()));
        if ((subjective >= Convert.ToDouble(dtFailMarks.Rows[0]["SubjectiveFailMarks"])) && (objective >= Convert.ToDouble(dtFailMarks.Rows[0]["ObjectiveFailMarks"])))
            return true;
        return false;
    }
    public void GradeCalculation(DataRow dr)
    {
        DataTable dtGrade = new Common().GetAll("rs_Grade");
        foreach (DataRow drg in dtGrade.Rows)
        {
            double totalMarks = Convert.ToDouble(dr["ConvertedMarks"]);
            if ((totalMarks >= Convert.ToDouble(drg["StartMarks"])) && (totalMarks < Convert.ToDouble(drg["EndMarks"]) + 1))
            {
                dr["GradeLetter"] = drg["GradeName"].ToString();
                dr["GradePoint"] = drg["GradePoint"].ToString();
            }
        }
    }

    #region Get Criteria
    protected string GetCriteria()
    {
        string criteria = "";
        if (ddlYear.SelectedValue != "")
        {
            if (criteria == "")
                criteria = "rs_ObtainMarks.YearId=" + ddlYear.SelectedItem.Text;
            else
                criteria += "rs_ObtainMarks.YearId=" + ddlYear.SelectedItem.Text;
        }

        if (ddlClass.SelectedValue != "")
        {
            if (criteria == "")
                criteria = "er_StudentToClass.ClassId=" + ddlClass.SelectedValue;
            else
                criteria += " and er_StudentToClass.ClassId=" + ddlClass.SelectedValue;
        }
        if (ddlGroup.SelectedValue != "")
        {
            if (criteria == "")
                criteria = "er_StudentToClass.GroupId=" + ddlGroup.SelectedValue;
            else
                criteria += " and er_StudentToClass.GroupId=" + ddlGroup.SelectedValue;
        }
        if (ddlShift.SelectedValue != "")
        {
            if (criteria == "")
                criteria = "er_StudentToClass.ShiftId=" + ddlShift.SelectedValue;
            else
                criteria += " and er_StudentToClass.ShiftId=" + ddlShift.SelectedValue;
        }
        if (ddlSection.SelectedValue != "")
        {
            if (criteria == "")
                criteria = "er_StudentToClass.SectionId=" + ddlSection.SelectedValue;
            else
                criteria += " and er_StudentToClass.SectionId=" + ddlSection.SelectedValue;
        }
        if (ddlExamType.SelectedValue != "")
        {
            if (criteria == "")
                criteria = "rs_ObtainMarks.ExamTypeId=" + ddlExamType.SelectedValue;
            else
                criteria += " and rs_ObtainMarks.ExamTypeId=" + ddlExamType.SelectedValue;
        }
        if (tbxRollNo.Text != "")
        {
            if (criteria == "")
                criteria = "er_StudentToClass.RollNo=" + tbxRollNo.Text;
            else
                criteria += " and er_StudentToClass.RollNo=" + tbxRollNo.Text;
        }

        return criteria;
    }
    #endregion
}