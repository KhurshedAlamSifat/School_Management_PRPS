using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Academic_StudentInfo : System.Web.UI.Page
{
    dalStudent objSutdent = new dalStudent();
    protected string CampusNo = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        CampusNo = Request.QueryString["CampusNo"] ?? "1";

        if (Common.SessionInfo == null)
        {
            Common.SessionInfo = new bdoSessionInfo();
        }
        if (CampusNo == "1")
        {
            Common.SessionInfo.Branch = 1;
        }
        else if (CampusNo == "2")
        {
            Common.SessionInfo.Branch = 2;
        }
        else
        {
            Common.SessionInfo.Branch = 3;
        }
        if (!IsPostBack)
        {
            string criteria = "Year=" + DateTime.Now.Year.ToString();
            DataTable dt = objSutdent.GetStudentInformation(criteria);

            lblTotalStudent.Text = dt.Rows.Count.ToString();
            lblTotalMaleStudent.Text = dt.AsEnumerable().Where(r => r.Field<string>("Gender") == "Male").Count().ToString();
            lblTotalFemaleStudent.Text = dt.AsEnumerable().Where(r => r.Field<string>("Gender") == "Female").Count().ToString();

            // DataTable dt2 = dt.AsEnumerable()
            //.GroupBy(r => new { Col1 = r["Class"] })
            //.Select(g => g.Count())
            //.CopyToDataTable();

            var query = from row in dt.AsEnumerable()
                        group row by row.Field<string>("Class") into grp
                        select new
                        {
                            Class = grp.Key,
                            TotalStudent = grp.Count(),
                            TotalMaleStudent = grp.AsEnumerable().Where(x => x["Gender"].ToString() == "Male").ToList().Count,
                            TotalFemaleStudent = grp.AsEnumerable().Where(x => x["Gender"].ToString() == "Female").ToList().Count
                        };

            rpt.DataSource = query;
            rpt.DataBind();

            BindChart();
            //lblOnlineUser.Text = Membership.GetNumberOfUsersOnline().ToString();
        }
    }
    [WebMethod]
    public static ArrayList ClassWiseStudent(int pData)
    {
        ArrayList list = new ArrayList();
        DataTable dt = new dalStudent().GetStudentForAllClass(pData);
        foreach (DataRow row in dt.Rows)
        {
            list.Add(new ListItem(
                   row["ClassName"].ToString(),
                   row["Student"].ToString()
                    ));
        }

        return list;
    }

    private void BindChart()
    {
        DataTable dsChartData = new DataTable();
        StringBuilder strScript = new StringBuilder();

        try
        {
            //dsChartData = new dalStudent().GetStudentForAllClass(DateTime.Now.Year);
            //rpt.DataSource = dsChartData;
            //rpt.DataBind();
        }
        catch
        {
        }
        finally
        {
            dsChartData.Dispose();
            strScript.Clear();
        }
    }
}