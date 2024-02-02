using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Routine_RtClassRoutine : BasePage
{
    dalRtRoutine obj = new dalRtRoutine();
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "/Pages/Routine/" + System.IO.Path.GetFileName(Request.PhysicalPath) + Request.Url.Query;
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
            BindData();
        }

    }
    private void LoadDDL()
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
        DataTable dt = new dalYear().GetDefault();
        if (dt.Rows.Count > 0)
        {
            ddlYear.SelectedValue = dt.Rows[0][0].ToString();
        }
    }
    int ID
    {
        set { ViewState["ID"] = value; }
        get
        {
            try
            {
                return Convert.ToInt32(ViewState["ID"]);
            }
            catch
            {
                return 0;
            }
        }
    }
    private void loadPeriod()
    {
        if (!string.IsNullOrEmpty(ddlShift.SelectedValue))
        {
            ddlPeriod.DataSource = obj.GetPeriodByShiftId(Convert.ToInt32(ddlShift.SelectedValue));
            ddlPeriod.DataBind();
        }
        else
        {
            ddlPeriod.Items.Clear();
            ddlPeriod.DataSource = null;
            ddlPeriod.DataBind();
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {

        //ID = obj.Insert(tbxPeriod.Text, tbxStartTime.Text, tbxEndTime.Text, Convert.ToInt32(tbxOrder.Text), Convert.ToInt32(ddlShift.SelectedValue));
        //if (ID != -1)
        //    MessageController.Show(MessageCode.SaveSucceeded, MessageType.Information, Page);
        //else
        //    MessageController.Show("This gender name already exists. Please try anothor.", MessageType.Error, Page);

        BindData();
        ClearAll();
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        //obj.Update(ID, tbxPeriod.Text, tbxStartTime.Text, tbxEndTime.Text, Convert.ToInt32(tbxOrder.Text), Convert.ToInt32(ddlShift.SelectedValue));
        MessageController.Show(MessageCode.UpdateSucceeded, MessageType.Information, Page);
        BindData();
        ClearAll();
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        ClearAll();
    }
    protected void ClearAll()
    {
        //tbxPeriod.Text = "";
        //tbxStartTime.Text = "";
        //tbxEndTime.Text = "";
        //tbxOrder.Text = "";
        btnSave.Visible = true;
        btnEdit.Visible = false;
    }
    protected void BindData()
    {
        DataTable dt = obj.GetByAll();
        rpt.DataSource = dt;
        rpt.DataBind();
    }

    protected void btnEdit_Command(object sender, CommandEventArgs e)
    {
        ID = Convert.ToInt32(e.CommandArgument);
        DataTable dt = obj.GetById(ID);
        if (dt.Rows.Count > 0)
        {
            //tbxPeriod.Text = dt.Rows[0]["Period"].ToString();
            //tbxStartTime.Text = dt.Rows[0]["StartTime"].ToString();
            //tbxEndTime.Text = dt.Rows[0]["EndTime"].ToString();
            //tbxOrder.Text = dt.Rows[0]["Orders"].ToString();
            ddlShift.SelectedValue = dt.Rows[0]["ShiftId"].ToString();
        }
        btnSave.Visible = false;
        btnEdit.Visible = true;
    }
    protected void btnDelete_Command(object sender, CommandEventArgs e)
    {
        ID = Convert.ToInt32(e.CommandArgument);
        new Common().Delete("rt_Period", ID);
        MessageController.Show(MessageCode.DeleteSucceeded, MessageType.Information, Page);
        BindData();
    }

    protected void ddlShift_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}