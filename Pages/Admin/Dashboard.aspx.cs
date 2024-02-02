using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Admin_Dashboard : BasePage
{
    dalDashbord obj = new dalDashbord();
    protected void Page_Load(object sender, EventArgs e)
    {
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
                LoadClassInformation();
            }
            Common.LoadDropdown(ddlYear, "bs_Year", 1, 1);
            DataTable dt = new dalYear().GetDefault();
            if (dt.Rows.Count > 0)
            {
                ddlYear.SelectedValue = dt.Rows[0][1].ToString();
            }
            lblStudent.Text = obj.GetStudent().ToString();
            lblTeacher.Text = obj.GetTeacher().ToString();
            lblUniqueVisit.Text = obj.GetUniqueVisitor().ToString();
            BindChart();
            //lblOnlineUser.Text = Membership.GetNumberOfUsersOnline().ToString();
        }
    }
    protected void LoadYear()
    {
        DataTable dt = new Common().GetAll("bs_Year");
        ddlYear.DataSource = dt;
        ddlYear.DataBind();
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
            dsChartData = new dalStudent().GetStudentForAllClass(Convert.ToInt32(ddlYear.SelectedValue));

            strScript.Append(@"<script type='text/javascript'>  
                    google.load('visualization', '1.1', {packages: ['corechart']}); </script>  
                      
                    <script type='text/javascript'>  
                     
                    function drawChart() {         
                    var data = google.visualization.arrayToDataTable([  
                    ['Class Name', 'Number of Student'],");

            foreach (DataRow row in dsChartData.Rows)
            {
                strScript.Append("['" + row["ClassName"] + "'," + row["Student"] + "],");
            }
            strScript.Remove(strScript.Length - 1, 1);
            strScript.Append("]);");

            strScript.Append(@" var options = {     
                                    title: '',            
                                    is3D: true,          
                                    };   ");

            strScript.Append(@"var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));          
                                chart.draw(data, options);        
                                }    
                            google.setOnLoadCallback(drawChart);  
                            ");
            strScript.Append(" </script>");

            ltScripts.Text = strScript.ToString();
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


    protected void LoadClassInformation()
    {
        if (SessionManager.SessionName.UserName != "")
        {
            DataTable dt = new dalStudent().ClassInfoByUserId(SessionManager.SessionName.UserId);
            {
                if (dt.Rows.Count > 0)
                {
                    Common.SessionInfo.StudentId = Convert.ToInt32(dt.Rows[0]["StudentId"].ToString());
                    Common.SessionInfo.StudentToClassId = Convert.ToInt32(dt.Rows[0]["ID"].ToString());
                    Common.SessionInfo.ClassId = Convert.ToInt32(dt.Rows[0]["ClassId"].ToString());
                    Common.SessionInfo.GroupId = Convert.ToInt32(dt.Rows[0]["GroupId"].ToString());
                    Common.SessionInfo.ShiftId = Convert.ToInt32(dt.Rows[0]["ShiftId"].ToString());
                    Common.SessionInfo.SectionId = Convert.ToInt32(dt.Rows[0]["SectionId"].ToString());
                }
            }
        }
    }
    protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindChart();
    }
}