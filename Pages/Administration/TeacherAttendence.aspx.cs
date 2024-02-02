using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Administration_TeacherAttendence : BasePage
{
    dalTeacher obj = new dalTeacher();

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
            tbxDate.Text = DateTime.Now.Date.ToString("dd/MM/yyyy");
            LoadDate();
            LoadTeacher();
        }
    }
    public List<DateTime> getAllDates(int year, int month)
    {
        var ret = new List<DateTime>();
        for (int i = 1; i <= DateTime.DaysInMonth(year, month); i++)
        {
            DateTime dt = new DateTime(year, month, i);
            ret.Add(dt);
        }
        return ret;
    }
    protected void LoadDate()
    {
        rptDate.DataSource = getAllDates(DateTime.Now.Year, DateTime.Now.Month);
        rptDate.DataBind();
    }

    protected void LoadTeacher()
    {
        DataTable dt = obj.GetAll();
        ddlTeacher.DataSource = dt;
        ddlTeacher.DataBind();

        rptTeacher.DataSource = dt;
        rptTeacher.DataBind();
    }
    protected DataTable Attendence()
    {
        DataTable dtAttendence = new DataTable("dtAttendence");
        dtAttendence.Columns.Add("Dt", typeof(DateTime));
        dtAttendence.Columns.Add("TId", typeof(int));
        dtAttendence.Columns.Add("timeIn", typeof(string));
        dtAttendence.Columns.Add("OutTime", typeof(string));
        return dtAttendence;
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        DataTable dt = Attendence();
        string year = "";
        string month = "";
        if (rdList.SelectedValue == "1")
        {
            year = DateTime.ParseExact(tbxDate.Text, "dd/MM/yyyy", null).Year.ToString();
            month = DateTime.ParseExact(tbxDate.Text, "dd/MM/yyyy", null).Month.ToString();
            int r = rptTeacher.Items.Count;
            foreach (RepeaterItem item in rptTeacher.Items)
            {
                HiddenField hdnId = (HiddenField)item.FindControl("hdnId");
                TextBox tbxIn = (TextBox)item.FindControl("tbxIn");
                TextBox tbxOut = (TextBox)item.FindControl("tbxOut");
                if (tbxIn.Text != "" && tbxOut.Text != "")
                {
                    dt.Rows.Add(DateTime.ParseExact(tbxDate.Text, "dd/MM/yyyy", null), Convert.ToInt32(hdnId.Value), tbxIn.Text, tbxOut.Text);
                }
            }
        }
        else
        {
            foreach (RepeaterItem ri in rptDate.Items)
            {
                HiddenField hdnDate = (HiddenField)ri.FindControl("hdnDate");
                TextBox tbxIn = (TextBox)ri.FindControl("intime");
                TextBox tbxOut = (TextBox)ri.FindControl("tbxOut");
                year = Convert.ToDateTime(hdnDate.Value).Year.ToString();
                month = Convert.ToDateTime(hdnDate.Value).Month.ToString();
                if (tbxIn.Text != "" && tbxOut.Text != "")
                {
                    dt.Rows.Add(hdnDate.Value, Convert.ToInt32(ddlTeacher.SelectedValue), tbxIn.Text, tbxOut.Text);
                }

            }
        }
        if (dt.Rows.Count > 0)
        {
            obj.AttendenceInsert(dt, year, month, Page.User.Identity.Name, DateTime.Now);
            MessageController.Show(MessageCode.SaveSucceeded, MessageType.Information, Page);
        }
        else
        {
            MessageController.Show("No Data Found to Insert.", MessageType.Information, Page);
        }

    }
    protected void tbxDate_TextChanged(object sender, EventArgs e)
    {
        if(DateTime.ParseExact(tbxDate.Text, "dd/MM/yyyy", null)>DateTime.Now)
        {
            MessageController.Show("Selected date must be smaller then current date.",MessageType.Error,Page);
            return;
        }
        else
        {
            DataTable dt = obj.GetByDate(dalCommon.DateFormatYYYYMMDD(tbxDate.Text));
            rptTeacher.DataSource = dt;
            rptTeacher.DataBind();
        }
    }
}