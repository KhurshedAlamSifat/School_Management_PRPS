using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_User_AdmissionResult : BasePage
{
    dalAdmissionMarks obj = new dalAdmissionMarks();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
   
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {
            DataTable dt = new DataTable();
            string Condisitons = @"where a.IsSelected=1 and c.ResultPublished=1 and a.Id=" + tbxApplicationId.Text;

            dt = obj.AdmissionResult(Condisitons, " TOP(1) ");
            if (dt.Rows.Count > 0)
            {
                lbResult.Text = "Congratulation! "+dt.Rows[0]["Name"].ToString()+" You are Selected..";
            }
            else
            {
                lbResult.Text = "Not Found.";
            }
        }
        catch { }
    }

}