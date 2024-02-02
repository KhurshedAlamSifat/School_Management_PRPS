using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Admission_ExamSchedule : BasePage
{
    dalSubject obj = new dalSubject();
    dalRoutine objRoutine = new dalRoutine();
    dalAdmissionCircular objCircular = new dalAdmissionCircular();
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "/Pages/Admission/" + Path.GetFileName(Request.PhysicalPath) + Request.Url.Query;
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
            SetInitialRow();
        }
    }
    #region Dynamic Row

    private ArrayList GetDummyData()
    {
        ArrayList arr = new ArrayList();
        DataTable dt = objCircular.GetByYear(Convert.ToInt32(ddlYear.SelectedValue));
        foreach (DataRow dr in dt.Rows)
        {
            arr.Add(new ListItem(dr["Title"].ToString(), dr["Id"].ToString()));
        }
        return arr;
    }

    private void FillDropDownList(DropDownList ddl)
    {
        ArrayList arr = GetDummyData();
        foreach (ListItem item in arr)
        {
            ddl.Items.Add(item);
        }
        gvRoutine.DataSource = objRoutine.AdmissionRoutineGetByYear(Convert.ToInt32(ddlYear.SelectedValue));
        gvRoutine.DataBind();
    }

    protected DataTable GetRoutine()
    {
        DataTable dt = new DataTable("dtRoutine");
        dt.Columns.Add(new DataColumn("CircularId", typeof(int)));
        dt.Columns.Add(new DataColumn("StartTime", typeof(string)));
        dt.Columns.Add(new DataColumn("EndTime", typeof(string)));
        dt.Columns.Add(new DataColumn("ExamDate", typeof(DateTime)));
        return dt;
    }

    private void SetInitialRow()
    {
        DataTable dt = new DataTable();
        DataRow dr = null;
        dt.Columns.Add(new DataColumn("PeriodNo", typeof(int)));
        dt.Columns.Add(new DataColumn("SubjectId", typeof(int)));
        dt.Columns.Add(new DataColumn("StartTime", typeof(string)));
        dt.Columns.Add(new DataColumn("EndTime", typeof(string)));
        dt.Columns.Add(new DataColumn("ExamDate", typeof(DateTime)));
        dr = dt.NewRow();
        dr["PeriodNo"] = 1;
        dr["StartTime"] = string.Empty;
        dr["EndTime"] = string.Empty;
        dt.Rows.Add(dr);
        //Store the DataTable in ViewState for future reference   
        ViewState["CurrentTable"] = dt;
        //Bind the Gridview   
        Gridview1.DataSource = dt;
        Gridview1.DataBind();
        //After binding the gridview, we can then extract and fill the DropDownList with Data   
        DropDownList ddl1 = (DropDownList)Gridview1.Rows[0].Cells[1].FindControl("ddlSubject");
        FillDropDownList(ddl1);
    }

    private void AddNewRowToGrid()
    {
        if (ViewState["CurrentTable"] != null)
        {
            DataTable dtCurrentTable = (DataTable)ViewState["CurrentTable"];
            DataRow drCurrentRow = null;

            if (dtCurrentTable.Rows.Count > 0)
            {
                drCurrentRow = dtCurrentTable.NewRow();
                drCurrentRow["PeriodNo"] = dtCurrentTable.Rows.Count + 1;

                //add new row to DataTable   
                dtCurrentTable.Rows.Add(drCurrentRow);
                //Store the current data to ViewState for future reference   

                ViewState["CurrentTable"] = dtCurrentTable;


                for (int i = 0; i < dtCurrentTable.Rows.Count - 1; i++)
                {

                    //extract the TextBox values   

                    TextBox box1 = (TextBox)Gridview1.Rows[i].Cells[1].FindControl("TextBox1");
                    TextBox box2 = (TextBox)Gridview1.Rows[i].Cells[2].FindControl("TextBox2");

                    dtCurrentTable.Rows[i]["StartTime"] = box1.Text;
                    dtCurrentTable.Rows[i]["EndTime"] = box2.Text;

                    //extract the DropDownList Selected Items   

                    DropDownList ddl1 = (DropDownList)Gridview1.Rows[i].Cells[3].FindControl("ddlSubject");
                    TextBox tbxDate = (TextBox)Gridview1.Rows[i].Cells[4].FindControl("tbxDate");


                    // Update the DataRow with the DDL Selected Items   

                    dtCurrentTable.Rows[i]["SubjectId"] = ddl1.SelectedValue;
                    dtCurrentTable.Rows[i]["ExamDate"] = DateTime.ParseExact(tbxDate.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);

                }

                //Rebind the Grid with the current data to reflect changes   
                Gridview1.DataSource = dtCurrentTable;
                Gridview1.DataBind();
            }
        }
        else
        {
            Response.Write("ViewState is null");

        }
        //Set Previous Data on Postbacks   
        SetPreviousData();
    }

    private void SetPreviousData()
    {

        int rowIndex = 0;
        if (ViewState["CurrentTable"] != null)
        {

            DataTable dt = (DataTable)ViewState["CurrentTable"];
            if (dt.Rows.Count > 0)
            {

                for (int i = 0; i < dt.Rows.Count; i++)
                {

                    TextBox box1 = (TextBox)Gridview1.Rows[i].Cells[2].FindControl("TextBox1");
                    TextBox box2 = (TextBox)Gridview1.Rows[i].Cells[3].FindControl("TextBox2");

                    DropDownList ddl1 = (DropDownList)Gridview1.Rows[rowIndex].Cells[1].FindControl("ddlSubject");
                    TextBox tbxDate = (TextBox)Gridview1.Rows[rowIndex].Cells[4].FindControl("tbxDate");

                    FillDropDownList(ddl1);

                    if (i < dt.Rows.Count - 1)
                    {

                        //Assign the value from DataTable to the TextBox   
                        box1.Text = dt.Rows[i]["StartTime"].ToString();
                        box2.Text = dt.Rows[i]["EndTime"].ToString();

                        //Set the Previous Selected Items on Each DropDownList  on Postbacks   
                        ddl1.ClearSelection();
                        ddl1.SelectedValue = dt.Rows[i]["SubjectId"].ToString();
                        //ddl1.Items.FindByText(dt.Rows[i]["SubjectId"].ToString()).Selected = true;

                        tbxDate.Text = Convert.ToDateTime(dt.Rows[i]["ExamDate"].ToString()).ToString("dd/MM/yyyy");
                        //ddl2.Items.FindByText(dt.Rows[i]["Teacher"].ToString()).Selected = true;

                    }

                    rowIndex++;
                }
            }
        }
    }
    protected void ButtonAdd_Click(object sender, EventArgs e)
    {
        AddNewRowToGrid();
    }

    protected void Gridview1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataTable dt = (DataTable)ViewState["CurrentTable"];
            LinkButton lb = (LinkButton)e.Row.FindControl("LinkButton1");
            if (lb != null)
            {
                if (dt.Rows.Count > 1)
                {
                    if (e.Row.RowIndex == dt.Rows.Count - 1)
                    {
                        lb.Visible = false;
                    }
                }
                else
                {
                    lb.Visible = false;
                }
            }
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton lb = (LinkButton)sender;
        GridViewRow gvRow = (GridViewRow)lb.NamingContainer;
        int rowID = gvRow.RowIndex;
        if (ViewState["CurrentTable"] != null)
        {

            DataTable dt = (DataTable)ViewState["CurrentTable"];
            if (dt.Rows.Count > 1)
            {
                if (gvRow.RowIndex < dt.Rows.Count - 1)
                {
                    //Remove the Selected Row data and reset row number  
                    dt.Rows.Remove(dt.Rows[rowID]);
                    ResetRowID(dt);
                }
            }

            //Store the current data in ViewState for future reference  
            ViewState["CurrentTable"] = dt;

            //Re bind the GridView for the updated data  
            Gridview1.DataSource = dt;
            Gridview1.DataBind();
        }

        //Set Previous Data on Postbacks  
        SetPreviousData();
    }

    private void ResetRowID(DataTable dt)
    {
        int rowNumber = 1;
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow row in dt.Rows)
            {
                row[0] = rowNumber;
                rowNumber++;
            }
        }
    }
    #endregion

    #region Load Data
    protected void Load()
    {
        ddlYear.DataSource = new Common().GetAll("bs_Year");
        ddlYear.DataBind();
        DataTable dt = new dalYear().GetDefault();
        if (dt.Rows.Count > 0)
        {
            ddlYear.SelectedValue = dt.Rows[0][0].ToString();
        }

    }

    #endregion

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            DataTable dt = GetRoutine();
            foreach (GridViewRow gr in Gridview1.Rows)
            {
                TextBox box1 = (TextBox)gr.Cells[2].FindControl("TextBox1");
                TextBox box2 = (TextBox)gr.Cells[3].FindControl("TextBox2");
                DropDownList ddl1 = (DropDownList)gr.Cells[1].FindControl("ddlSubject");
                TextBox tbxDate = (TextBox)gr.Cells[4].FindControl("tbxDate");
                DateTime examDate = dalCommon.DateFormatYYYYMMDD(tbxDate.Text).AddDays(1);
                dt.Rows.Add(ddl1.SelectedValue, box1.Text, box2.Text, examDate);
                objRoutine.AdmissionRoutineDelete(Convert.ToInt32(ddl1.SelectedValue));
            }
            if (dt.Rows.Count > 0)
            {
                objRoutine.AdmissionRoutineInsert(dt);
                MessageController.Show(MessageCode.SaveSucceeded, MessageType.Information, Page);
                gvRoutine.DataSource = objRoutine.AdmissionRoutineGetByYear(Convert.ToInt32(ddlYear.SelectedValue));
                gvRoutine.DataBind();
            }
        }
        catch { }
    }
    protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList ddlSubject = (DropDownList)Gridview1.Rows[0].Cells[1].FindControl("ddlSubject");
        ddlSubject.Items.Clear();
        FillDropDownList(ddlSubject);
    }
}